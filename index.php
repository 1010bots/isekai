<?php
require_once __DIR__ . '/setup.php';

app()->get('/', function () {
	response()->json([
		'status' => 'OK',
		'serverType' => 'isekai',
		'version' => '1.0.0',
		'minApiVersion' => 1,
		'maxApiVersion' => 1,
	]);
});

foreach (new DirectoryIterator(__DIR__ . '/controllers') as $file) {
	if ($file->isDot()) continue;
	$filename = $file->getFilename();
	if (str_ends_with($filename, '.php') == true) {
		app()->mount(
			'/' . substr($filename, 0, -4),
			function () use ($filename) {
				require __DIR__ . '/controllers/' . $filename;
			}
		);
		app()->logger()->info("Registered controller for /$filename");
	}
}


app()->run();
