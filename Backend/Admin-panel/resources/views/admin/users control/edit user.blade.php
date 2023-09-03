@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">Dashboard</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Dashboard</li>
    </ol>
    <form action="{{ route('admin.users.update', $user) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="{{ $user->name }}" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="{{ $user->email }}" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">New Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="New Password">
        </div>
        <div class="form-group">
            <label for="password_confirmation">Confirm New Password</label>
            <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" placeholder="Confirm New Password">
        </div>
        <button type="submit" class="btn btn-success">Update User</button>
    </form>
</div>
@endsection
