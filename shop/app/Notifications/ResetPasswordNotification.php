<?php

namespace App\Notifications;

use Illuminate\Auth\Notifications\ResetPassword as BaseResetPassword;
use Illuminate\Notifications\Messages\MailMessage;

class ResetPasswordNotification extends BaseResetPassword
{
    public function toMail($notifiable)
    {
        $url = url(route('password.reset', [
            'token' => $this->token,
            'email' => $notifiable->getEmailForPasswordReset(),
        ], false));



        return (new MailMessage)
            ->subject( __('mails.reset-pass') . ' ( ' . request()->getHost() . ' )' )
            ->view('emails.reset-password', ['url' => $url]);
    }
}
