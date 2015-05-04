<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel(array(
            'page_title' => '',
        ));
        return $view;
    }

    public function galleryAction()
    {
        return new ViewModel();
    }
    
    public function contactAction()
    {
        $view = new ViewModel(array(
            'page_title' => 'Contact Us',
        ));
        return $view;
    }

    public function missionAction()
    {
        $search = $this->params()->fromQuery('search','');
        return new ViewModel(array(
            'search' => $search,
        ));
    }
    
        
    public function portfolioAction()
    {
        $view = new ViewModel(array(
            'message' => 'Hello world',
        ));
        $view->setTemplate('application/index/gallery.phtml');
        return $view;
    }

    public function packageAction()
    {
        return new ViewModel();
    }    
}
