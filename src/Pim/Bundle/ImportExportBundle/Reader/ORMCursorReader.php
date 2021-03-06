<?php

namespace Pim\Bundle\ImportExportBundle\Reader;

use Oro\Bundle\BatchBundle\Item\ItemReaderInterface;
use Doctrine\ORM\AbstractQuery;
use Oro\Bundle\BatchBundle\Item\AbstractConfigurableStepElement;
use Oro\Bundle\BatchBundle\Entity\StepExecution;

/**
 * ORM cursor reader
 *
 * @author    Gildas Quemener <gildas@akeneo.com>
 * @copyright 2013 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class ORMCursorReader extends AbstractConfigurableStepElement implements ItemReaderInterface
{
    protected $query;
    private $cursor;

    /**
     * Set query used by the reader
     * @param AbstractQuery $query
     */
    public function setQuery(AbstractQuery $query)
    {
        $this->query = $query;
    }

    /**
     * {@inheritdoc}
     */
    public function read(StepExecution $stepExecution)
    {
        if (!$this->cursor) {
            $this->cursor = $this->query->iterate();
        }

        return $this->cursor->next() ?: null;
    }

    /**
     * {@inheritdoc}
     */
    public function getConfigurationFields()
    {
        return array();
    }
}
