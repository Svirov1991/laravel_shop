@if( !empty($currencies['all']) && count($currencies['all']) > 1)
    <a class="action-item" href="javascript:void(0);"><i class="zmdi zmdi-money-box icon"></i></a>
    <ul class="currency-dropdown">
        <li class="currency">
            <a href="javascript:void(0);"><span class="current-currency">{{ $currencies['userCurrency']->code }}</span></a>
            <ul>
                @foreach($currencies['all'] as $curency)
                    <li @if( $curency->code == $currencies['userCurrency']->code ) class="active" @endif ><a href="javascript:void(0);" class="change-currency" data-currency="{{ $curency->code }}">{{ $curency->code }} - {{ $curency->symbol }}</a></li>
                @endforeach
            </ul>
        </li>
    </ul>
@endif
