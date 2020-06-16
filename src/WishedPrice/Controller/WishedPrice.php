<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\WishedPrice\Controller;

use OxidEsales\GraphQL\Account\WishedPrice\DataType\WishedPrice as WishedPriceDataType;
use OxidEsales\GraphQL\Account\WishedPrice\DataType\WishedPriceFilterList;
use OxidEsales\GraphQL\Account\WishedPrice\Service\WishedPrice as WishedPriceService;
use OxidEsales\GraphQL\Base\Exception\InvalidToken;
use TheCodingMachine\GraphQLite\Annotations\Mutation;
use TheCodingMachine\GraphQLite\Annotations\Query;

final class WishedPrice
{
    /** @var WishedPriceService */
    private $wishedPriceService;

    public function __construct(
        WishedPriceService $wishedPriceService
    ) {
        $this->wishedPriceService = $wishedPriceService;
    }

    /**
     * @Query()
     */
    public function wishedPrice(string $id): WishedPriceDataType
    {
        return $this->wishedPriceService->wishedPrice($id);
    }

    /**
     * @Mutation()
     */
    public function wishedPriceDelete(string $id): WishedPriceDataType
    {
        return $this->wishedPriceService->delete($id);
    }

    /**
     * @Query()
     *
     * @throws InvalidToken
     *
     * @return WishedPriceDataType[]
     */
    public function wishedPrices(): array
    {
        return $this->wishedPriceService->wishedPrices(
            new WishedPriceFilterList()
        );
    }

    /**
     * @Mutation()
     */
    public function wishedPriceSet(WishedPriceDataType $wishedPrice): WishedPriceDataType
    {
        $this->wishedPriceService->save($wishedPrice);
        $this->wishedPriceService->sendNotification($wishedPrice);

        return $wishedPrice;
    }
}
