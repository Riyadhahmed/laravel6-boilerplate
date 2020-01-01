@extends('backend.layouts.master')
@section('title', 'Dashboard')
@section('content')
    <div class="app-page-title">
        <div class="page-title-wrapper">
            <div class="page-title-heading">
                <div class="page-title-icon">
                    <i class="pe-7s-home icon-gradient bg-mean-fruit"></i>
                </div>
                <div><h1 style="color: #786c7f; font-weight: 500"> DASHBOARD </h1></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <img src="data:image/png;base64,{{DNS1D::getBarcodePNG('1234567', 'C39',1.2,65)}}"
                         alt="barcode"/>
                </div>
            </div>
        </div>
    </div>
@endsection
