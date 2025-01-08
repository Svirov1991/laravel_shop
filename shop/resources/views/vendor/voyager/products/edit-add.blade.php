@extends('voyager::bread.edit-add')
@section('submit-buttons')
    @include('vendor.voyager.products.partials.attributes')
    @include('admin.meta-fields')
    @parent
@endsection
