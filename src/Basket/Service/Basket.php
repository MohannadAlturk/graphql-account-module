<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Basket\Service;

use OxidEsales\GraphQL\Account\Account\DataType\Customer as CustomerDataType;
use OxidEsales\GraphQL\Account\Account\Exception\CustomerNotFound;
use OxidEsales\GraphQL\Account\Basket\DataType\Basket as BasketDataType;
use OxidEsales\GraphQL\Account\Basket\DataType\BasketOwner as BasketOwnerDataType;
use OxidEsales\GraphQL\Account\Basket\Exception\BasketAccessForbidden;
use OxidEsales\GraphQL\Account\Basket\Exception\BasketNotFound;
use OxidEsales\GraphQL\Account\Basket\Infrastructure\Basket as BasketInfraService;
use OxidEsales\GraphQL\Account\Basket\Infrastructure\Repository as BasketRepository;
use OxidEsales\GraphQL\Base\Exception\InvalidLogin;
use OxidEsales\GraphQL\Base\Exception\InvalidToken;
use OxidEsales\GraphQL\Base\Exception\NotFound;
use OxidEsales\GraphQL\Base\Service\Authentication;
use OxidEsales\GraphQL\Base\Service\Authorization;
use OxidEsales\GraphQL\Base\Service\Legacy;
use OxidEsales\GraphQL\Catalogue\Product\Service\Product as ProductService;
use OxidEsales\GraphQL\Catalogue\Shared\Infrastructure\Repository;

final class Basket
{
    /** @var Repository */
    private $repository;

    /** @var BasketRepository */
    private $basketRepository;

    /** @var Authentication */
    private $authenticationService;

    /** @var Authorization */
    private $authorizationService;

    /** @var Legacy */
    private $legacyService;

    /** @var BasketInfraService */
    private $basketInfraService;

    /** @var ProductService */
    private $productService;

    public function __construct(
        Repository $repository,
        BasketRepository $basketRepository,
        Authentication $authenticationService,
        Authorization $authorizationService,
        Legacy $legacyService,
        BasketInfraService $basketInfraService,
        ProductService $productService
    ) {
        $this->repository            = $repository;
        $this->basketRepository      = $basketRepository;
        $this->authenticationService = $authenticationService;
        $this->authorizationService  = $authorizationService;
        $this->legacyService         = $legacyService;
        $this->basketInfraService    = $basketInfraService;
        $this->productService        = $productService;
    }

    /**
     * @throws BasketNotFound
     * @throws InvalidToken
     */
    public function basket(string $id): BasketDataType
    {
        $basket = $this->basketRepository->getBasketById($id);

        if ($basket->public() === false &&
            !$basket->belongsToUser($this->authenticationService->getUserId())
        ) {
            throw new InvalidToken('Basket is private.');
        }

        return $basket;
    }

    public function basketByOwnerAndTitle(CustomerDataType $customer, string $title): BasketDataType
    {
        return $this->basketRepository->customerBasketByTitle($customer, $title);
    }

    /**
     * @return BasketDataType[]
     */
    public function basketsByOwner(CustomerDataType $customer): array
    {
        return $this->basketRepository->customerBaskets($customer);
    }

    /**
     * @throws BasketNotFound
     * @throws InvalidToken
     */
    public function remove(string $id): bool
    {
        $basket = $this->basketRepository->getBasketById($id);

        //user can remove only his own baskets unless otherwise authorized
        if (
            $this->authorizationService->isAllowed('DELETE_BASKET')
            || $basket->belongsToUser($this->authenticationService->getUserId())
        ) {
            return $this->repository->delete($basket->getEshopModel());
        }

        throw new InvalidLogin('Unauthorized');
    }

    /**
     * @throws CustomerNotFound
     */
    public function basketOwner(string $id): BasketOwnerDataType
    {
        $ignoreSubShop = (bool) $this->legacyService->getConfigParam('blMallUsers');

        try {
            /** @var BasketOwnerDataType $customer */
            $customer = $this->repository->getById(
                $id,
                BasketOwnerDataType::class,
                $ignoreSubShop
            );
        } catch (NotFound $e) {
            throw CustomerNotFound::byId($id);
        }

        return $customer;
    }

    public function addProduct(string $basketId, string $productId, float $amount): BasketDataType
    {
        $basket = $this->basketRepository->getBasketById($basketId);

        if (!$basket->belongsToUser($this->authenticationService->getUserId())) {
            throw new InvalidLogin('Unauthorized');
        }

        $this->productService->product($productId);

        $this->basketInfraService->addProduct($basket, $productId, $amount);

        return $basket;
    }

    public function removeProduct(string $basketId, string $productId, float $amount): BasketDataType
    {
        $basket = $this->basketRepository->getBasketById($basketId);

        if (!$basket->belongsToUser($this->authenticationService->getUserId())) {
            throw new InvalidLogin('Unauthorized');
        }

        $this->basketInfraService->removeProduct($basket, $productId, $amount);

        return $basket;
    }

    /**
     * @throws InvalidLogin
     * @throws InvalidToken
     */
    public function store(BasketDataType $basket): bool
    {
        if (!$this->authenticationService->isLogged()) {
            throw new InvalidLogin('Unauthenticated');
        }

        return $this->repository->saveModel($basket->getEshopModel());
    }

    /**
     * @return BasketDataType[]
     */
    public function publicBasketsByOwnerNameOrEmail(string $owner): array
    {
        return $this->basketRepository->publicBasketsByOwnerNameOrEmail($owner);
    }

    /**
     * @throws BasketAccessForbidden
     */
    public function makePublic(string $basketId): BasketDataType
    {
        $basket = $this->basketRepository->getBasketById($basketId);

        if (!$basket->belongsToUser($this->authenticationService->getUserId())) {
            throw BasketAccessForbidden::byAuthenticatedUser();
        }
        $this->basketInfraService->makePublic($basket);

        return $basket;
    }

    /**
     * @throws BasketAccessForbidden
     */
    public function makePrivate(string $basketId): BasketDataType
    {
        $basket = $this->basketRepository->getBasketById($basketId);

        if (!$basket->belongsToUser($this->authenticationService->getUserId())) {
            throw BasketAccessForbidden::byAuthenticatedUser();
        }
        $this->basketInfraService->makePrivate($basket);

        return $basket;
    }

    /**
     * @throws BasketNotFound
     */
    private function getBasket(string $id): BasketDataType
    {
        try {
            /** @var BasketDataType $basket */
            $basket = $this->repository->getById(
                $id,
                BasketDataType::class,
                false
            );
        } catch (NotFound $e) {
            throw BasketNotFound::byId($id);
        }

        return $basket;
    }
}
