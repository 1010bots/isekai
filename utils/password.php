<?php
class PasswordUtils {
  static function scramble(string $input): array {
    $to_database = '';
    $to_file = '';
    $length = strlen($input);
    for ($i = 0; $i < $length; $i++) {
      if ($i % 2 == 0) {
        $to_file .= $input[$i];
      } else {
        $to_database .= $input[$i];
      }
    }
    return [$to_file, $to_database];
  }

  static function unscramble(array $input): string {
    while (count($input) < 2) array_push($input, '');
    $res = '';
    $from_database_length = $input[1];
    $from_file_length = $input[0];
    for ($i = 0; $i < max($from_database_length, $from_file_length); $i++) {
      // File should come first before database
      if ($i < $from_file_length) $res .= $input[0][$i];
      if ($i < $from_database_length) $res .= $input[1][$i];
    }
    return $res;
  }
}
