<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Rating\DataType;

use DateTimeImmutable;
use DateTimeInterface;
use OxidEsales\Eshop\Application\Model\Rating as EshopRatingModel;
use OxidEsales\GraphQL\Catalogue\Shared\DataType\DataType;
use TheCodingMachine\GraphQLite\Annotations\Field;
use TheCodingMachine\GraphQLite\Annotations\Type;
use TheCodingMachine\GraphQLite\Types\ID;

/**
 * @Type()
 */
final class Rating implements DataType
{
    /** @var EshopRatingModel */
    private $rating;

    public function __construct(EshopRatingModel $rating)
    {
        $this->rating = $rating;
    }

    public function getEshopModel(): EshopRatingModel
    {
        return $this->rating;
    }

    /**
     * @Field()
     */
    public function getId(): ID
    {
        return new ID($this->rating->getId());
    }

    /**
     * @Field()
     */
    public function getRating(): int
    {
        return (int) $this->rating->getFieldData('oxrating');
    }

    /**
     * @Field()
     */
    public function getTimestamp(): DateTimeInterface
    {
        return new DateTimeImmutable(
            (string) $this->rating->getFieldData('oxtimestamp')
        );
    }

    public function getUserId(): ID
    {
        return new ID(
            (string) $this->rating->getFieldData('oxuserid')
        );
    }

    public static function getModelClass(): string
    {
        return EshopRatingModel::class;
    }
}
