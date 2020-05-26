<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\WishedPrice\DataType;

use DateTimeImmutable;
use DateTimeInterface;
use OxidEsales\Eshop\Application\Model\PriceAlarm as WishedPriceModel;
use OxidEsales\GraphQL\Catalogue\DataType\DataType;
use TheCodingMachine\GraphQLite\Annotations\Field;
use TheCodingMachine\GraphQLite\Annotations\Type;
use TheCodingMachine\GraphQLite\Types\ID;

/**
 * @Type()
 */
class WishedPrice implements DataType
{
    /** @var WishedPriceModel */
    private $wishedPrice;

    public function __construct(
        WishedPriceModel $wishedPrice
    ) {
        $this->wishedPrice = $wishedPrice;
    }

    public function getEshopModel(): WishedPriceModel
    {
        return $this->wishedPrice;
    }

    /**
     * @return class-string
     */
    public static function getModelClass(): string
    {
        return WishedPriceModel::class;
    }

    /**
     * @Field()
     */
    public function getId(): ID
    {
        return new ID(
            $this->wishedPrice->getId()
        );
    }

    public function getUserId(): ID
    {
        return new ID(
            (string)$this->wishedPrice->getFieldData('oxuserid')
        );
    }

    public function getProductId(): ID
    {
        return new ID(
            (string)$this->wishedPrice->getFieldData('oxartid')
        );
    }

    /**
     * @Field()
     */
    public function getEmail(): string
    {
        return $this->wishedPrice->getFieldData('oxemail');
    }

    /**
     * This field gives us information about the last sent notification email.
     * When it is null it states that no notification email was sent.
     *
     * @Field()
     */
    public function getNotificationDate(): ?DateTimeInterface
    {
        $notificationDate = (string)$this->wishedPrice->getFieldData('oxsended');
        if ($notificationDate === '0000-00-00 00:00:00') {
            return null;
        }

        return new DateTimeImmutable($notificationDate);
    }

    /**
     * @Field()
     */
    public function getCreationDate(): DateTimeInterface
    {
        return new DateTimeImmutable((string)$this->wishedPrice->getFieldData('oxinsert'));
    }
}
