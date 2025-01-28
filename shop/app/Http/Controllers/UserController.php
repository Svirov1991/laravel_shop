<?php

namespace App\Http\Controllers;

use App\Http\Requests\EmailRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegistrationRequest;
use App\Http\Requests\ResetPassRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;

class UserController extends Controller
{
    public function login()
    {
        if (Auth::check()) {
            return redirect(Route('profile'));
        }
        return view('user.login');
    }

    public function attemptToLogin(LoginRequest $request){
        if (Auth::check()) {
            return redirect('profile');
        }

        $validatedData = $request->validated();
        if (Auth::attempt($request->only('email', 'password'), $validatedData['remember'])) {
            return redirect(route('profile'));
        }

        return redirect(route('login'))->withErrors([
            'login' => __('messages.error-login'),
        ]);
    }

    public function register(){
        if ( Auth::check() ) {
            return redirect( Route('profile') );
        }
        return view('user.register');
    }

    public function logout(){
        Auth::logout();
        return redirect( Route('login') );
    }

    public function save(RegistrationRequest $request)
    {
        if (Auth::check()) {
            return redirect(route('profile'));
        }

        $validatedData = $request->validated();
        $credentials   = $validatedData;
        unset($validatedData['recaptcha_token']);
        $credentials['password'] = Hash::make($credentials['password']);
        $credentials['avatar'] = 'users/user.png';
        $user = User::create($credentials);
        if ( $user ) {
            Auth::login($user, true);
            $user->sendEmailVerificationNotification();

            return redirect(route('verification.notice'));
        }

        return redirect(route('register'))->withErrors([
            'formError' => "Error creating user",
        ]);
    }

    public function showLinkRequestForm()
    {
        return view('user.reset-pass-email');
    }

    public function sendResetLinkEmail( EmailRequest $request )
    {

        $status = Password::sendResetLink($request->only('email'));

        return $status === Password::RESET_LINK_SENT
            ? back()->with(['sent' => __('profile.reset-password-sent')])
            : back()->withErrors(['sent-error' => __('messages.something_went_wrong')]);
    }

    public function showResetForm($token)
    {
        return view('user.reset-pass', ['token' => $token]);
    }
    public function reset(ResetPassRequest $request)
    {

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password),
                ])->save();
            }
        );

        return $status === Password::PASSWORD_RESET
            ? redirect()->route('login')->with('status', __('profile.reset-password-success'))
            : back()->withErrors(['reset-error' => __('messages.something_went_wrong')]);
    }


}
