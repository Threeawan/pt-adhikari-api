<?php

use App\Http\Controllers\Api\AnggotaController;
use App\Http\Controllers\Api\BukuController;
use App\Http\Controllers\Api\PegawaiController;
use App\Http\Controllers\Api\PeminjamanController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
  //  return $request->user();
//});


Route::controller(RegisterController::class)->group(function(){
  Route::post('register','register');
  Route::post('login','login');
});

Route::controller(BukuController::class)->group(function(){
    Route::get('buku','index');
    Route::get('buku/{id}','show');
    Route::post('buku','store');
    Route::put('buku/{id}','update');
    Route::delete('buku/{id}','destroy');
});

Route::controller(AnggotaController::class)->group(function(){
  Route::get('anggota', 'index');
  Route::get('anggota/{id}', 'show');
  Route::post('anggota', 'store');
  Route::put('anggota/{id}', 'update');
  Route::delete('anggota/{id}', 'destroy');

});

Route::controller(PegawaiController::class)->group(function(){
  Route::get('pegawai','index');
  Route::get('pegawai/{id}','show');
  Route::post('pegawai','store');
  Route::put('pegawai/{id}','update');
  Route::delete('pegawai/{id}','destroy');
});

Route::controller(PeminjamanController::class)->group(function(){
  Route::get('peminjaman','index');
  Route::get('peminjaman/{id}','show');
  Route::post('peminjaman','store');
  Route::put('peminjaman/{id}','update');
  Route::delete('peminjaman/{id}','destroy');
});

Route::group(['middleware' => 'api','prefix' => 'auth'], function ($router) {
  Route::post('register', [AuthController::class,'register']);
  Route::post('login', [AuthController::class,'login']);
  Route::post('logout', [AuthController::class,'logout']);
  Route::post('refresh', [AuthController::class,'refresh']);
  Route::post('me', [AuthController::class,'me']);
});