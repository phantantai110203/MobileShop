<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    // public function login(Request $request)
    // {
    //     $request->validate([
    //         'email' => 'required|email',
    //         'password' => 'required',
    //     ]);

    //     $user = User::where('email', $request->email)->first();

    //     if ($user && Hash::check($request->password, $user->password)) {
    //         $token = $user->createToken('Personal Access Token')->plainTextToken;
    //         return response()->json(['token' => $token]);
    //     }

    //     return response()->json(['error' => 'Mật khẩu hiện tại không chính xác'], 401);
    // }
    //
    public function login(Request $request)
    {


        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            // Authentication passed...
            return response()->json([
                'status' => 'success',
                'message' => 'Login successful',
                'user' => Auth::user()
            ]);
        }
        

        throw ValidationException::withMessages([
            'email' => ['Tài khoản hoặc mật khẩu không chính xác.'],
        ]);
    }
    public function logout()
    {
        Auth::logout();

        return response()->json(['status' => 'success']);
    }
}