<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Tests\Unit\Account\DataType;

use OxidEsales\Eshop\Application\Model\User as EshopUserModel;
use OxidEsales\GraphQL\Account\Account\DataType\InvoiceAddress;
use PHPUnit\Framework\Constraint\IsType;
use PHPUnit\Framework\TestCase;

/**
 * @covers \OxidEsales\GraphQL\Account\Account\DataType\InvoiceAddress
 */
final class InvoiceAddressTest extends TestCase
{
    public function testEmptyInvoiceAddress(): void
    {
        $model    = new InvoiceAddressModelStub();
        $dataType = new InvoiceAddress($model);

        $this->assertInstanceOf(
            EshopUserModel::class,
            $dataType->getEshopModel()
        );

        $fields = [
            'salutation',
            'firstname',
            'lastname',
            'company',
            'additionalInfo',
            'street',
            'streetNumber',
            'zipCode',
            'city',
            'vatID',
            'phone',
            'mobile',
            'fax'
        ];

        foreach ($fields as $field) {
            $this->assertThat($dataType->$field(), $this->isType(IsType::TYPE_STRING));
        }
    }

    public function testEnrichedInvoiceAddress(): void
    {
        $model    = new InvoiceAddressModelStub();
        $data     = [
            'oxsal'        => 'MR',
            'oxfname'      => 'Marc',
            'oxlname'      => 'Muster',
            'oxcompany'    => 'None GmbH',
            'oxaddinfo'    => 'private delivery',
            'oxstreet'     => 'Haupstr.',
            'oxstreetnr'   => '13',
            'oxzip'        => '79098',
            'oxcity'       => 'Freiburg',
            'oxustid'      => '',
            'oxprivphone'  => '',
            'oxmobphone'   => '',
            'oxfax'        => '',
        ];
        $model->assign($data);
        $dataType = new InvoiceAddress($model);

        $this->assertInstanceOf(
            EshopUserModel::class,
            $dataType->getEshopModel()
        );
        $this->assertSame(
            $dataType->salutation(),
            $data['oxsal']
        );
        $this->assertSame(
            $dataType->firstname(),
            $data['oxfname']
        );
        $this->assertSame(
            $dataType->lastname(),
            $data['oxlname']
        );
        $this->assertSame(
            $dataType->company(),
            $data['oxcompany']
        );
        $this->assertSame(
            $dataType->additionalInfo(),
            $data['oxaddinfo']
        );
        $this->assertSame(
            $dataType->street(),
            $data['oxstreet']
        );
        $this->assertSame(
            $dataType->streetNumber(),
            $data['oxstreetnr']
        );
        $this->assertSame(
            $dataType->zipCode(),
            $data['oxzip']
        );
        $this->assertSame(
            $dataType->city(),
            $data['oxcity']
        );
        $this->assertSame(
            $dataType->vatID(),
            $data['oxustid']
        );
        $this->assertSame(
            $dataType->phone(),
            $data['oxprivphone']
        );
        $this->assertSame(
            $dataType->mobile(),
            $data['oxmobphone']
        );
        $this->assertSame(
            $dataType->fax(),
            $data['oxfax']
        );
    }
}
