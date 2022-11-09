<?php

require __DIR__ . '/vendor/autoload.php';

app()->get('/', function () {
	global $START_TIME;
	response()->json([
		"status" => "OK",
		"serverType" => "isekai",
		"version" => "1.0.0",
		"minApiVersion" => 1,
		"maxApiVersion" => 1,
	]);
});

app()->run();
