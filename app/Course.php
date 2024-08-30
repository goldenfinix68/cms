<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $guarded = [];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function archiveUsers()
    {
        return $this->hasMany(User::class);
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function departmentArchive()
    {
        return $this->belongsTo(DepartmentArchive::class,'department_id');
    }

    public function reports()
    {
        return $this->hasMany(Report::class);
    }

    public function CourseArchive()
    {
        return $this->hasMany(CourseArchive::class);
    }

}
