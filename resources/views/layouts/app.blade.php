<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ __('POS') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap">
        <link rel="shortcut icon" href="{{ asset('assets/images/favicon.png') }}" type="image/png">
        <!-- Scripts -->
        {{-- @vite(['resources/css/app.css', 'resources/js/app.js']) --}}

        
        @livewireStyles
       
        @include('includes.main-css')

        @yield('style')
        @stack('style')
        <style>
            .notyf__toast--success{
                max-width: 700px !important;
            }
            .notyf__toast--success .notyf__ripple{
                background: #3dc7b2 !important;
                width: 700px !important;
            }

            .notyf__toast--info{
                max-width: 700px !important;
            }

            .notyf__toast--info .notyf__ripple{
                background: #5ab8f6 !important;
                width: 700px !important;
            }

            .notyf__toast--warning{
                max-width: 700px !important;
            }
            .notyf__toast--warning .notyf__ripple{
                background: #f6b25a !important;
                width: 700px !important;
            }

            .notyf__toast--error{
                max-width: 700px !important;
            }
            .notyf__toast--error .notyf__ripple{
                background: #f65a5a !important;
                width: 700px !important;
            }

                        
            [x-cloak] { display: none !important; }

             ::-webkit-scrollbar {
                width: 13px;
                height: 3px;
                -webkit-transition: all 300ms;
                transition: all 300ms;
            }

            /* Track */
            ::-webkit-scrollbar-track {
                background-color: #EDF2F4;
            }
            
            /* Handle */
            ::-webkit-scrollbar-thumb {
                border-radius: 25px;
                background: #7c7c7c;
                border: 3px solid #EDF2F4;
                /* border-right: 3px solid #EDF2F4; */
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #01214a; 
            }
        </style>
    </head>
    <body class="font-sans antialiased">
        @include('layouts.sidebar')

        <div class="c-wrapper">
            <header class="c-header c-header-light c-header-fixed">
                @include('layouts.header')
                <div class="c-subheader justify-content-between px-3">
                    @yield('breadcrumb')
                </div>
            </header>
    
            <div class="c-body">
                <main class="c-main">
                    @yield('content')
                </main>
            </div>
    
            @include('layouts.footer')
        </div>
    
        @include('includes.main-js')
        

        @livewireScripts

        @stack('scripts')
    </body>
</html>
