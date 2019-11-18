<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;

class AuthController extends Controller
{
    public function login(Request $request){

        $http = new \GuzzleHttp\Client;

        try{
            $response = $http->post(config('services.passport.login_endpoint'),[
                'form_params' => [
                    'grant_type' => 'password',
                    'client_id' => config('services.passport.client_id'),
                    'client_secret' => config('services.passport.client_secret'),
                    'username' => $request->username,
                    'password' => $request->password,
                ]
            ]);
            return $response->getBody();
        } catch(\GuzzleHttp\Exception\BadResponseException $e) {
            if($e->getCode() == 400) {
                return response()->json(['message' => 'Invalid request. Please enter a username or a password'], $e->getCode());
            }else if ($e->getCode() == 401){
                return response()->json(['message' => 'Your Credientials are incorrect. Please Try Again.'], $e->getCode());
            }

            return response()->json('Something went wrong on the server.', $e->getCode());
        }
    }

    public function logout() {
        Auth::user()->tokens->each(function($token, $key){
            $token->delete();
        });

        return response()->json('Logged out successfully.');
    }

    public function profile(Request $request) {
        return $request->user();
    }
}
