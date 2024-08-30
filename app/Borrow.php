<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Borrow extends Model
{
    protected $guarded = [];

    public function component()
    {
        return $this->belongsTo(ComponentArchive::class, 'component_archive_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
