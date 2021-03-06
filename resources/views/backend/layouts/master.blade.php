<!doctype html>
<html>
<head>
    @include('backend.layouts.head')
</head>
<body>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
    @include('backend.layouts.topbar')
    <div class="app-main">
        @include('backend.layouts.sidebar')
        <div class="app-main__outer">
            <div class="app-main__inner">
                @yield('content')
            </div>
        </div>
    </div>
    <div class="app-wrapper-footer">
        @include('backend.layouts.footer')
        @include('backend.partials.modal')
        @include('backend.layouts.datatable')
    </div>
</div>
</body>
</html>