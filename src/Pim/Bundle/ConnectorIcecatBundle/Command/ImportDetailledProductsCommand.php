<?php
namespace Pim\Bundle\ConnectorIcecatBundle\Command;

use Pim\Bundle\ConnectorIcecatBundle\Transform\ProductArrayToCatalogProductTransformer;

use Pim\Bundle\ConnectorIcecatBundle\Transform\ProductXmlToArrayTransformer;

use Pim\Bundle\DataFlowBundle\Model\Extract\FileHttpReader;

use Pim\Bundle\CatalogBundle\Doctrine\ProductManager;

use Pim\Bundle\DataFlowBundle\Model\Extract\FileHttpDownload;

use Pim\Bundle\ConnectorIcecatBundle\PimConnectorIcecatBundle;

use Doctrine\ODM\MongoDB\DocumentManager;

use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

use Pim\Bundle\ConnectorIcecatBundle\Document\ProductDataSheet;
use Pim\Bundle\ConnectorIcecatBundle\Entity\ConfigManager;
use Pim\Bundle\ConnectorIcecatBundle\Entity\Config;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;

use Doctrine\ODM\MongoDB\Query\Builder;
/**
 * Import detailled data for asked products
 *
 * @author    Romain Monceau <romain@akeneo.com>
 * @copyright 2012 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class ImportDetailledProductsCommand extends ContainerAwareCommand
{
    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this->setName('connectoricecat:importDetailledProducts')
            ->setDescription('Import detailled data for a set of products')
            ->addArgument(
                'limit',
                InputArgument::REQUIRED,
                'Number of products to be imported'
            );
    }

    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        // get arguments
        $limit = $input->getArgument('limit');
        $startLimit = $limit;

        // get config
        $configManager = $this->getConfigManager();
        $login       = $configManager->getValue(Config::LOGIN);
        $password    = $configManager->getValue(Config::PASSWORD);
        $baseDir     = $configManager->getValue(Config::BASE_DIR);
        $downloadUrl = $configManager->getValue(Config::BASE_URL) . $configManager->getValue(Config::BASE_PRODUCTS_URL);
        $baseFilePath= 'http://data.icecat.biz/export/freexml.int/INT/';

        // get data objects
        $dm = $this->getDocumentManager();

        $products = $dm->getRepository('PimConnectorIcecatBundle:ProductDataSheet')->findBy(array('isImported' => 0));

        /*

        $qb = $dm->getRepository('PimConnectorIcecatBundle:ProductDataSheet')->createQueryBuilder();
        $q = $qb->field('isImported')->equals(0)
                ->skip(0)
                ->limit(10)
                ->getQuery();
        $products = $q->execute();
*/
        echo count($products) ."\n";

//        exit();

        // prepare objects
        $reader = new FileHttpReader();
//         $productManager = $this->getProductManager();
//         $xmlToArray = new ProductXmlToArrayTransformer();
//         $arrayToProduct = new ProductArrayToCatalogProductTransformer($productManager, array(), array(), 'en_US');
//         libxml_use_internal_errors(true);

//         $time = array();
//         $startTime = microtime(true);

        // loop on products
        $batchSize = 0;
        foreach ($products as $product) {
            $start = microtime(true);
            $file = $product->getProductId() .'.xml';
            $content = $reader->process($baseFilePath . $file, $login, $password, false);
//             $content = simplexml_load_string($content);

//             $xmlToArray->setSimpleDoc($content);
//             $xmlToArray->transform();

//             $baseData = $xmlToArray->getProductBaseData();
//             $features = $xmlToArray->getProductFeatures();

//             $arrayToProduct->setProdData($baseData);
//             $arrayToProduct->setProdFeat($features);
//             $arrayToProduct->transform();
            $product->setXmlDetailledData($content);
            $product->setIsImported(1);
            $dm->persist($product);
            echo 'insert '.$product->getProductId().PHP_EOL;

//             echo (microtime(true) - $start) ." secs\n";

            if (++$batchSize % 10 === 0) {
                $dm->flush();
                $output->writeln('Batch size : '. $batchSize);
                $output->writeln('memory usage -> '. $this->getMemoryUsage());
                $dm->clear();
                $output->writeln('after clear memory usage -> '. $this->getMemoryUsage());
                gc_collect_cycles();
                $output->writeln('after gc_collect_cycles -> '. $this->getMemoryUsage());
            }

            if (--$limit === 0) {
                $dm->flush();
                break;
            }

        }
    }

    /**
     * @return Doctrine\ODM\MongoDB\Query\Builder;
     */
    protected function createQB()
    {
        return $this->getDocumentManager()->getRepository('PimConnectorIcecatBundle:ProductDataSheet')->createQueryBuilder();
    }

    /**
     * @return ConfigManager
     */
    protected function getConfigManager()
    {
        return $this->getContainer()->get('pim.connector.icecat.configmanager');
    }

    /**
     * @return DocumentManager
     */
    protected function getDocumentManager()
    {
        return $this->getContainer()->get('doctrine.odm.mongodb.document_manager');
    }

    /**
     * @return ProductManager
     */
    protected function getProductManager()
    {
        return $this->getContainer()->get('pim.catalog.product_manager');
    }

    /**
     * Get memory usage in
     * @return number
     */
    private function getMemoryUsage()
    {
        $size = memory_get_usage(true);

        return $size / 1024 / 1024;
    }
}