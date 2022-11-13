<?php

app()->get('/', function () {
  response()->json([
    "status" => "OK"
  ]);
});