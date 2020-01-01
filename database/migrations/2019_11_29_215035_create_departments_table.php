<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepartmentsTable extends Migration
{
   /**
    * Run the migrations.
    *
    * @return void
    */
   public function up()
   {
      Schema::create('departments', function (Blueprint $table) {
         $table->bigIncrements('id');
         $table->string('dept_name');
         $table->string('description')->nullable();
         $table->integer('uploaded_by')->nullable();
         $table->tinyInteger('status')->nullable()->default(1);
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
      Schema::dropIfExists('departments');
   }
}
