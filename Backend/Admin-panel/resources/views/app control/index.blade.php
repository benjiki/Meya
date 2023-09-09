@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">All registered  users in the app</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Lists</li>
    </ol>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th> profile picture</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $user)
                    <tr>
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->email }}</td>
                        <td>{{ $user->profile_picture }}</td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('app control.users.edit', $user) }}" class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('app control.users.destroy', $user) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this user?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

<style>
    .action-buttons {
        display: flex;
        align-items: center;
    }

    .action-buttons button {
        margin-left: 5px;
    }
</style>

@endsection
