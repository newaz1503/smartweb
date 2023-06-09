<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DistrictController;
use App\Http\Controllers\Admin\DivisionController;
use App\Http\Controllers\Admin\DashboardController;

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
    Route::get('dashboard', [DashboardController::class, 'index']);

    //Division route
    Route::get('division', [DivisionController::class, 'index']);
    Route::post('division-store', [DivisionController::class, 'store']);
    Route::put('division-update/{id}', [DivisionController::class, 'update']);
    Route::get('district-by-division/{id}', [DivisionController::class, 'show']);
    Route::delete('division-delete/{id}', [DivisionController::class, 'destroy']);
    Route::get('division-district', [DivisionController::class, 'division_district']);
    Route::post('divdist-store', [DivisionController::class, 'division_district_store']);
    //District route
    Route::get('district', [DistrictController::class, 'index']);
    Route::post('district-store', [DistrictController::class, 'store']);
    Route::put('district-update/{id}', [DistrictController::class, 'update']);
    Route::delete('district-delete/{id}', [DistrictController::class, 'destroy']);

});
