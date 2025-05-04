<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CuponesController;
use App\Http\Controllers\AuthController;

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

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/cupon/{codigo}', [CuponesController::class, 'show']); //ruta para obtener la info del cupon
    Route::put('/cupon/{codigo}/canjear', [CuponesController::class, 'canjear']); //ruta para canjear el cupon, si es valido
    Route::post('/logout', [AuthController::class, 'logout']); // Logout
    
});



Route::post('/register', [AuthController::class, 'register']); //registro de usuarios
Route::post('/login', [AuthController::class, 'login']); //inicio de sesion y generacion del token
