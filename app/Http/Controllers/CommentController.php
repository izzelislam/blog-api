<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Comment::all();
            return $this->SuccessResponse(200, 'Success', $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "article_id"        => "required|exists:articles,id",
            "name"              => "required",
            "email"             => "required",
            "content"           => "required"
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(422, $validator->errors());
        }

        try {
            $data = Comment::create($request->all());
            return $this->SuccessResponse(200, 'Success', $data);
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
            $data = Comment::find($id);
            return $this->SuccessResponse(200, 'Success', $data);
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
            "article_id"        => "required|exists:articles,id",
            "name"              => "required",
            "email"             => "required",
            "content"           => "required"
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(422, $validator->errors());
        }

        try {
            $data = Comment::find($id);
            $data->update($request->all());
            return $this->SuccessResponse(200, 'Success', $data);
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
            $data = Comment::find($id);
            $data->delete();
            return $this->SuccessResponse(200, 'Success', $data);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
