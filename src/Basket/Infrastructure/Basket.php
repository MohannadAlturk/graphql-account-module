<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Basket\Infrastructure;

use OxidEsales\Eshop\Application\Model\UserBasket as BasketModel;
use OxidEsales\Eshop\Application\Model\UserBasketItem as BasketItemModel;
use OxidEsales\GraphQL\Account\Basket\DataType\Basket as BasketDataType;
use OxidEsales\GraphQL\Account\Basket\Exception\BasketItemNotFound;
use OxidEsales\GraphQL\Catalogue\Shared\Infrastructure\Repository;

final class Basket
{
    /** @var Repository */
    private $repository;

    public function __construct(
        Repository $repository
    ) {
        $this->repository = $repository;
    }

    public function addProduct(BasketDataType $basket, string $productId, float $amount): bool
    {
        $model = $basket->getEshopModel();
        $model->addItemToBasket($productId, $amount);

        return true;
    }

    public function removeProduct(BasketDataType $basket, string $productId, float $amount): bool
    {
        $model = $basket->getEshopModel();

        if (!$this->checkIfProductIsPresentInBasket($basket->getEshopModel(), $productId)) {
            throw BasketItemNotFound::byId($productId, $model->getId());
        }

        /** @var BasketItemModel @basketItem */
        $basketItem      = $model->getItem($productId, []);
        $amountRemaining = (float) $basketItem->getFieldData('oxamount') - $amount;

        if ($amountRemaining <= 0 || $amount == 0) {
            $amountRemaining = 0;
        }

        $model->addItemToBasket($productId, $amountRemaining, null, true);

        return true;
    }

    public function makePublic(BasketDataType $basket): bool
    {
        $model = $basket->getEshopModel();
        $model->assign([
            'oxuserbaskets__oxpublic' => 1,
        ]);

        return $this->repository->saveModel($model);
    }

    public function makePrivate(BasketDataType $basket): bool
    {
        $model = $basket->getEshopModel();
        $model->assign([
            'oxuserbaskets__oxpublic' => 0,
        ]);

        return $this->repository->saveModel($model);
    }

    private function checkIfProductIsPresentInBasket(BasketModel $model, string $productId): bool
    {
        $present     = false;
        $basketItems = $model->getItems();
        /** @var BasketItemModel $item */
        foreach ($basketItems as $item) {
            $id      = $item->getFieldData('oxartid');
            $present = ($id === $productId);

            if ($present) {
                break;
            }
        }

        return $present;
    }
}
