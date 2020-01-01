@extends('backend.layouts.master')
@section('title', 'Laravel Passport Example')
@section('content')
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="pe-7s-menu icon-gradient bg-mean-fruit"></i>
                </div>
                <div><h1 style="color: #786c7f; font-weight: 500"> Laravel Passport Example </h1></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <h4>Basic Api calling</h4>
                    <a class="btn btn-success" href="/api/public/allDepartment" target="_blank">View All Department</a>
                    <br/><br/>
                    <code>
                        To view auth api you have to use postman tools
                        <br/>
                        // Login Api
                        <br/>
                        http://your-domin/api/login
                        <br/>
                        Please use

                        'headers' => [
                        'Accept' => 'application/json',
                        'Authorization' => 'Bearer '.$accessToken,
                        ]

                    </code>
                </div>
            </div>
        </div>
    </div>
@endsection
