<div class="col-sm-4 col-lg-7 d-none d-lg-block">
    <div class="header-navigation-area">
        <ul class="main-menu nav position-relative">
            @foreach($items as $menu_item)
                <li @if( !empty(count($menu_item->children))) class="has-submenu" @endif >
                    <a href="{{ $menu_item->link() }}">{{ $menu_item->title }}</a>
                    @if( !empty(count($menu_item->children)))
                        <ul class="submenu-nav">
                            @foreach($menu_item->children as $children_menu_item)
                                <li><a href="{{ $children_menu_item->link() }}">{{ $children_menu_item->title }}</a></li>
                            @endforeach
                        </ul>
                    @endif
                </li>
            @endforeach
        </ul>
    </div>
</div>
