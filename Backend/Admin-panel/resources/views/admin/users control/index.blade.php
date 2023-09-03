@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">All users</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Lists</li>
    </ol>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $user)
                    <tr>
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->email }}</td>
                        <td>
                            <a href="{{ route('admin.users.edit', $user) }}" class="btn btn-primary btn-sm">Edit</a>
                            <form action="{{ route('admin.users.destroy', $user) }}" method="POST" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
