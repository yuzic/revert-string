#!/usr/bin/env php
<?php
require "bootstrap.php";
$params = $_SERVER['argv'];
list($action, $params) = (new App\Console\Request())->getRequest($params);
$commander =  new \App\Console\Commander();
$command = $commander->runCommand(new \App\Helpers\String(), 'clearVowelAndRevert', $params);
echo "\n$command\n";

?>