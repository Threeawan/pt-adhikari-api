<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController;

class RegisterController extends BaseController
{
    public function register(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'email'=>'required',
            'password'=>'required',
            'c_password'=>'required|same:password'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error!', $validator->errors());
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $succes['token'] = $user->createToken('MyApp')->plainTextToken;
        $succes['name'] = $user->name;
        $succes['password'] = $user->password;

        return $this->sendResponse($succes, 'User Register Successfully!');
    }

    public function login(Request $request): JsonResponse
    {
        if(Auth::attempt(['email'=>$request->email, 'password'=>$request->password])){
            $user = Auth::user();
            $success['token'] = $user->createToken('MyApp')->plainTextToken;
            $success['name'] = $user->name;

            return $this->sendResponse($success, 'User Login Successfully!');
        }else{
            return $this->sendError('Unauthorised',['error'=>'Unauthorised']);
        }
    }
}
