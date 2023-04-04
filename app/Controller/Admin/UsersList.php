<?php

namespace App\Controller\Admin;

use App\Controller\Admin;
use App\Model\EloquentModel\User;
use Base\Controller;

class UsersList extends Admin
{
    public function index()
    {
        return $this->view->render(
            'admin/userslist.phtml',
            [
                'users' => User::getList()
            ]
        );
    }
    public function saveUser()
    {
        $id = (int) $_POST['id'];
        $name = (string) $_POST['name'];
        $email = (string) $_POST['email'];
        $password = (string) $_POST['password'];
        $image = (object) $_POST['image'];

        $user = User::getById($id);
        if (!$user){
            return $this->response(['error' => 'no user']);
        }

        if (!$name) {
            return $this->response(['error' => 'no name']);
        }

        if (!$email) {
            return $this->response(['error' => 'no email']);
        }

        if ($password && mb_strlen($password) < 5) {
            return $this->response(['error' => 'Пароль слишком короткий']);
        }

        if (!$image) {
            return $this->response(['error' => 'no image']);
        }

        if (isset($_FILES['image']['tmp_name'])) {
            $user->loadFile($_FILES['image']['tmp_name']);
        }

        $user->name = $name;
        $user->email = $email;
        if ($password){
            $user->password = $password;
        }

        $user->name = $name;
        $user->email = $email;

        /** @var User $emailUser */
        $emailUser = User::getByEmail($email);
        if ($emailUser && $emailUser->id != $id) {
            return $this->response(['error' => 'this email already used by user id#' . $emailUser->id]);
        }

        if ($password) {
            $user->password = User::getPasswordHash($password);
        }
        $user->save();

        return $this->response(['result' => 'ok']);

    }

    public function deleteUser()
    {
        $id = (int) $_POST['id'];

        $user = User::getById($id);
        if (!$user) {
            return $this->response(['error' => 'no user']);
        }

        $user->delete();

        return $this->response(['result' => 'ok']);
    }

    public function addUser()
    {
        $name = (string) $_POST['name'];
        $email = (string) $_POST['email'];
        $password = (string) $_POST['password'];

        if (!$name || !$password) {
            return 'Не заданы имя и пароль';
        }

        if (!$name) {
            return $this->response(['error' => 'no name']);
        }

        if (!$email) {
            return $this->response(['error' => 'no email']);
        }

        if (!$password || mb_strlen($password) < 5) {
            return $this->response(['error' => 'too short password']);
        }

        /** @var User $emailUser */
        $emailUser = User::getByEmail($email);
        if ($emailUser) {
            return $this->response(['error' => 'this email already used by user id#' . $emailUser->id]);
        }

        $userData = [
            'name' => $name,
            'created_at' => date('Y-m-d H:i:s'),
            'password' => User::getPasswordHash($password),
            'email' => $email,
        ];
        $user = new User($userData);
        $user->save();

        return $this->response(['result' => 'Success']);

    }

    public function response(array $data)
    {
        header('Content-type: application/json');
        return json_encode($data);
    }
}