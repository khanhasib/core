<?php
/**
 *  Application Contants ,Keys and Global Setting Variables
 */
/** Define application environment **/
define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));  //development OR production

/** Define debugging mode **/
define('DEBUGGING', TRUE);  //TRUE OR FALSE
/**
 * Display all errors when APPLICATION_ENV is development OR debugging is true.
 */
 if (APPLICATION_ENV == 'development' || DEBUGGING) {
     error_reporting(E_ALL);
     ini_set("display_errors", 1);
 }
 /** application constant **/
 define('APPLICATION_NAME', 'ZendCore');  //ZendCore
 define('APPLICATION_ORG', 'Zend Technologies Ltd');  //Zend Technologies Ltd
 