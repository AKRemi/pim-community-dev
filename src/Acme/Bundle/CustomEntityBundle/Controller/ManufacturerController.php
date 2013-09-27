<?php                                                                                                                        
namespace Acme\Bundle\CustomEntityBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * @Route("/manufacturer")
 */
class ManufacturerController extends Controller
{
    /**
     * @Route(
     *     "/.{_format}",
     *     requirements={"_format" = "html|json"},
     *     defaults={"_format" = "html"}
     * )
    */
    public function indexAction(Request $request)
    {
        $queryBuilder = $this->get('doctrine')->getManager()->createQueryBuilder();
        $queryBuilder->select('m')->from('AcmeCustomEntityBundle:Manufacturer', 'm');

        $queryFactory = $this->get('acme_customentity.datagrid.manager.manufacturer.default_query_factory');
        $queryFactory->setQueryBuilder($queryBuilder);

        $datagridManager = $this->get('acme_customentity.datagrid.manager.manufacturer');
        $datagrid = $datagridManager->getDatagrid();

        if ( $request->getRequestFormat() === 'json') {
            $view = 'OroGridBundle:Datagrid:list.json.php';
        } else {
            $view = 'AcmeCustomEntityBundle:Manufacturer:index.html.twig';
        }

        return $this->render($view, array('datagrid' => $datagrid->createView()));
    }

}
