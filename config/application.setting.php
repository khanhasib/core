<?php
/**
 *  Application Contants ,Keys and Global Setting Variables
 */

define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));  //development OR production
define('DEBUGGING', TRUE);  //TRUE OR FALSE
/**
  * Display all errors when APPLICATION_ENV is development.
  */
 if (APPLICATION_ENV == 'development' || DEBUGGING) {
     error_reporting(E_ALL);
     ini_set("display_errors", 1);
 }
 
 define('APPLICATION_NAME', 'ZF2');  //Skeleton Application
 define('APPLICATION_ORG', 'Zend Technologies Ltd');  //Zend Technologies Ltd
 