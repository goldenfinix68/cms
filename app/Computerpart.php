<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Computerpart extends Model
{
    protected $guarded = [];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }
    public function computer()
    {
        return $this->belongsTo(Computer::class);
    }
    public function computercateg()
    {
        return $this->belongsTo(Computercateg::class);
    }

    public function computercategArchive()
    {
        return $this->belongsTo(ComputercategArchive::class,'computercateg_id');
    }
    public function reports()
    {
        return $this->hasMany(Report::class);
    }
}
