<?php
/**
 * MyFunctions
 * @package Core
 */
namespace Core;

class CoreFunctions
{
    public static function dump($array) {
       echo "<pre>";
       print_r($array);
	   echo "</pre>";
    }
}
?>