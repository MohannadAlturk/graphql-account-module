<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Shared\Shop;

use OxidEsales\Eshop\Application\Model\Basket as EshopBasketModel;
use OxidEsales\Eshop\Application\Model\BasketItem;
use OxidEsales\Eshop\Application\Model\Voucher;
use OxidEsales\EshopCommunity\Application\Model\UserBasketItem;

/**
 * Basket model extended
 *
 * @mixin Basket
 */
final class Basket extends EshopBasketModel
{
    /**
     * Add product to basket without doing any check.
     */
    public function addProductToBasket(UserBasketItem $basketItem): void
    {
        $this->_aBasketContents[] = $this->convertUserBasketItemToBasketItem($basketItem);
    }

    /**
     * Do no checks, just apply the voucher by given ID.
     */
    public function applyVoucher(string $voucherId): void
    {
        /** @var Voucher $voucher */
        $voucher = oxNew(Voucher::class);
        $voucher->load($voucherId);

        $this->_aVouchers[$voucher->getId()] = $voucher->getSimpleVoucher();
    }

    /**
     * Convert user basket item to basket item.
     */
    private function convertUserBasketItemToBasketItem(
        UserBasketItem $userBasketItem
    ): BasketItem {
        /** @var BasketItem $basketItem */
        $basketItem = oxNew(BasketItem::class);
        $basketItem->init(
            $userBasketItem->getFieldData('oxartid'),
            $userBasketItem->getFieldData('oxamount'),
            $userBasketItem->getSelList(),
            $userBasketItem->getPersParams()
        );

        //Any basket object will do to generate the item key
        $itemKey = $this->getItemKey(
            $userBasketItem->getFieldData('oxartid'),
            $userBasketItem->getSelList(),
            $userBasketItem->getPersParams()
        );
        $basketItem->setBasketItemKey($itemKey);

        return $basketItem;
    }
}
