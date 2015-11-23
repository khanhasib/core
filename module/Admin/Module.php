<?php
/* 
 * In order to load and configure a module, Zend Framework 2 has a ModuleManager. 
 * This will look for Module.php in the root of the module directory (module/Admin) 
 * and expect to find a class called Admin\Module within it.
 * 
 * The ModuleManager will call getAutoloaderConfig() and getConfig() automatically for us
 */

namespace Admin;

 use Zend\ModuleManager\Feature\AutoloaderProviderInterface;
 use Zend\ModuleManager\Feature\ConfigProviderInterface;

 class Module implements AutoloaderProviderInterface, ConfigProviderInterface
 {
     public function getAutoloaderConfig()
     {
         return array(
             'Zend\Loader\StandardAutoloader' => array(
                 'namespaces' => array(
                     __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                 ),
             ),
         );
     }

     public function getConfig()
     {
         return include __DIR__ . '/config/module.config.php';
     }
 }