@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">Edit Upcoming Video</h1>
    <ol class="breadcrumb mb-4">
        <a href="{{ route('app control.upcoming-videos.index') }}">
            <li class="breadcrumb-item active">Upcoming Videos</li>
        </a>
    </ol>
    <form action="{{ route('app control.upcoming-videos.update', $upcomingVideo) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="{{ $upcomingVideo->name }}" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="thumbnail">Thumbnail</label>
            <input type="file" id="thumbnail" name="thumbnail" class="form-control-file">
        </div>
        <div class="form-group">
            <label for="start_date">Start Date</label>
            <input type="date" id="start_date" name="start_date" value="{{ $upcomingVideo->start_date->format('Y-m-d') }}" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="end_date">End Date</label>
            <input type="date" id="end_date" name="end_date" value="{{ $upcomingVideo->end_date->format('Y-m-d') }}" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Update Upcoming Video</button>
    </form>
</div>
@endsection
