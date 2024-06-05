<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Category::all();
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
        $validator =Validator::make($request->all(),[
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(500, $validator->errors());
        }

        try {
            $data = Category::create($request->all());
            return $this->SuccessResponse(201, 'Success', $data);
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
            $data = Category::find($id);
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
            'name' => 'required',
        ]);

        try {
            $data = Category::find($id);
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
            $data = Category::find($id);
            $data->delete();
            return $this->SuccessResponse(200, 'Success');
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
