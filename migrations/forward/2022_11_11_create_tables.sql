CREATE TABLE `accounts` (
  `id` INT UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `host` VARCHAR(127) NOT NULL,
  `username` VARCHAR(127) NOT NULL,
  `quota_per_hour` INT UNSIGNED NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`)
);

CREATE TABLE `campaigns` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `description` TEXT,
  `timestamp_start` DATETIME,
  `timestamp_end` DATETIME,
  `timestamp_created` DATETIME NOT NULL DEFAULT UTC_TIMESTAMP(),
  `timestamp_updated` DATETIME,
  `extras` JSON,
  PRIMARY KEY (`id`)
);

CREATE TABLE `messages` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT,
  `account_id` INT UNSIGNED,
  `campaign_id` BIGINT UNSIGNED,
  `message_type` VARCHAR(31) NOT NULL DEFAULT 'PLAINTEXT',
  `message` TEXT NOT NULL,
  `status` VARCHAR(31) NOT NULL DEFAULT 'PENDING',
  `timestamp_created` DATETIME NOT NULL DEFAULT UTC_TIMESTAMP(),
  `timestamp_updated` DATETIME,
  `extras` JSON,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`),
  FOREIGN KEY (`campaign_id`) REFERENCES `campaigns`(`id`)
);

CREATE TABLE `secrets` (
  `id` VARCHAR(255) NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  `timestamp_last_verified` DATETIME,
  `timestamp_created` DATETIME NOT NULL DEFAULT UTC_TIMESTAMP(),
  `timestamp_updated` DATETIME,
  PRIMARY KEY (`id`)
);

CREATE TABLE `runs` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT,
  `worker` VARCHAR(255) NOT NULL,
  `status` VARCHAR(31) NOT NULL DEFAULT 'PENDING',
  `timestamp_created` DATETIME NOT NULL DEFAULT UTC_TIMESTAMP(),
  `timestamp_updated` DATETIME,
  `timestamp_finished` DATETIME,
  `log` TEXT,
  `extras` JSON,
  PRIMARY KEY (`id`)
);

CREATE TABLE `run_messages` (
  `run_id` BIGINT UNSIGNED,
  `message_id` BIGINT UNSIGNED,
  `status` VARCHAR(31) NOT NULL DEFAULT 'PENDING',
  `timestamp_created` DATETIME NOT NULL DEFAULT UTC_TIMESTAMP(),
  `timestamp_updated` DATETIME,
  PRIMARY KEY (`run_id`, `message_id`),
  FOREIGN KEY (`run_id`) REFERENCES `runs`(`id`),
  FOREIGN KEY (`message_id`) REFERENCES `messages`(`id`)
);
