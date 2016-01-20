<?php
namespace App\Console;


class Commander
{

    /**
     * Run command
     *
     * @return string
     * @throws Exception
     */
    public function runCommand($class, $action, $params)
    {
        try {
            if (!$class) {
                throw new Exception("Unknown class");
            }

            if (!$action) {
                throw new Exception("Unknown action");
            }

            if (!method_exists($class, $action)) {
                throw new Exception("Unknown action in class");
            }

            return $class->$action($params);

        } catch (\Exception $e) {
            echo $e->getMessage();
        }
    }



}