@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">Edit Video</h1>
    <ol class="breadcrumb mb-4">
        <a href="{{ route('app control.videos.index') }}">
            <li class="breadcrumb-item active">Videos</li>
        </a>
    </ol>
    <form action="{{ route('app control.videos.update', $video) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="{{ $video->name }}" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="thumbnail">Thumbnail</label>
            <input type="file" id="thumbnail" name="thumbnail" class="form-control">
        </div>
        <div class="form-group">
            <label for="video_link">Video Link</label>
            <input type="text" id="video_link" name="video_link" value="{{ $video->video_link }}" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Update Video</button>
    </form>
</div>
@endsection
