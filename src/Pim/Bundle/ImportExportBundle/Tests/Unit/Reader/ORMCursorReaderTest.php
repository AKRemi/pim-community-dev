<?php

namespace Pim\Bundle\ImportExportBundle\Tests\Unit\Reader;

use Pim\Bundle\ImportExportBundle\Reader\ORMCursorReader;

/**
 * Test related class
 *
 * @author    Gildas Quemener <gildas@akeneo.com>
 * @copyright 2013 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class ORMCursorReaderTest extends \PHPUnit_Framework_TestCase
{
    /**
     * Test related method
     */
    public function testInstanceOfItemReaderInterface()
    {
        $this->assertInstanceOf('Oro\Bundle\BatchBundle\Item\ItemReaderInterface', new ORMCursorReader());
    }

    /**
     * Test related method
     */
    public function testRead()
    {
        $reader = new ORMCursorReader();
        $stepExecution = $this->getStepExecutionMock();
        $query  = $this->getQueryMock();
        $result = $this->getIterableResultMock(
            array(
                $item1 = 'foo',
                $item2 = 'bar',
                $item3 = 'baz',
            )
        );

        $query->expects($this->any())
            ->method('iterate')
            ->will($this->returnValue($result));

        $reader->setQuery($query);
        $this->assertEquals($item1, $reader->read($stepExecution));
        $this->assertEquals($item2, $reader->read($stepExecution));
        $this->assertEquals($item3, $reader->read($stepExecution));
        $this->assertNull($reader->read($stepExecution));
    }

    /**
     * @return \octrine\ORM\AbstractQuery
     */
    private function getQueryMock()
    {
        return $this
            ->getMockBuilder('Doctrine\ORM\AbstractQuery')
            ->setMethods(array('_doExecute', 'getSQL', 'iterate'))
            ->disableOriginalConstructor()
            ->getMock();
    }

    /**
     * @param array $results
     *
     * @return \Doctrine\ORM\Internal\Hydration\IterableResult
     */
    private function getIterableResultMock(array $results)
    {
        $mock = $this
            ->getMockBuilder('Doctrine\ORM\Internal\Hydration\IterableResult')
            ->disableOriginalConstructor()
            ->getMock();

        foreach ($results as $index => $result) {
            $mock->expects($this->at($index))
                ->method('next')
                ->will($this->returnValue($result));
        }

        return $mock;
    }

    /**
     * @return \Oro\Bundle\BatchBundle\Entity\StepExecution
     */
    private function getStepExecutionMock()
    {
        return $this
            ->getMockBuilder('Oro\Bundle\BatchBundle\Entity\StepExecution')
            ->disableOriginalConstructor()
            ->getMock();
    }
}
