<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\GraphQL\Account\Account\Infrastructure;

use OxidEsales\EshopCommunity\Internal\Transition\Utility\Context;

final class Contact
{
    /**
     * @var Context
     */
    private $context;

    public function __construct(
        Context $context
    ) {
        $this->context = $context;
    }

    public function getRequiredContactFormFields(): array
    {
        return $this->context->getRequiredContactFormFields();
    }
}
