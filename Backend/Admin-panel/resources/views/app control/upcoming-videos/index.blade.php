@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">All Upcoming Videos</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Lists</li>
    </ol>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Thumbnail</th>

                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($upcomingVideos as $upcomingVideo)
                    <tr>
                        <td>{{ $upcomingVideo->name }}</td>
                        <td>
                            @if ($upcomingVideo->thumbnail)
                                <img src="{{ asset('storage/'.$upcomingVideo->thumbnail) }}" alt="Thumbnail" width="100">
                            @else
                                No Thumbnail
                            @endif
                        </td>

                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('app control.upcoming-videos.edit', $upcomingVideo) }}" class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('app control.upcoming-videos.destroy', $upcomingVideo) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this upcoming video?')">
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
