<?php

app()->get('/scramble', function () {
  $input = request()->get('input');
  if ($input == null || strlen($input) == 0) {
    return response([
      "status" => "KO",
      "error" => "NO_INPUT",
    ])->status(400);
  }
  response([
    "status" => "OK",
    "data" => PasswordUtils::scramble($input),
  ]);
});
