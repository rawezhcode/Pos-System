<?php
namespace App\Traits;

trait notyf
{
    public function notyfS(string $string)
    {
        notyf()->dismissible(true)->position('x','center')->addSuccess($string);
    }

    public function notyfE(string $string)
    {
        notyf()->dismissible(true)->position('x','center')->addError($string);
    }

    public function notyfW(string $string)
    {
        notyf()->dismissible(true)->position('x','center')->addWarning($string);
    }

    public function notyfI(string $string)
    {
        notyf()->dismissible(true)->position('x','center')->addInfo($string);
    }
}