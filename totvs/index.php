<?php
session_start();


require 'config.php';
require 'vendor/autoload.php';

define('BASE_URL', 'http://localhost/totvs/totvs');

$core = new Core\Core();
$core->run();
