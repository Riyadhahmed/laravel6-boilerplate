@extends('frontend.layouts.right_master')
@section('title', 'View Details')
@section('content')
    <section class="blog-page-section">
        @if($news)
            <div class="col-md-12">
                <div class="post-item post-details">
                    <img src="{{ asset($news->file_path) }}" class="post-thumb-full img-responsive" alt="{{ $news->title }}">
                    <div class="post-content">
                        <h3>{{ $news->title }}</h3>
                        <div class="post-meta">
                            <span><i class="fa fa-calendar-o"></i> {{ $news->created_at }}</span>
                            <span><i class="fa fa-user"></i> {{ $news->author? $news->author->name : ''}}</span>
                        </div>
                        <p class="news_details">{{ $news->description }} </p>
                    </div>
                </div>
            </div>
        @else
            <div class="col-md-12">
                Sorry Nothing found!!!
            </div>
        @endif
    </section>
@endsection