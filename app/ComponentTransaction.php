<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComponentTransaction extends Model
{
    protected $guarded = [];

    public function component()
    {
        return $this->belongsTo(Component::class);
    }

    public function archiveComponent()
    {
        return $this->belongsTo(ComponentArchive::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
