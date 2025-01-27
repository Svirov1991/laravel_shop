<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileRequest;
use App\Models\User;
use DefStudio\Telegraph\Keyboard\Button;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    public function index()
    {
        return view('profile.settings');
    }

    public function wholesaler(){
        $user = auth()->user();
        return view('profile.wholesaler', compact('user'));
    }
    public function orders()
    {
        $user = auth()->user();
        return view('profile.orders', compact('user'));
    }

    public function getWholesaler()
    {
        $user            = auth()->user();

        if ($user->wholesaler == 'WHOLESALER') {
            return redirect(Route('profile.wholesaler'))->with(
                'error',
                __('messages.you_already_wholesaler')
            );
        }

        if ($user->wholesaler == 'REQUEST') {
            return redirect(Route('profile.wholesaler'))->with(
                'error',
                __('messages.wholesaler_already_request')
            );
        }

        if (empty($user->phone)) {
            return redirect(Route('profile.wholesaler'))->with(
                'error',
                __('messages.wholesaler_phone_empty')
            );
        }

        $user->wholesaler = 'REQUEST';
        $user->save();

        $telegram_message = "<b>Інформація про покупця</b>\n";
        $telegram_message .= "\xF0\x9F\x91\xA4 ID корістувача: " . $user->id . "\n";
        $telegram_message .= "\xF0\x9F\x93\x9E Телефон: " . str_replace([' ', '(', ')', '-'], '', $user->phone ) . "\n";

        $telegram_message = "\xF0\x9F\x94\xA5 <b>Запит на статус 'Оптовий покупець'</b>\xF0\x9F\x94\xA5 \n\n" . $telegram_message;

        $url = Route('voyager.users.edit', [ $user->id ] );

        $keyboard = [];
        $keyboard[] = Button::make("\xF0\x9F\x94\x97 Змінити")->url($url);
        \App\Telegram\Orders::sendMessageAdmin( $telegram_message, $keyboard );


        return redirect(Route('profile.wholesaler'))->with(
            'message',
            __('messages.wholesaler_request')
        );

    }
    public function updateProfile(ProfileRequest $request)
    {
        $data            = $request->validated();
        $user            = auth()->user();
        $user->name      = $data['name'];
        $user->last_name = $data['last_name'];
        $user->phone     = $data['phone'];

        if ( ! empty($data['password'])) {
            $user->password = bcrypt($data['password']);
        }
        $user->save();

        return redirect()->route('profile')->with(
            'success',
            __('messages.profile_updated')
        );
    }

    public function updateAvatar(Request $request)
    {
        $request->validate([
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ], [
            'avatar.required' => __('messages.validator.avatar_required'),
            'avatar.image' => __('messages.validator.avatar_image'),
            'avatar.mimes' => __('messages.validator.avatar_mimes'),
            'avatar.max' => __('messages.validator.avatar_max'),
        ]);

        $user = auth()->user();

        $path = 'users';

        if ($user->avatar && $user->avatar != 'users/user.png') {
            Storage::disk('public')->delete($user->avatar);
        }

        // Сохранить новый аватар
        $file = $request->file('avatar');
        $filename = uniqid() . '.' . $file->getClientOriginalExtension();
        $filePath = $file->storeAs($path, $filename, 'public');

        $user->avatar = $filePath;
        $user->save();

        return redirect()->route('profile')->with('avatar', __('messages.image_updated'));
    }

    public function verify()
    {
        if (Auth::user()->hasVerifiedEmail()) {
            return redirect(Route('profile'));
        }
        return view('profile.verify-email');
    }

    public function userVerify(EmailVerificationRequest $request)
    {
        $request->fulfill();

        return redirect(Route('profile'));
    }



    public function resend()
    {
        if (Auth::user()->hasVerifiedEmail()) {
            return redirect(Route('profile'));
        }

        Auth::user()->sendEmailVerificationNotification();

        return redirect(Route('verification.notice'))->with(
            'success',
            __('messages.letter_has_been_resent')
        );
    }


}
