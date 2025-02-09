<?php
namespace App\Admin\FormFields;

use TCG\Voyager\FormFields\AbstractHandler;

class GutenbergFieldHandler extends AbstractHandler
{
    protected $codename = 'gutenberg_field';
    public function createContent($row, $dataType, $dataTypeContent, $options)
    {
        return view('voyager::formfields.gutenberg_field', [
            'row'             => $row,
            'options'         => $options,
            'dataType'        => $dataType,
            'dataTypeContent' => $dataTypeContent,
        ]);
    }
}
