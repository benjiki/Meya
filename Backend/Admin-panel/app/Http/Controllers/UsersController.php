<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function index()
    {
        // Fetch all users from the database
        $users = User::all();

        // Pass the users to the view
        return view('admin.users control.index', ['users' => $users]);
    }

    public function create()
    {
        // Render the create user form
        return view('admin.users control.add user');
    }

    public function store(Request $request)
    {
        // Validate user input
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users|max:255',
            'password' => 'required|string|min:6|confirmed',
        ]);

        // Create a new user
        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => bcrypt($validatedData['password']),
        ]);

        // Redirect to the user listing page with a success message
        return redirect()->route('admin.users control.index')->with('success', 'User created successfully!');
    }

    public function edit(User $user)
    {
        // Render the edit user form
        return view('admin.users control.edit user', ['user' => $user]);
    }

    public function update(Request $request, User $user)
    {
        // Validate user input
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'password' => 'nullable|string|min:6|confirmed',
        ]);

        // Update the user
        $user->update([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => $validatedData['password'] ? bcrypt($validatedData['password']) : $user->password,
        ]);

        // Redirect to the user listing page with a success message
        return redirect()->route('admin.users control.index')->with('success', 'User updated successfully!');
    }

    public function destroy(User $user)
    {
        // Delete the user
        $user->delete();

        // Redirect to the user listing page with a success message
        return redirect()->route('admin.users.index')->with('success', 'User deleted successfully!');
    }
}
