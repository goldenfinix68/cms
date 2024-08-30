<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    protected $guarded = [];

    public function components()
    {
        return $this->hasMany(Component::class);
    }

    public function archiveComponents()
    {
        return $this->hasMany(ComponentArchive::class);
    }
    public  function  computers()
    {
        return $this->hasMany(Computer::class);
    }
    public function computerparts()
    {
        return $this->hasMany(ComputerPart::class);
    }
}
