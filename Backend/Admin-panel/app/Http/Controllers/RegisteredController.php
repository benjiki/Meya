<?php

namespace App\Http\Controllers;
use App\Models\RegisteredUser;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisteredController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = RegisteredUser::all();
        return view('app control.index', compact('users'));
    }

    public function create()
    {
        return view('app control.create');
    }
 public function edit(){
    return view('app control.edit');
 }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:registered_users',
            'password' => 'required|min:6',
            'profile_picture' => 'required',
        ]);

        $user = new RegisteredUser();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = Hash::make($request->input('password'));
        $user->profile_picture = $request->input('profile_picture');
        $user->save();

        return redirect()->route('app control.users.index')->with('success', 'User created successfully.');
    }

    public function update(Request $request, RegisteredUser $user)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:registered_users,email,' . $user->id,
            'password' => 'nullable|min:6',
            'profile_picture' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $user->name = $request->input('name');
        $user->email = $request->input('email');

        if ($request->filled('password')) {
            $user->password = Hash::make($request->input('password'));
        }

        if ($request->hasFile('profile_picture')) {
            $profilePicture = $request->file('profile_picture');
            $profilePicturePath = $profilePicture->store('profile_pictures', 'public');
            $user->profile_picture = $profilePicturePath;
        }

        $user->save();

        return redirect()->route('app control.users.index')->with('success', 'User updated successfully.');
    }

    public function destroy(User $user)
    {
        $user->delete();

        return redirect()->route('app control.users.index')->with('success', 'User deleted successfully.');
    }
}


