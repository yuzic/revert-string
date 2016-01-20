<?php
class CommanderTest extends PHPUnit_Framework_TestCase
{
    public function testGetRequest()
    {
        $request = [
            'name=Hello',
            'world!'
        ];

        list($action, $params) = (new App\Console\Request())->getRequest($request);
        $commander =  new \App\Console\Commander();
        $command = $commander->runCommand(new \App\Helpers\String(), 'clearVowelAndRevert', $params);

        $this->assertEquals('!dlrw llH', $command);
    }
}