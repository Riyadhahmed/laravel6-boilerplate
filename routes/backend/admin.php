<?php

Route::get('/dashboard', 'DashboardController@index')->name('dashboard');

// Admin
Route::get('/profile', 'AdminController@profile')->name('profile');
Route::get('/edit_profile', 'AdminController@edit')->name('edit');
Route::patch('/edit_profile', 'AdminController@update')->name('update');
Route::get('/change_password', 'AdminController@change_password')->name('change_password');
Route::patch('/change_password', 'AdminController@update_password')->name('change_password');


/* ===== Access Management Start =========== */

Route::resource('users', 'UserController');
Route::get('/allUser', 'UserController@allUser')->name('allUser.users');
Route::get('/export', 'UserController@export')->name('export');

Route::resource('permissions', 'PermissionController');
Route::get('/allPermission', 'PermissionController@allPermission')->name('allPermission.permissions');

Route::resource('roles', 'RoleController');
Route::get('/allRole', 'RoleController@allRole')->name('allRole.roles');


// Department Controller
Route::resource('departments', 'DepartmentController');
Route::get('/allDepartments', 'DepartmentController@allDepartments')->name('allDepartments');


/* ===== Settings Start =========== */

// Settings Controller
Route::resource('settings', 'SettingsController');
Route::get('/allSetting', 'SettingsController@allSetting')->name('allSetting.settings');

/* ===== Settings End =========== */

/* ===== Backup Start =========== */

Route::get('backups', 'BackupController@index');
Route::get('allBackups', 'BackupController@getall')->name('allBackups.backups');
Route::post('backups/db_backup', 'BackupController@db_backup');
Route::post('backups/full_backup', 'BackupController@full_backup');
Route::get('backups/download/{file_name}', 'BackupController@download');
Route::delete('backups/delete/{file_name}', 'BackupController@delete');

/* ===== Backup End =========== */


// Examples

Route::get('/barcode', 'AdminController@barcode');
Route::get('/passport', 'AdminController@passport');