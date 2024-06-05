<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = User::all();
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
        $validator = Validator::make( $request->all(), [
            "name" => "required",
            "email" => "required",
            "password" => "required",
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(422, "error",$validator->errors());
        }

        try {
            // $request["password"] = bcrypt($request->password);
            $data = User::create($request->all());
            return $this->SuccessResponse(201, 'Success create user', $data);
            
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
            $data = User::find($id);
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
        $validator = Validator::make( $request->all(), [
            "name" => "required",
            "email" => "required",
        ]);
        
        
        if ($validator->fails()) {
            return $this->ErrorResponse(422, 'error',$validator->errors());
        }
        
        $data = User::find($id);
        if (!$data){
            return $this->ErrorResponse(404, 'Data not found');
        }

        if (!empty($request->password)){
            $request["password"] = bcrypt($request->password);
        }else{
            $request["password"] = $data->password;
        }

        try {
            $data->update($request->all());
            return $this->SuccessResponse(200, 'Success update data', $data);
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
            $data = User::find($id);
            $data->delete();
            return $this->SuccessResponse(200, 'Success delete data');
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
