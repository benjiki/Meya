@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">Add Upcoming Video</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Create Upcoming Video</li>
    </ol>
    <form action="{{ route('app control.upcoming-videos.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="thumbnail">Thumbnail</label>
            <input type="file" id="thumbnail" name="thumbnail" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">Create Upcoming Video</button>
    </form>
</div>
@endsection
