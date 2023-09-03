

@extends('layouts.master')

@section('content')
    <h1>Movies</h1>

    <a href="{{ route('admin.movies.create') }}" class="btn btn-primary">Create Movie</a>

    @if (session('success'))
        <div class="alert alert-success mt-3">
            {{ session('success') }}
        </div>
    @endif

    <table class="table mt-3">
        <thead>
            <tr>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Date</th>
                <th>Duration</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($movies as $movie)
                <tr>
                    <td>{{ $movie->title }}</td>
                    <td>{{ $movie->genre }}</td>
                    <td>{{ $movie->release_date }}</td>
                    <td>{{ $movie->duration }} mins</td>
                    <td>
                        <a href="{{ route('admin.movies.show', $movie->id) }}" class="btn btn-sm btn-info">View</a>
                        <a href="{{ route('admin.movies.edit', $movie->id) }}" class="btn btn-sm btn-primary">Edit</a>
                        <form action="{{ route('admin.movies.destroy', $movie->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this movie?')">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
