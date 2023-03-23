<?php
require '../vendor/autoload.php';
require '../base/config.php';

$route = new \Base\Route();
$route->add('/', \App\Controller\Login::class);




$app = new \Base\Application($route);
$app->run();