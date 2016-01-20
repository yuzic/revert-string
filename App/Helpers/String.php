<?php
namespace App\Helpers;

class String
{

    /**
     * Claens the string from vowel
     *
     * @param $string
     * @return string
     */
    public static function clearVowel($string)
    {
        return preg_replace('#[aeiou]+#i', '', $string);;
    }

    /**
     * Claens and revert string from vowel
     *
     * @param $string
     * @return string
     */
    public static function clearVowelAndRevert($string)
    {
        return strrev(self::clearVowel($string));
    }
}