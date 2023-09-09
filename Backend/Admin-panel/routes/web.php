<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\Admin\MovieController;
use App\Http\Controllers\RegisteredController;
use App\Http\Controllers\VideosController;
use App\Http\Controllers\UpcomingVideosController;


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
Route::group(['prefix' => 'app control', 'middleware' => 'auth'], function () {
    // List users
    Route::get('/Registeredusers', [RegisteredController::class, 'index'])->name('app control.users.index');

    // Create a user
    Route::get('/registeredusers/create', [RegisteredController::class, 'create'])->name('app control.users.create');
    Route::post('/registeredusers', [RegisteredController::class, 'store'])->name('app control.users.store');

    // Edit a user

    Route::get('/registeredusers/{user}/edit', [RegisteredController::class, 'edit'])->name('app control.users.edit');
    Route::put('/registeredusers/{user}', [RegisteredController::class,'update'])->name('app control.users.update');

    // Delete a user
    Route::delete('/registeredusers/{user}', [RegisteredController::class,'destroy'])->name('app control.users.destroy');
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
Route::group(['prefix' => 'app control', 'middleware' => 'auth'], function () {
    // Movie Routes
    Route::get('/videos', [App\Http\Controllers\VideosController::class, 'index'])->name('app control.videos.index');
    Route::get('/videos/create', [App\Http\Controllers\VideosController::class, 'create'])->name('app control.videos.create');
    Route::post('/videos', [App\Http\Controllers\VideosController::class, 'store'])->name('app control.videos.store');
    Route::get('/videos/{video}', [App\Http\Controllers\VideosController::class, 'show'])->name('app control.videos.show');
    Route::get('/videos/{video}/edit', [App\Http\Controllers\VideosController::class, 'edit'])->name('app control.videos.edit');
    Route::put('/videos/{video}', [App\Http\Controllers\VideosController::class, 'update'])->name('app control.videos.update');
    Route::delete('/videos/{video}', [App\Http\Controllers\VideosController::class, 'destroy'])->name('app control.videos.destroy');
});
Route::group(['prefix' => 'app-control', 'middleware' => 'auth'], function () {
    Route::get('/upcoming-videos', [UpcomingVideosController::class, 'index'])->name('upcoming-videos.index');
    Route::get('/upcoming-videos/create', [UpcomingVideosController::class, 'create'])->name('upcoming-videos.create');
    Route::post('/upcoming-videos', [UpcomingVideosController::class, 'store'])->name('upcoming-videos.store');
    Route::get('/upcoming-videos/{upcomingVideo}/edit', [UpcomingVideosController::class, 'edit'])->name('upcoming-videos.edit');
    Route::put('/upcoming-videos/{upcomingVideo}', [UpcomingVideosController::class, 'update'])->name('upcoming-videos.update');
    Route::delete('/upcoming-videos/{upcomingVideo}', [UpcomingVideosController::class, 'destroy'])->name('upcoming-videos.destroy');
});



