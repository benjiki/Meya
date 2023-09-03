@extends('layouts.master')

@section('title', 'Admin')

@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Movies</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">detail description</li>
    </ol>
    <div class="row">
        <div class="col-md-6">
            <form action="{{ route('admin.movies.store') }}" method="POST">
                @csrf
                <!-- Add your input fields here -->
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="title" id="title" class="form-control" placeholder="Title" required>
                </div>
                <div class="form-group">
                    <label for="genre">Genre</label>
                    <input type="text" name="genre" id="genre" class="form-control" placeholder="Genre" required>
                </div>
                <div class="form-group">
                    <label for="release_date">Release Date</label>
                    <input type="date" name="release_date" id="release_date" class="form-control" placeholder="Release Date" required>
                </div>
                <div class="form-group">
                    <label for="duration">Duration (in minutes)</label>
                    <input type="number" name="duration" id="duration" class="form-control" placeholder="Duration" required>
                    <small class="form-text text-muted">Enter the duration of the movie in minutes.</small>
                </div>
                <!-- Add other input fields for movie details -->
                <button type="submit" class="btn btn-primary">Create Movie</button>
            </form>
        </div>
    </div>
</div>
@endsection
