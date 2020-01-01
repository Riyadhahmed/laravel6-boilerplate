<div class="app-footer">
    <div class="col-12 text-center rounded-top"
         style="bottom: 0; font-weight: bold;padding: 10px;">
        Laravel 6 Boilerplate || Developed by Riyadh Ahmed || &nbsp; {{date('Y')}}
    </div>
</div>
<script src="{{ asset('/assets/js/main.js') }}"></script>
<script src="{{ asset('/assets/js/jquery.validate.min.js') }}"></script>

<!-- Sweet Alert library -->
<link rel="stylesheet" href="{{ asset('/assets/plugins/sweet-alert/sweetalert.css') }}">
<script src="{{ asset('/assets/plugins/sweet-alert/sweetalert.min.js') }}"></script>

<link rel="stylesheet" href="{{ asset('/assets/plugins/select2/select2.min.css') }}">
<script src="{{ asset('/assets/plugins/select2/select2.full.min.js') }}"></script>


<!-- Toastr  library -->
<link rel="stylesheet" href="{{ asset('/assets/plugins/toastr/toastr.min.css') }}">
<script src="{{ asset('/assets/plugins/toastr/toastr.min.js') }}"></script>

<script>
    $.fn.modal.Constructor.prototype.enforceFocus = function () {};
</script>
<script>

    function notify_view(type, message) {

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr[type](message);

    }
</script>