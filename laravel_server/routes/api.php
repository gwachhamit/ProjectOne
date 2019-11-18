<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/login','Api\AuthController@login');

Route::group(['middleware' => 'auth:api'], function ($router) {

    Route::get('/profile','Api\AuthController@profile');
    Route::post('/logout','Api\AuthController@logout');

    // Route::apiResource('/users', 'Api\UserController');
    Route::get('/users',['as'=>'users.index','uses' => 'Api\UserController@index', 'middleware'=>['role_or_permission:admin|list_user']]);
    Route::post('/users/create',['as'=>'users.store','uses' => 'Api\UserController@store', 'middleware'=>['role_or_permission:admin|create_user']]);
    Route::get('/users/{id}',['as'=>'users.show','uses' => 'Api\UserController@show', 'middleware'=>['role_or_permission:admin|show_user']]);
    Route::patch('/users/{id}/update',['as'=>'users.update','uses' => 'Api\UserController@update', 'middleware'=>['role_or_permission:admin|edit_user']]);
    Route::delete('/users/{id}/delete',['as'=>'users.destroy','uses' => 'Api\UserController@destroy', 'middleware'=>['role_or_permission:admin|delete_user']]);

    // Route::apiResource('/roles', 'Api\RoleController');
    Route::get('/roles',['as'=>'roles.index','uses' => 'Api\RoleController@index', 'middleware'=>['role_or_permission:admin|list_role']]);
    Route::post('/roles/create',['as'=>'roles.store','uses' => 'Api\RoleController@store', 'middleware'=>['role_or_permission:admin|create_role']]);
    Route::get('/roles/{id}',['as'=>'roles.show','uses' => 'Api\RoleController@show', 'middleware'=>['role_or_permission:admin|show_role']]);
    Route::patch('/roles/{id}/update',['as'=>'roles.update','uses' => 'Api\RoleController@update', 'middleware'=>['role_or_permission:admin|edit_role']]);
    Route::delete('/roles/{id}/delete',['as'=>'roles.destroy','uses' => 'Api\RoleController@destroy', 'middleware'=>['role_or_permission:admin|delete_role']]);

    // Route::apiResource('/permissions', 'Api\PermissionController');
    Route::get('/permissions',['as'=>'permissions.index','uses' => 'Api\PermissionController@index', 'middleware'=>['role_or_permission:admin|list_permission']]);
    Route::post('/permissions/create',['as'=>'permissions.store','uses' => 'Api\PermissionController@store', 'middleware'=>['role_or_permission:admin|create_permission']]);
    Route::get('/permissions/{id}',['as'=>'permissions.show','uses' => 'Api\PermissionController@show', 'middleware'=>['role_or_permission:admin|show_permission']]);
    Route::patch('/permissions/{id}/update',['as'=>'permissions.update','uses' => 'Api\PermissionController@update', 'middleware'=>['role_or_permission:admin|edit_permission']]);
    Route::delete('/permissions/{id}/delete',['as'=>'permissions.destroy','uses' => 'Api\PermissionController@destroy', 'middleware'=>['role_or_permission:admin|delete_permission']]);

});

