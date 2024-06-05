<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Article::with("category")->get();
            return $this->SuccessResponse(200, "success", $data);
        } catch (\Throwable $e) {
            # code...
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "category_id"       => "required|exists:categories,id",
            "title"             => "required",
            "image_cover"       => "required|mimes:png,jpg",
            "content"           => "required",
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(500, $validator->errors());
        }

        try {

            // store image to storage
            $image = $request->file("image_cover");
            $request["image"] = $image->store("article", "public");

            $data = Article::create($request->all());

            return $this->SuccessResponse(201, "success", $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $data = Article::find($id);
            return $this->SuccessResponse(200, "success", $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(), [
            "category_id"       => "required|exists:categories,id",
            "title"             => "required",
            "image_cover"       => "nullable|mimes:png,jpg",
            "content"           => "required",
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(500, $validator->errors());
        }

        try {
            $data = Article::find($id);

            if ($request->hasFile("image_cover")) {
                // delete image from storage
                $image_path = public_path($data->image);
                if (file_exists($image_path)) {
                    unlink($image_path);
                }

                $image = $request->file("image_cover");
                $request["image"] = $image->store("article", "public");
            }
            $data->update($request->all());

            return $this->SuccessResponse(200, "success", $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $data = Article::find($id);
            $data->delete();
            return $this->SuccessResponse(200, "success");
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
