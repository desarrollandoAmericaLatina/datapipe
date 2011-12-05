<?php

if (!defined('UNDER_INDEX')) {
    header('Location: /');
}

$GLOBALS['DB']['host'] = 'localhost';
$GLOBALS['DB']['port'] = '5432';
$GLOBALS['DB']['username'] = 'postgres';
$GLOBALS['DB']['password'] = 'postgrespass123';
$GLOBALS['DB']['dbname'] = 'datapipe';

?>
