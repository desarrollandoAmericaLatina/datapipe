<?php

if (!defined('UNDER_INDEX')) {
    header('Location: /');
}

$GLOBALS['DB']['host'] = 'localhost';
$GLOBALS['DB']['port'] = '5432';
$GLOBALS['DB']['username'] = 'postgres';
$GLOBALS['DB']['password'] = 'postgres';
$GLOBALS['DB']['dbname'] = 'datapipe';

?>
