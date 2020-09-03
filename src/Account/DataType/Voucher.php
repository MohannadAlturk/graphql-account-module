<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Account\DataType;

use DateTimeInterface;
use OxidEsales\Eshop\Application\Model\Voucher as EshopVoucherModel;
use OxidEsales\GraphQL\Base\DataType\DateTimeImmutableFactory;
use OxidEsales\GraphQL\Catalogue\Shared\DataType\DataType;
use TheCodingMachine\GraphQLite\Annotations\Field;
use TheCodingMachine\GraphQLite\Annotations\Type;
use TheCodingMachine\GraphQLite\Types\ID;

/**
 * @Type()
 */
final class Voucher implements DataType
{
    /** @var EshopVoucherModel */
    private $voucherModel;

    public function __construct(EshopVoucherModel $voucherModel)
    {
        $this->voucherModel = $voucherModel;
    }

    public function getEshopModel(): EshopVoucherModel
    {
        return $this->voucherModel;
    }

    /**
     * @Field
     */
    public function id(): ID
    {
        return new ID($this->voucherModel->getId());
    }

    /**
     * @Field
     */
    public function number(): string
    {
        return (string) $this->voucherModel->getFieldData('OXVOUCHERNR');
    }

    /**
     * @Field
     */
    public function discount(): float
    {
        return (float) $this->voucherModel->getFieldData('OXDISCOUNT');
    }

    /**
     * @Field()
     */
    public function redeemedAt(): ?DateTimeInterface
    {
        return DateTimeImmutableFactory::fromString(
            (string) $this->voucherModel->getFieldData('OXDATEUSED')
        );
    }

    public static function getModelClass(): string
    {
        return EshopVoucherModel::class;
    }
}
