<?php

class RequestTest extends PHPUnit_Framework_TestCase
{
    public function testGetRequest()
    {
        $request = [
            'name=Hello',
            'world'
        ];

        list($action, $params) = (new App\Console\Request())->getRequest($request);

        $this->assertEquals('Hello world', $params);
    }
}