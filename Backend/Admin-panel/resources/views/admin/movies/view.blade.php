@extends('layouts.master')

@section('title', 'Movie Details')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Movie Details</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="{{ route('admin.movies.index') }}">Movies</a></li>
            <li class="breadcrumb-item active">Movie Details</li>
        </ol>
        <div class="row">
            <div class="col-md-6">
                <h3>Title: {{ $movie->title }}</h3>
                <p>Genre: {{ $movie->genre }}</p>
                <p>Release Date: {{ $movie->release_date }}</p>
                <p>Duration: {{ $movie->duration }} minutes</p>
                <!-- Display other movie details here -->
            </div>
        </div>
    </div>
@endsection
