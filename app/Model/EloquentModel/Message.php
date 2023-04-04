<?php
namespace App\Model\EloquentModel;

use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * @package App\Model\Eloquent
 *
 * @property-read $id
 * @property-read $text
 * @property-read $author_id
 * @property-read $created_at
 * @property-read User $author
 */
class Message extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'messages';
    public $timestamps = false;
    protected $fillable = [
        'text',
        'author_id',
        'created_at',
        'image',
    ];

    public function author()
    {
        return $this->belongsTo(User::class);
    }

    public static function deleteMessage(int $messageId)
    {
        return self::destroy($messageId);
    }

    public function loadFile(string $file)
    {
        if (file_exists($file)) {
            $this->image = $this->genFileName();
            move_uploaded_file($file,getcwd() . '/images/' . $this->image);
        }
    }
    public static function getList(int $limit = 10, int $offset = 0)
    {
        return self::with('author')->limit($limit)->offset($offset)->orderBy('id', 'DESC')->get();
    }

    private function genFileName()
    {
        return sha1(microtime(1) . mt_rand(1, 100000000)) . '.jpg';
    }
    public static function getUserMessages(int $userId, int $limit): array
    {
       return self::query()->where('author_id', '=', $userId)->limit($limit)->get();
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
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getText(): string
    {
        return $this->text;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @return mixed
     */
    public function getAuthorId()
    {
        return $this->authorId;
    }

    /**
     * @return User
     */
    public function getAuthor(): User
    {
        return $this->author;
    }

    /**
     * @param User $author
     */
    public function setAuthor(User $author): void
    {
        $this->author = $author;
    }


    public function getData()
    {
        return [
            'id' => $this->id,
            'author_id' => $this->authorId,
            'text' => $this->text,
            'created_at' => $this->createdAt,
            'image' => $this->image
        ];
    }

}