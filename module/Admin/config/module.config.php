<?php
/* 
 * getConfig() method in Admin\Module. 
 * This method simply loads the config/module.config.php file..
 */

 return array(
    //Define Routes
     'router' => array(
         'routes' => array(
             'admin' => array(
                 'type'    => 'segment',
                 'options' => array(
                     'route'    => '/admin[/:action][/:id]',
                     'constraints' => array(
                         'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                         'id'     => '[0-9]+',
                     ),
                     'defaults' => array(
                         'controller' => 'Admin\Controller\Index',
                         'action'     => 'index',
                     ),
                 ),
             ),
         ),
     ),
     //List Invokables Controller
     'controllers' => array(
         'invokables' => array(
             'Admin\Controller\Index' => 'Admin\Controller\IndexController',
         ),
     ),
     'view_manager' => array(
         'template_path_stack' => array(
             __DIR__ . '/../view',
         ),
     ),
 );