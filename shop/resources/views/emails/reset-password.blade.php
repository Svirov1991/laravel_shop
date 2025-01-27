<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ __('mails.registration-verify') }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .email-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .email-header {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            padding: 20px;
            font-size: 24px;
        }
        .email-body {
            padding: 20px;
            text-align: center;
        }
        .email-body h1 {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .email-body p {
            font-size: 16px;
            margin-bottom: 30px;
        }
        .email-body a.button {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .email-footer {
            text-align: center;
            font-size: 14px;
            color: #777;
            padding: 20px;
            background-color: #f1f1f1;
        }
        .email-footer a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="email-container">
    <div class="email-header">{{ __('mails.reset-pass') }}</div>
    <div class="email-body">
        <img src="{{ url('storage/' .  setting('site.logo')) }}" style="max-width: 70%" >
        <h1>{{ __('mails.hi') }}!</h1>
        <p>{{ __('mails.reset-pass-message') }}</p>
        <a href="{{ $url }}" class="button" target="_blank">{{ __('mails.reset-pass-button') }}</a>
        <p>{{ __('mails.reset-pass-limit') }}</p>
        <p>{{ __('mails.reset-pass-not-me') }}</p>
        <p>{{ __('mails.reset-pass-error') }} <a href="{{ $url }}" target="_blank">{{ $url }}</a></p>
    </div>
    <div class="email-footer">
        <p><a href="mailto://{{ setting('site.phone') }}">{{ setting('site.mail') }}</a></p>
        <p><a href="tel:{{ setting('site.phone') }}">{{ setting('site.phone') }}</a></p>
        <p><a href="{{ config('app.url') }}">{{ config('app.name') }}</a></p>
    </div>
</div>
</body>
</html>
