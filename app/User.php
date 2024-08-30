<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function components()
    {
        return $this->hasMany(Component::class);
    }

    public function reports()
    {
        return $this->hasMany(Report::class);
    }

    public function borrows()
    {
        return $this->hasMany(Borrow::class);
    }
    public function archiveCourses()
    {
        return $this->belongsTo(Course::class);
    }

    public function computerparts()
    {
        return $this->hasMany(ComputerPart::class);
    }

    public function departments()
    {
        return $this->belongsTo(Department::class);
    }
    public function  course()
    {
        return $this->belongsTo(Course::class);
    }
    public function departmentArchive()
    {
        return $this->belongsTo(DepartmentArchive::class,'department_id');
    }
    public function courseArchive()
    {
        return $this->belongsTo(CourseArchive::class,'course_id');
    }
}
