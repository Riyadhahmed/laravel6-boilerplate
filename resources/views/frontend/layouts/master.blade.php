<!DOCTYPE html>
<html>
<head>
    @include('frontend.layouts.head')
</head>
<body>
<div class="{{ $app_settings->layout ? '' : 'container' }}">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- header section -->

    <!-- header section end-->
    <section>
        @yield('content')
    </section>
    <!-- Footer section -->
    <footer>
        @include('frontend.layouts.footer')
    </footer>
</div>
</body>
</html>
