<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Service;

use OxidEsales\GraphQL\Base\Framework\PermissionProviderInterface;

class PermissionProvider implements PermissionProviderInterface
{
    public function getPermissions(): array
    {
        return [
            'admin' => [
                'VIEW_WISHED_PRICES',
                'DELETE_WISHED_PRICE',
                'VIEW_RATINGS',
                'DELETE_RATING'
            ],
            'malladmin' => [
                'VIEW_WISHED_PRICES',
                'DELETE_WISHED_PRICE',
                'VIEW_RATINGS',
                'DELETE_RATING'
            ]
        ];
    }
}
