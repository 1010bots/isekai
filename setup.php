<?php
require_once __DIR__ . '/vendor/autoload.php';

use Dotenv\Dotenv;
use Leaf\Config;
use Leaf\Db;

// Setup .env
$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

// // Setup database connection
// $db = new Db($_ENV['DB_HOST'], $_ENV['DB_DATABASE'], $_ENV['DB_USERNAME'], $_ENV['DB_PASSWORD']);

// // Get sharded keys
// $key_from_db_query = $db->select('secrets', 'value')->where('id', 'APP_KEY')->first();

// Setup config
Config::set('log.enabled', true);
Config::set('log.dir', __DIR__ . '/logs/');