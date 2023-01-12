<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AboutController;
use App\Http\Controllers\API\ServiceController;
use App\Http\Controllers\API\SkillController;
use App\Http\Controllers\API\EducationController;
use App\Http\Controllers\API\ExperienceController;
use App\Http\Controllers\API\ProjectController;
use App\Http\Controllers\API\TestimonialController;
use App\Http\Controllers\API\MessageController;
use App\Http\Controllers\API\UserController;
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
    Route::get('/admin/user_data', 'getData');
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

Route::controller(EducationController::class)->group(function(){
    Route::get('admin/educations', 'index');
    Route::post('admin/education/create', 'create');
    Route::post('admin/education/update/{id}', 'update');
    Route::get('admin/education/destroy/{id}', 'destroy');
});

Route::controller(ExperienceController::class)->group(function(){
    Route::get('admin/experiences', 'index');
    Route::post('admin/experience/create', 'create');
    Route::post('admin/experience/update/{id}', 'update');
    Route::get('admin/experience/destroy/{id}', 'destroy');
});

Route::controller(ProjectController::class)->group(function(){
    Route::get('admin/projects', 'index');
    Route::post('admin/project/create', 'create');
    Route::get('admin/project/edit/{id}', 'edit');
    Route::post('admin/project/update/{id}', 'update');
    Route::get('admin/project/destroy/{id}', 'destroy');
});

Route::controller(TestimonialController::class)->group(function(){
    Route::get('admin/testimonials', 'index');
    Route::post('admin/testimonial/create', 'create');
    Route::get('admin/testimonial/edit/{id}', 'edit');
    Route::post('admin/testimonial/update/{id}', 'update');
    Route::get('admin/testimonial/destroy/{id}', 'destroy');
});

Route::controller(MessageController::class)->group(function(){
    Route::get('admin/messages', 'index');
    Route::post('admin/message/status/{id}', 'changeStatus');
    Route::get('admin/message/destroy/{id}', 'destroy');
});

Route::controller(UserController::class)->group(function(){
    Route::get('admin/users', 'index');
    Route::post('admin/user/create', 'create');
    Route::post('admin/user/update/{id}', 'update');
    Route::get('admin/user/destroy/{id}', 'destroy');
    Route::get('admin/user/profile', 'profile');
    Route::post('admin/user/update_profile/{id}', 'updateProfile');
});
