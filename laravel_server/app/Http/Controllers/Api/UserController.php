<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Image;
use File;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

use App\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|unique:users',
            'password' => 'required|string|min:8',
            'confirm_password' => 'required|same:password',
            'role' => 'required',
            // 'type' => 'required|string|max:191',
            'photo' => 'required',
        ]);

        if($request->photo != ''){
            $filename = time(). '.'.str_slug($request->photo).'.'.$request->photo->getClientOriginalExtension();
            // $filename = time(). '.' .explode('/', explode(':', substr($request->photo, 0, strpos($request->photo,';')))[1])[1];
            Image::make($request->photo)->save(public_path('img/user/').$filename);
        }

        $role = Role::find($request['role']);
        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'type' => $role->name,
            'photo' => $filename,
            'password' => Hash::make($request['password']),
        ]);
        $user->assignRole($role);
        return $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);
        return $user;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|unique:users,email,'.$id,
            'password' => 'sometimes|string|min:8',
            // 'type' => 'required|string|max:191',
            // 'photo' => 'required',
        ]);

        $user = User::findOrFail($id);
        if($request['password'] != ''){
            $request['password'] = Hash::make($request['password']);
        } else {
            $request['password'] = $user->password;
        }

        $current_photo = $user->photo;

        if($request->photo != '' && $request->photo != $current_photo){
            $filename = time(). '.'.str_slug($request->photo).'.'.$request->photo->getClientOriginalExtension();
            // $filename = time(). '.' .explode('/', explode(':', substr($request->photo, 0, strpos($request->photo,';')))[1])[1];
            Image::make($request->photo)->save(public_path('img/user/').$filename);
            // remove $current_photo if not null
            $user_photo = public_path('img/user/').$current_photo;
            if(file_exists($user_photo)){
                @unlink($user_photo);
            }
        } else {
            $filename = $user->photo;
        }

        $role = Role::find($request['role']);
        $user->update([
            'name' => $request['name'],
            'email' => $request['email'],
            'type' => $role->name,
            'photo' => $filename,
            'password' => $request['password'],
        ]);
        $user->syncRoles([$role]);

        return $user;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        if ($user->photo != '') {
            File::delete(public_path('img/user/').$user->photo);
        }
        $user->delete();
    }
}
