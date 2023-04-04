<?php
namespace App\Model\EloquentModel;

use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * @package App\Model\EloquentModel
 *
 * @property $id
 * @property $name
 * @property $password
 * @property $email
 * @property $image
 */
class User extends Model

{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users';
    public $timestamps = false;
    protected $fillable = [
        'name',
        'password',
        'email',
        'created_at',
        'image'
    ];

    public static function getByEmail(string $email)
    {
        return self::query()->where('email', '=', $email)->first();
    }

    public static function getById(int $id): ?self
    {
        return self::query()->find($id);
    }
    public static function getList(int $limit = 10, int $offset = 0)
    {
        return self::query()->limit($limit)->offset($offset)->orderBy('id', 'DESC')->get();
    }

    public static function getPasswordHash(string $password)
    {
        return sha1('.,f.akjsduf' . $password);
    }

    private function genFileName()
    {
        return sha1(microtime(1) . mt_rand(1, 100000000)) . '.jpg';
    }

    public function loadFile(string $file)
    {
        if (file_exists($file)) {
            $this->image = $this->genFileName();
            move_uploaded_file($file,getcwd() . '../html/images/' . $this->image);
        }
    }

    

    /**
     * @return mixed
     */
    public function getImage()
    {
        return $this->image;
    }


    /**
     * @return mixed
     */
    public function getId(): mixed
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @return mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    public function isAdmin(): bool
    {
        return in_array($this->id, ADMIN_IDS);
    }
}