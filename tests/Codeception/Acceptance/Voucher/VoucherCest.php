<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Tests\Codeception\Acceptance\Voucher;

use Codeception\Util\HttpCode;
use OxidEsales\GraphQL\Account\Tests\Codeception\Acceptance\BaseCest;
use OxidEsales\GraphQL\Account\Tests\Codeception\AcceptanceTester;

/**
 * @group voucher
 */
final class VoucherCest extends BaseCest
{
    private const USERNAME = 'user@oxid-esales.com';

    private const OTHER_USERNAME = 'otheruser@oxid-esales.com';

    private const PASSWORD = 'useruser';

    private const BASKET = '_test_voucher_public';

    private const BASKET_PUBLIC = '_test_basket_public';

    private const VOUCHER = 'myVoucher';

    private const SERIES_VOUCHER = 'mySeriesVoucher';

    private const OTHER_SERIES_VOUCHER = 'seriesVoucher';

    private const WRONG_VOUCHER = 'non_existing_voucher';

    private const USED_VOUCHER = 'used_voucher';

    private const PRODUCT_ID = 'dc5ffdf380e15674b56dd562a7cb6aec';

    public function _after(AcceptanceTester $I): void
    {
        //Reset voucher usage
        $this->prepareVoucher($I, '', 'personal_voucher_1');
        $this->prepareVoucher($I, '', self::USED_VOUCHER);

        // TODO: Remove when the test with min price is fixed
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxminimumvalue' => 0.00],
            ['oxid'           => 'personal_voucher']
        );
    }

    public function testAddVoucherNotLoggedIn(AcceptanceTester $I): void
    {
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::BAD_REQUEST);
    }

    public function testAddVoucherUnauthorized(AcceptanceTester $I): void
    {
        $I->login(self::OTHER_USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::UNAUTHORIZED);
    }

    public function testAddVoucher(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);
    }

    public function testAddVoucherNonExistingBasket(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = 'non_existing';

        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertEquals(
            sprintf('Basket was not found by id: %s', $basketId),
            $result['errors'][0]['message']
        );
    }

    public function testAddWrongVoucher(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET, self::WRONG_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertEquals(
            sprintf('Voucher by number: %s was not found or was not applicable', self::WRONG_VOUCHER),
            $result['errors'][0]['message']
        );
    }

    public function testAddAlreadyUsedVoucher(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET, self::USED_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertEquals(
            sprintf('Voucher by number: %s was not found or was not applicable', self::USED_VOUCHER),
            $result['errors'][0]['message']
        );
    }

    public function testNotAllowToAddSecondVoucher(AcceptanceTester $I): void
    {
        $this->prepareVoucherInBasket($I);

        $I->login(self::USERNAME, self::PASSWORD);

        //Add first voucher
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);

        //Add second voucher and get error
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertEquals(
            sprintf('Voucher by number: %s was not found or was not applicable', self::SERIES_VOUCHER),
            $result['errors'][0]['message']
        );
    }

    public function testAllowAddingMultipleVouchers(AcceptanceTester $I): void
    {
        $this->prepareVoucherInBasket($I);
        $this->prepareSeriesVouchers($I, 'personal_series_voucher');

        $I->login(self::USERNAME, self::PASSWORD);

        //Add first voucher
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);

        //Add second voucher
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);
    }

    public function testNotAllowDifferentSeriesVoucher(AcceptanceTester $I): void
    {
        $this->prepareVoucherInBasket($I);

        $I->login(self::USERNAME, self::PASSWORD);

        //Add voucher from first series
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);

        //Add voucher from second series
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::OTHER_SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);
    }

    public function testAllowDifferentSeriesVoucher(AcceptanceTester $I): void
    {
        $this->prepareVoucherInBasket($I);
        $this->prepareSeriesVouchers($I, 'series_voucher');

        $I->login(self::USERNAME, self::PASSWORD);

        //Add voucher from first series
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);

        //Add voucher from second series
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::OTHER_SERIES_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);
    }

    public function testRemoveVoucherNotLoggedIn(AcceptanceTester $I): void
    {
        $I->sendGQLQuery($this->removeVoucherMutation(self::BASKET, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::BAD_REQUEST);
    }

    public function testRemoveVoucherUnauthorized(AcceptanceTester $I): void
    {
        $I->login(self::OTHER_USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->removeVoucherMutation(self::BASKET, 'personal_voucher_1'));

        $I->seeResponseCodeIs(HttpCode::UNAUTHORIZED);
    }

    public function testRemoveNonExistingVoucher(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->removeVoucherMutation(self::BASKET, self::WRONG_VOUCHER));

        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertEquals(
            sprintf('Voucher was not found by id: %s', self::WRONG_VOUCHER),
            $result['errors'][0]['message']
        );
    }

    public function testRemoveVoucher(AcceptanceTester $I): void
    {
        $this->prepareVoucher($I, self::BASKET, 'personal_voucher_1');

        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->removeVoucherMutation(self::BASKET, 'personal_voucher_1'));

        $I->seeResponseCodeIs(HttpCode::OK);
    }

    public function testVoucherBasketDiscount(AcceptanceTester $I): void
    {
        $this->prepareVoucher($I, '', 'personal_series_voucher_1');
        $this->prepareVoucher($I, '', 'series_voucher_1');

        $I->login(self::USERNAME, self::PASSWORD);

        //Check basket discounts without applied voucher
        $I->sendGQLQuery($this->basketQuery(self::BASKET_PUBLIC));

        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeResponseIsJson();
        $result = $I->grabJsonResponseAsArray();

        $I->assertSame($result['data']['basket'], [
            'id'   => self::BASKET_PUBLIC,
            'cost' => [
                'voucher'  => 0,
                'discount' => 0,
            ],
            'vouchers' => [],
        ]);

        //Add voucher and check basket discount
        $I->sendGQLQuery($this->addVoucherMutation(self::BASKET_PUBLIC, self::VOUCHER));

        $I->seeResponseCodeIs(HttpCode::OK);

        $I->sendGQLQuery($this->basketQuery(self::BASKET_PUBLIC));

        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeResponseIsJson();
        $discountResult = $I->grabJsonResponseAsArray();

        $I->assertSame($discountResult['data']['basket'], [
            'id'   => self::BASKET_PUBLIC,
            'cost' => [
                'voucher'  => 5,
                'discount' => 5,
            ],
            'vouchers' => [
                [
                    'id' => 'personal_voucher_1',
                ],
            ],
        ]);
    }

    public function testRemoveInvalidVoucherFromBasket(AcceptanceTester $I): void
    {
        $this->prepareVoucher($I, self::BASKET, self::USED_VOUCHER);

        $I->login(self::USERNAME, self::PASSWORD);

        $I->sendGQLQuery($this->basketQuery(self::BASKET));

        $I->seeResponseCodeIs(HttpCode::OK);
        $I->seeResponseIsJson();

        $result = $I->grabJsonResponseAsArray();
        $I->assertSame(
            [
                'id'       => self::BASKET,
                'cost'     => [
                    'voucher'  => 0,
                    'discount' => 0,
                ],
                'vouchers' => [],
            ],
            $result['data']['basket']
        );
    }

    public function testVoucherVisibilityWithSavedBasketAndGraphqlBasket(AcceptanceTester $I): void
    {
        $I->login(self::OTHER_USERNAME, self::PASSWORD);

        // Create basket with voucher using graphql which is different than 'savedbasket'
        $graphqlBasketId = $this->basketCreateMutation($I, 'basket_with_vouchers');
        $I->sendGQLQuery($this->addVoucherMutation($graphqlBasketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);
        $I->sendGQLQuery($this->basketQuery($graphqlBasketId));
        $I->seeResponseCodeIs(HttpCode::OK);
        $vouchers = $I->grabJsonResponseAsArray()['data']['basket']['vouchers'];

        $I->assertCount(1, $vouchers);

        // Check 'savedbasket' owned by the same user, the vouchers should be 0
        $savedBasketId = $this->basketCreateMutation($I, 'savedbasket');
        $I->sendGQLQuery($this->basketQuery($savedBasketId));
        $I->seeResponseCodeIs(HttpCode::OK);
        $vouchers = $I->grabJsonResponseAsArray()['data']['basket']['vouchers'];

        $I->assertCount(0, $vouchers);

        $this->basketRemoveMutation($I, $graphqlBasketId);
    }

    public function testVoucherIsUnmarkedAsReservedAfterBasketWasRemoved(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'basket_remove');
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved >'   => 0,
            'oegql_basketid' => $basketId,
        ]);

        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved'     => 0,
            'oegql_basketid' => '',
        ]);
    }

    public function testVoucherAssignedToSpecificProduct(AcceptanceTester $I): void
    {
        $productId2 = 'f4f73033cf5045525644042325355732';
        $I->haveInDatabase(
            'oxobject2discount',
            [
                'OXID'         => 'voucher_assigned_to_product',
                'OXDISCOUNTID' => 'personal_voucher',
                'OXOBJECTID'   => self::PRODUCT_ID,
                'OXTYPE'       => 'oxarticles',
            ]
        );

        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'basket_voucher_product');
        $this->basketAddProductMutation($I, $basketId, $productId2);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved >'   => 0,
            'oegql_basketid' => $basketId,
        ]);

        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved'     => 0,
            'oegql_basketid' => '',
        ]);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, $productId2);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
    }

    public function testAddVoucherWhichIsOutdated(AcceptanceTester $I): void
    {
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxenddate' => date('Y-m-d H:i:s', strtotime('-1 day'))],
            ['oxid'      => 'personal_voucher']
        );

        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'outdated_voucher');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxenddate' => '2050-12-31 00:00:00'],
            ['oxid'      => 'personal_voucher']
        );
    }

    public function testAddVoucherWhichIsNotStarted(AcceptanceTester $I): void
    {
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxbegindate' => date('Y-m-d H:i:s', strtotime('+1 day'))],
            ['oxid'        => 'personal_voucher']
        );

        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'outdated_voucher');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxbegindate' => '2000-01-01 00:00:00'],
            ['oxid'        => 'personal_voucher']
        );
    }

    public function testVoucherWhichWillOutDate(AcceptanceTester $I): void
    {
        $I->login(self::USERNAME, self::PASSWORD);

        // Add voucher to basket
        $basketId = $this->basketCreateMutation($I, 'outdated_voucher');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);

        // Update the voucher and make it invalid
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxenddate' => date('Y-m-d H:i:s', strtotime('-1 day'))],
            ['oxid'      => 'personal_voucher']
        );

        // Get basket data
        $I->sendGQLQuery($this->basketQuery($basketId));
        $result = $I->grabJsonResponseAsArray();

        // Check voucher data
        $I->assertSame($result['data']['basket'], [
            'id'   => $basketId,
            'cost' => [
                'voucher'  => 0,
                'discount' => 0,
            ],
            'vouchers' => [],
        ]);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxenddate' => '2050-12-31 00:00:00'],
            ['oxid'      => 'personal_voucher']
        );
    }

    public function testVoucherWithMinOrderValue(AcceptanceTester $I): void
    {
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxminimumvalue' => 50.00],
            ['oxid'           => 'personal_voucher']
        );

        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'basket_with_min_voucher');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved >'   => 0,
            'oegql_basketid' => $basketId,
        ]);

        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);

        $I->seeInDatabase('oxvouchers', [
            'oxid'           => 'personal_voucher_1',
            'oxreserved'     => 0,
            'oegql_basketid' => '',
        ]);

        // Reset DB
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
        $I->updateInDatabase(
            'oxvoucherseries',
            ['oxminimumvalue' => 0.00],
            ['oxid'           => 'personal_voucher']
        );
    }

    public function testVoucherAssignedToUserGroup(AcceptanceTester $I): void
    {
        // Assign group to the voucher
        $I->haveInDatabase(
            'oxobject2group',
            [
                'OXID'       => 'voucher_assigned_to_user_group',
                'OXSHOPID'   => 1,
                'OXOBJECTID' => 'personal_voucher',
                'OXGROUPSID' => 'oxidcustomer',
            ]
        );

        // Add voucher with user which is not into the group
        $I->login(self::OTHER_USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'voucher_assigned_to_user_group');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::NOT_FOUND);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);

        // Add voucher with user which is into the group
        $I->login(self::USERNAME, self::PASSWORD);

        $basketId = $this->basketCreateMutation($I, 'voucher_assigned_to_user_group');
        $this->basketAddProductMutation($I, $basketId, self::PRODUCT_ID);
        $I->sendGQLQuery($this->addVoucherMutation($basketId, self::VOUCHER));
        $I->seeResponseCodeIs(HttpCode::OK);

        // Reset DB
        $this->basketRemoveProductMutation($I, $basketId, self::PRODUCT_ID);
        $this->basketRemoveMutation($I, $basketId);
        $I->seeResponseCodeIs(HttpCode::OK);
    }

    private function basketRemoveProductMutation(AcceptanceTester $I, string $basketId, string $productId, int $amount = 1): void
    {
        $I->sendGQLQuery('mutation {
            basketRemoveProduct(basketId: "' . $basketId . '", productId: "' . $productId . '", amount: ' . $amount . ') {
                id
            }
        }');

        $I->seeResponseIsJson();
        $I->seeResponseCodeIs(HttpCode::OK);
    }

    private function addVoucherMutation(string $basketId, string $voucherNumber)
    {
        return 'mutation {
            basketAddVoucher (
                basketId: "' . $basketId . '",
                voucherNumber: "' . $voucherNumber . '"
            ) {
                id
            }
        }';
    }

    private function removeVoucherMutation(string $basketId, string $voucherId)
    {
        return 'mutation {
            basketRemoveVoucher (
                basketId: "' . $basketId . '",
                voucherId: "' . $voucherId . '"
            ) {
                id
            }
        }';
    }

    private function basketQuery(string $basketId)
    {
        return 'query {
            basket(id: "' . $basketId . '") {
                id
                cost {
                    voucher
                    discount
                }
                vouchers {
                    id
                }
            }
        }';
    }

    private function basketCreateMutation(AcceptanceTester $I, string $title): string
    {
        $I->sendGQLQuery('mutation {
            basketCreate(basket: {title: "' . $title . '", public: false}) {
                id
            }
        }');

        $I->seeResponseIsJson();
        $I->seeResponseCodeIs(HttpCode::OK);

        $result = $I->grabJsonResponseAsArray();

        return $result['data']['basketCreate']['id'];
    }

    private function basketRemoveMutation(AcceptanceTester $I, string $basketId): void
    {
        $I->sendGQLQuery('mutation {
            basketRemove(id: "' . $basketId . '")
        }');

        $I->seeResponseIsJson();
        $I->seeResponseCodeIs(HttpCode::OK);
    }

    private function basketAddProductMutation(AcceptanceTester $I, string $basketId, string $productId, int $amount = 1): void
    {
        $I->sendGQLQuery('mutation {
            basketAddProduct(basketId: "' . $basketId . '", productId: "' . $productId . '", amount: ' . $amount . ') {
                id
            }
        }');

        $I->seeResponseIsJson();
        $I->seeResponseCodeIs(HttpCode::OK);
    }

    private function prepareVoucherInBasket(AcceptanceTester $I): void
    {
        $this->prepareVoucher($I, '', 'personal_series_voucher_1');
        $this->prepareVoucher($I, '', 'personal_series_voucher_2');
    }

    private function prepareSeriesVouchers(AcceptanceTester $I, string $voucherId): void
    {
        $I->updateInDatabase('oxvoucherseries', [
            'OXALLOWSAMESERIES'  => 1,
            'OXALLOWOTHERSERIES' => 1,
        ], [
            'OXID' => $voucherId,
        ]);
    }

    private function prepareVoucher(AcceptanceTester $I, string $basketId, string $voucherId): void
    {
        $I->updateInDatabase('oxvouchers', [
            'OXRESERVED'     => $basketId ? time() : 0,
            'OEGQL_BASKETID' => $basketId,
        ], [
            'OXID' => $voucherId,
        ]);
    }
}
