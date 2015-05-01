<?php
class Zend_View_Helper_Stuff extends Zend_View_Helper_Abstract 
{
  public function stuff()
  {
    $output = "IK BEN View Helper en DAN????";
    return htmlspecialchars($output);    
  }
}

?>
