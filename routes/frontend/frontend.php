<?php

Route::get('/', 'HomeController@index');

Route::get('/viewNews/{news}', 'HomeController@viewNews');