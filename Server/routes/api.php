<?php

use App\Http\Controllers\ApiBrandController;
use App\Http\Controllers\ApiLoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Spatie\FlareClient\Api;
use App\Http\Controllers\UserController;



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

Route::get('/user/{$id}', [UserController::class, 'show']);




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
    }
);
//Bắt buộc đăng nhập (trong request có kèm token hợp lệ)
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {

    return $request->user();
});
