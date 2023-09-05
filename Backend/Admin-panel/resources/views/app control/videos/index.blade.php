@extends('layouts.master')
@section('title', 'Admin')
@section('content')

<div class="container-fluid px-4">
    <h1 class="mt-4">All Videos in the App</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Lists</li>
    </ol>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Video Link</th>
                    <th>Thumbnail</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($videos as $video)
                    <tr>
                        <td>{{ $video->name }}</td>
                        <td>{{ $video->video_link }}</td>
                        <td><img src="{{ $video->thumbnail }}" alt="Thumbnail" width="100"></td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('app control.videos.edit', $video) }}" class="btn btn-primary btn-sm">Edit</a>
                                <form action="{{ route('app control.videos.destroy', $video) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this video?')">
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
