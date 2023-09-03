<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\Admin\MovieController;



Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware('auth');

    Route::get('/dashboard', [App\Http\Controllers\dashboardController::class, 'dash'])->name('dash')->middleware('auth','isAdmin');

    // routes/web.php

// User management routes
Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {
    // List users
    Route::get('/users', [UsersController::class, 'index'])->name('admin.users.index');

    // Create a user
    Route::get('/users/create', [UsersController::class, 'create'])->name('admin.users.create');
    Route::post('/users', [UsersController::class, 'store'])->name('admin.users.store');

    // Edit a user
    Route::get('/users/{user}/edit', [UsersController::class, 'edit'])->name('admin.users.edit');
    Route::put('/users/{user}', [UsersController::class,'update'])->name('admin.users.update');

    // Delete a user
    Route::delete('/users/{user}', [UsersController::class,'destroy'])->name('admin.users.destroy');
});
Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function () {
    // Movie Routes
    Route::get('/movies', 'Admin\MovieController@index')->name('admin.movies.index');
    Route::get('/movies/create', 'Admin\MovieController@create')->name('admin.movies.create');
    Route::post('/movies', 'Admin\MovieController@store')->name('admin.movies.store');
    Route::get('/movies/{movie}', 'Admin\MovieController@show')->name('admin.movies.show');
    Route::get('/movies/{movie}/edit', 'Admin\MovieController@edit')->name('admin.movies.edit');
    Route::put('/movies/{movie}', 'Admin\MovieController@update')->name('admin.movies.update');
    Route::delete('/movies/{movie}', 'Admin\MovieController@destroy')->name('admin.movies.destroy');
});
Route::prefix('admin')->name('admin.')->group(function () {
    Route::resource('movies', MovieController::class);
});




