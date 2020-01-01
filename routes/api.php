<?php

use Illuminate\Http\Request;

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

// get api token  for users and teachers email/pass
Route::post('/login', 'Api\AuthController@login');

Route::middleware('auth:api')->group(function () {
   Route::resource('products', 'Api\ProductController');
});


// Public Api all frontend access
Route::group(['prefix' => 'public', 'as' => 'public.'], function () {
   require base_path('routes/api/public.php');
});