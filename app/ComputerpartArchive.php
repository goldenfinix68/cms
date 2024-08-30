<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ComputerpartArchive extends Model
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
    public function computerArchive()
    {
        return $this->belongsTo(ComputerArchive::class,'computer_id');
    }
    public function computercategArchive()
    {
        return $this->belongsTo(ComputercategArchive::class,'computercateg_id');
    }

    public function computercateg()
    {
        return $this->belongsTo(Computercateg::class);
    }
    public function reports()
    {
        return $this->hasMany(Report::class);
    }
    public function computertransaction()
    {
        return $this->hasMany(ComputerTrasaction::class);
    }
}
