@extends('frontend.layouts.master')
@section('title', 'Home')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="jumbotron">
                <div class="text-center">
                    <img class="mb-6" src="{{ asset('assets/images/logo.webp') }}" width="20%"/>
                </div>
                <div class="text-center text-bold"><br/>
                    <h1><strong>Laravel 6 Boilerplate</strong></h1>
                </div>
            </div>
        </div>
    </div>
    <div class="row mb-5 pad-2">
        <div class="col-6">
            <a href="/admin_login/login">
                <div class="card-body bg-midnight-bloom text-white text-center">
                    <i class="fa fa-sign-in-alt fa-5x mb-2"></i>
                    <h6>Admin Login</h6>
                </div>
            </a>
        </div>
        <div class="col-6">
            <a href="/user_login/login">
                <div class="card-body bg-grow-early text-white text-center">
                    <i class="fa fa-download fa-5x mb-2"></i>
                    <h6>User Login</h6>
                </div>
            </a>
        </div>
    </div>
    <style>
        .card-body {
            border-radius: 5px;
        }

        .pad-2 {
            padding: 15px;
        }
    </style>
@endsection