<!-- Account Sidebar-->
<div class="author-card pb-3">
    <div class="author-card-cover"
         style="background-image: url(https://bootdey.com/img/Content/flores-amarillas-wallpaper.jpeg);"></div>
    <div class="author-card-profile">
        <div class="author-card-avatar" onclick="document.getElementById('avatar-input').click();">
            <img src="{{ asset('storage/' . Auth::user()->avatar) }}" alt="{{ Auth::user()->name }}">
        </div>
        <form id="avatar-form" action="{{ route('profile.update-avatar') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <input
                type="file"
                id="avatar-input"
                name="avatar"
                style="display: none;"
                accept="image/*"
                onchange="document.getElementById('avatar-form').submit();" />
        </form>
        <div class="author-card-details">
            <h5 class="author-card-name text-lg">{{ Auth::user()->name }}</h5>
            @if( !empty( session('avatar') ) )
                <span class="text-success">{{ session('avatar') }}</span>
            @endif
            @error('avatar')
            <span class="text-danger">{{ $message }}</span>
            @enderror()
        </div>
    </div>
</div>
<div class="wizard">
    <nav class="list-group list-group-flush">
        <a class="list-group-item @if(Route::currentRouteName() == 'profile') active @endif" href="{{ Route('profile') }}">{{ __('profile.menu-item-settings') }}</a>
        <a class="list-group-item @if(Route::currentRouteName() == 'profile.orders') active @endif" href="{{ Route('profile.orders') }}">{{ __('profile.menu-item-orders') }}</a>
        <a class="list-group-item @if(Route::currentRouteName() == 'profile.wholesaler') active @endif" href="{{ Route('profile.wholesaler') }}">{{ __('profile.menu-item-wholesaler') }}</a>
        <a class="list-group-item" href="{{ Route('logout') }}" >{{ __('profile.menu-item-logout') }}</a>
    </nav>
</div>
