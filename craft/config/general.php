<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */
 
$siteUrl = (isset($_SERVER['HTTPS']) ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'];

return [
	
	'*' => [
		
		'siteUrl' => $siteUrl,
		
		'defaultWeekStartDay' => 0,
		
		'enableCsrfProtection' => true,
		
		'omitScriptNameInUrls' => 'auto',
		
		'cpTrigger' => 'admin',
		
		'generateTransformsBeforePageLoad' => true,
		
		'environmentVariables' => [
			
			'basePath' => $_SERVER['DOCUMENT_ROOT'],
			
			'siteUrl' => $siteUrl
			
		],
		
	],
	
	'brody-backend-simonsweeney.c9users.io' => [
		
		// 'devMode' => true
		
	]

];