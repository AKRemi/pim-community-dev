<?php

namespace Pim\Bundle\ProductBundle\Validator\ConstraintGuesser;

use Symfony\Component\Validator\Constraints as Assert;
use Oro\Bundle\FlexibleEntityBundle\Form\Validator\ConstraintGuesserInterface;
use Oro\Bundle\FlexibleEntityBundle\Model\AbstractAttribute;
use Oro\Bundle\FlexibleEntityBundle\AttributeType\AbstractAttributeType;

/**
 * Guesser
 *
 * @author    Gildas Quemener <gildas.quemener@gmail.com>
 * @copyright 2013 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class RegexGuesser implements ConstraintGuesserInterface
{
    /**
     * {@inheritdoc}
     */
    public function supportAttribute(AbstractAttribute $attribute)
    {
        return AbstractAttributeType::BACKEND_TYPE_VARCHAR === $attribute->getBackendType();
    }

    /**
     * {@inheritdoc}
     */
    public function guessConstraints(AbstractAttribute $attribute)
    {
        $constraints = array();

        if ('regexp' === $attribute->getValidationRule() && $pattern = $attribute->getValidationRegexp()) {
            $constraints[] = new Assert\Regex(array('pattern' => $pattern,));
        }

        return $constraints;
    }
}