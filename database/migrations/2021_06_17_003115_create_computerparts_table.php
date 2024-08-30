<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComputerpartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('computerparts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('computer_id');
            $table->unsignedBigInteger('room_id');
            $table->unique( array('room_id','computer_id') );
            $table->text('brand');
            $table->string('model_number');
            $table->string('status');
            $table->unsignedBigInteger('computercateg_id');
            $table->string('image')->nullable();
            $table->string('submitted_by');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('computerparts');
    }
}
