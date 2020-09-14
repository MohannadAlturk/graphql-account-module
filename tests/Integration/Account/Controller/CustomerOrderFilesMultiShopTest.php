<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Tests\Integration\Account\Controller;

use OxidEsales\Eshop\Core\Registry as EshopRegistry;
use OxidEsales\GraphQL\Base\Tests\Integration\MultishopTestCase;

final class CustomerOrderFilesMultiShopTest extends MultishopTestCase
{
    private const USERNAME = 'user@oxid-esales.com';

    private const PASSWORD = 'useruser';

    public function testCustomerOrderFilesSubShopOnly(): void
    {
        EshopRegistry::getConfig()->setConfigParam('blMallUsers', false);
        EshopRegistry::getConfig()->setShopId(2);
        $this->setGETRequestParameter('shp', '2');

        $this->prepareToken(self::USERNAME, self::PASSWORD);

        $result = $this->query(
            'query {
                customer {
                    files {
                        file {
                            product {
                                id
                                active
                                title
                            }
                            id
                            filename
                            onlyPaidDownload
                        }
                        id
                        filename
                        firstDownload
                        latestDownload
                        downloadCount
                        maxDownloadCount
                        validUntil
                        valid
                    }
                    orders {
                        id
                        files {
                            file {
                                product {
                                    id
                                    active
                                    title
                                }
                                id
                                filename
                                onlyPaidDownload
                            }
                            id
                            filename
                            firstDownload
                            latestDownload
                            downloadCount
                            maxDownloadCount
                            validUntil
                            valid
                        }
                    }
                }
            }'
        );

        $this->assertResponseStatus(200, $result);

        $customerFiles = $result['body']['data']['customer']['files'];
        $orderFiles    = $result['body']['data']['customer']['orders'][0]['files'];

        $expectedFiles = [
            [
                'file'             => [
                    'product'          => [
                        'id'     => '_test_product_for_basket',
                        'active' => true,
                        'title'  => 'Product 621',
                    ],
                    'id'               => '48d949cb0af6076f841aea5cb5b703ed',
                    'filename'         => 'ch99.pdf',
                    'onlyPaidDownload' => true,
                ],
                'id'               => '729aafa296783575ddfd8e9527355b9b',
                'filename'         => 'ch99.pdf',
                'firstDownload'    => '2020-09-10T09:14:15+02:00',
                'latestDownload'   => '2020-09-10T09:14:15+02:00',
                'downloadCount'    => 1,
                'maxDownloadCount' => 0,
                'validUntil'       => '2020-09-11T09:14:15+02:00',
                'valid'            => false,
            ],
        ];

        $this->assertEquals($customerFiles, $expectedFiles);
        $this->assertEquals($orderFiles, $expectedFiles);
    }
}
