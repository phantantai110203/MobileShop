<?php

use App\Http\Controllers\ApiBrandController;
use App\Http\Controllers\ApiLoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Spatie\FlareClient\Api;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ApiPhoneModController;
use App\Http\Controllers\ApiSlideController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ReviewController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/






Route::group(
    ['middleware' => 'api'],
    function ($router) {

        // Route::post('/login', [ApiLoginController::class, 'login']);
        // Route::post('/logout', [ApiLoginController::class, 'logout']);
        // Route::post('/register', [ApiLoginController::class, 'register']);
        // Route::get('/profile', [ApiLoginController::class, 'profile']);
        // Route::post('/resetpassword', [ApiLoginController::class, 'resetPassword']);
        Route::get('/users', [UserController::class, 'index']);
        Route::get('/user/{id}', [UserController::class, 'show']);
        Route::get('/brand', [ApiBrandController::class, 'index']);
        Route::get('/slides', [ApiSlideController::class,'index']);


        Route::get('/reviews/{phoneModId}', [ReviewController::class, 'index']);
        Route::post('/reviews/{phoneModId}', [ReviewController::class, 'store']);




        Route::get('/phonemod', [ApiPhoneModController::class, 'index']);
        Route::get('/phonemod/{id}', [ApiPhoneModController::class, 'show']);
        Route::get('/search', [ApiPhoneModController::class, 'search']);


        Route::post('/login', [AuthController::class, 'login']);
        Route::post('/logout', [AuthController::class, 'logout']);
    }
);
//Bắt buộc đăng nhập (trong request có kèm token hợp lệ)
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {

    return $request->user();
});