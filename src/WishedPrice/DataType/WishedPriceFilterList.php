<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\WishedPrice\DataType;

use OxidEsales\GraphQL\Base\DataType\StringFilter;
use OxidEsales\GraphQL\Catalogue\Shared\DataType\FilterList;
use TheCodingMachine\GraphQLite\Annotations\Factory;

final class WishedPriceFilterList extends FilterList
{
    /** @var ?StringFilter */
    private $userId;

    public function __construct(?StringFilter $userId = null)
    {
        $this->userId = $userId;
        parent::__construct();
    }

    public function withUserFilter(StringFilter $user): self
    {
        $filter         = clone $this;
        $filter->userId = $user;

        return $filter;
    }

    /**
     * @return array{
     *                oxuserId: ?StringFilter
     *                }
     */
    public function getFilters(): array
    {
        return [
            'oxuserId' => $this->userId,
        ];
    }

    /**
     * @Factory(name="WishedPriceFilterList")
     */
    public static function createWishedPriceFilterList(?StringFilter $userId): self
    {
        return new self($userId);
    }
}
