<?php

use App\Http\Controllers\Admin\DistrictController;
use App\Http\Controllers\Admin\DivisionController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['prefix' => 'admin/', 'middleware' => 'auth'], function(){
    Route::get('dashboard', function(){
        return view('layouts.admin.app');
    });
    
    //Division route
    Route::get('division', [DivisionController::class, 'index']);
    Route::post('division-store', [DivisionController::class, 'store']);
    Route::put('division-update/{id}', [DivisionController::class, 'update']);
    Route::delete('division-delete/{id}', [DivisionController::class, 'destroy']);
     //District route
     Route::get('district', [DistrictController::class, 'index']);
     Route::post('district-store', [DistrictController::class, 'store']);
     Route::put('district-update/{id}', [DistrictController::class, 'update']);
     Route::delete('district-delete/{id}', [DistrictController::class, 'destroy']);

});
