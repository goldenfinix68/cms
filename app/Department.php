<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $guarded = [];


    public function course()
    {
        return $this->hasMany(Course::class);
    }

    public function archiveCourse()
    {
        return $this->hasMany(CourseArchive::class);
    }

}
