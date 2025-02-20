@php $values = $dataTypeContent->{$row->field}; @endphp
@section('head')
    <script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
    <script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script>
    <link rel="stylesheet" href="{{ asset('vendor/laraberg/css/laraberg.css') }}">
    <script src="{{ asset('vendor/laraberg/js/laraberg.js') }}"></script>
    @php
        $blocks = app( \App\Services\BlocksService::class)->getBlocks();
    @endphp

@endsection
<script>
    const gutenberg_blocks = @json($blocks);
</script>
<script src="/assets/admin/js/gutenberg-editor.js"></script>
<div class="custom-field is-field-{{ $row->field }}">
    <textarea id="field_{{ $row->field }}" name="{{ $row->field }}" hidden>{{ $values }}</textarea>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const options = {'height': 'auto'};
            Laraberg.init( 'field_{{ $row->field }}', options );
        })
    </script>
</div>
