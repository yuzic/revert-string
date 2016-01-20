<?php

use App\Helpers\String;

class StringHelperTest extends PHPUnit_Framework_TestCase
{

    /**
     * @dataProvider vowelProvider
     */
    public function testClearVowel($result, $sourse)
    {
        $this->assertEquals($result, String::clearVowel($sourse));
    }

    /**
     * @dataProvider revertStringProvider
     */
    public function testClearVowelAndRevert($result, $sourse)
    {
        $this->assertEquals($result, String::clearVowelAndRevert($sourse));
    }


    /**
     * Provider for clear Vowel
     *
     * @return array
     */
    public function vowelProvider()
    {
        return [
            ['hll', 'hello'],
            ['stbl ld', 'stable load'],
        ];
    }

    /**
     * Provider for clear Vowel
     *
     * @return array
     */
    public function revertStringProvider()
    {
        return [
            ['!dlrw llH', 'Hello world!'],
            ['rvrf php', 'php forever'],
        ];
    }


}
