<?php
namespace App\Console;

class Request
{
    /**
     * @param $request
     * @return array
     */
    public function getRequest($request)
    {
        list($action, $params) = explode('=', implode($request, ' '));

        return [$action, $params];
    }
}