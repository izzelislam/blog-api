<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "email" => "required|email",
            "password" => "required"
        ]);

        if ($validator->fails()) {
            return $this->ErrorResponse(422, $validator->errors());
        }

        try {
            
            $credentials = $request->only('email', 'password');
            $token =    auth("api")->attempt($credentials);
    
            if (!$token) {
                return $this->ErrorResponse(400, 'Email atau password salah');
            }

            $user = auth("api")->user();
            return $this->SuccessResponse(200, 'Success', [
                "token" => $token,
                "user" => $user
            ]);

        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    public function logout()
    {
        try {
            auth("api")->logout();
            return $this->SuccessResponse(200, 'Success', []);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }

    public function me()
    {
        try {
            $user = auth()->user();
            return $this->SuccessResponse(200, 'Success', $user);
        } catch (\Throwable $e) {
            return $this->ErrorResponse(500, $e->getMessage());
        }
    }
}
