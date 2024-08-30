<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComputerpartArchivesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('computerpart_archives', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('computer_id');
            $table->unsignedBigInteger('room_id');
            $table->text('brand');
            $table->string('model_number');
            $table->string('status');
            $table->unsignedBigInteger('computercateg_id');
            $table->string('image')->nullable();
            $table->boolean('active')->default(false);
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
        Schema::dropIfExists('computerpart_archives');
    }
}
