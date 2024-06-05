<?php

use App\Http\Controllers\ArticleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post("/login" , [AuthController::class, "login"]);


Route::get("/home/get-articles", [HomeController::class, "getArticles"]);
Route::get("/home/find-articles/{id}", [HomeController::class, "findArticles"]);
Route::get("/home/get-category", [HomeController::class, "getCategory"]);
Route::get("/home/article-by-category", [HomeController::class, "articleByCategory"]);
Route::resource("/home/comments", CommentController::class)->except(["create", "edit", "destroy", "update"]);
Route::resource("/home/categories", CategoryController::class)->only(["index", "show"]);

Route::middleware(["auth:api", "api"])->group(function(){
  Route::get("/me" , [AuthController::class, "me"]);
  Route::post("/logout" , [AuthController::class, "logout"]);
  
  Route::resource("/users", UserController::class)->except(["create", "edit"]);
  Route::resource("/categories", CategoryController::class)->except(["create", "edit"]);
  Route::resource("/articles", ArticleController::class)->except(["create", "edit"]);
  // Route::post("/articles/{id}", [ArticleController::class, "update"]);
  
  Route::resource("/comments", CommentController::class)->except(["create", "edit"]);
});

