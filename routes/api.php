<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AboutController;
use App\Http\Controllers\API\ServiceController;
use App\Http\Controllers\API\SkillController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(AuthController::class)->group(function(){
    Route::post('login', 'login');
    Route::post('register', 'register');
});

Route::controller(AboutController::class)->group(function(){
    Route::get('edit_about', 'edit_about');
    Route::post('update_about/{id}', 'update_about');
});

Route::controller(ServiceController::class)->group(function(){
    Route::get('admin/services', 'index');
    Route::post('admin/service/create', 'create');
    Route::post('admin/service/update/{id}', 'update');
    Route::get('admin/service/destroy/{id}', 'destroy');
});

Route::controller(SkillController::class)->group(function(){
    Route::get('admin/skills', 'index');
    Route::post('admin/skill/create', 'create');
    Route::post('admin/skill/update/{id}', 'update');
    Route::get('admin/skill/destroy/{id}', 'destroy');
});
