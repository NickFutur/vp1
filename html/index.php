<?php
require '../vendor/autoload.php';
require '../base/config.php';
require '../base/eloquent.php';

$route = new \Base\Route();
$route->add('/', \App\Controller\Login::class);
$route->add('/logout', \App\Controller\Login::class, 'logOut');
$route->add('/admin', \App\Controller\Admin\UsersList::class);
$route->add('/admin/saveUser', \App\Controller\Admin\UsersList::class, 'saveUser');
$route->add('/admin/addUser', \App\Controller\Admin\UsersList::class, 'addUser');
$route->add('/admin/deleteUser', \App\Controller\Admin\UsersList::class, 'deleteUser');

//var_dump(\App\Model\EloquentModel\User::getList(3, 0));
//$messages = \App\Model\EloquentModel\Message::getList(10);
//foreach ($messages as $message){
//    var_dump($message->author->getId());
//}

$app = new \Base\Application($route);
$app->run();