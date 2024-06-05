<?php

namespace App\Http\Controllers;

use App\Models\Article;
use App\Models\Category;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getArticles()
    {
        $paging = request("paging") ?? 10;
        try {
            $data = Article::with("category")->orderBy("created_at", "desc")->paginate($paging);
            return $this->SuccessResponse(200, 'Success', $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    public function findArticles($id)
    {
        try {
            $data = Article::where("id", $id)->with("category", "comments")->first();
            return $this->SuccessResponse(200, 'Success', $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    public function getCategory()
    {
        try {
            $data = Category::all();
            return $this->SuccessResponse(200, 'Success', $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    public function articleByCategory()
    {
        try {
            $category = request("category");

            $data = Article::where("category_id", $category)->orderBy("created_at", "desc")->with("category")->get();
            return $this->SuccessResponse(200, 'Success', $data);

        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
