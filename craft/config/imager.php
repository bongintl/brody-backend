<?php

$siteUrl = (isset($_SERVER['HTTPS']) ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'];

return [
    'imagerSystemPath' => $_SERVER['DOCUMENT_ROOT'] . '/assets/content/imager',
    'imagerUrl' => $siteUrl . '/assets/content/imager/',
];