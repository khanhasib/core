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

class UserController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel(array(
            'page_title' => '',
        ));
        return $view;
    }
    
    public function loginAction()
    {
        $view = new ViewModel(array(
            'page_title' => 'User Login',
        ));
        return $view;
    }

    public function dashboardAction()
    {
        $search = $this->params()->fromQuery('search','');
        return new ViewModel(array(
            'search' => $search,
        ));
    }    
}
