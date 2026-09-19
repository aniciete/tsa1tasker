DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `username`, `full_name`, `email`, `created_at`) VALUES
(1, 'charles', 'Charles Lawrence Aniciete', 'charles@example.com', NOW());

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(150) NOT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'pending',
  `task_date` DATE NOT NULL,
  `created_at` DATETIME NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tasks` (`title`, `status`, `task_date`, `created_at`) VALUES

('Buy groceries (milk, eggs, and bread)', 'pending', CURDATE(), NOW()),
('Morning 30-minute jog in the park', 'completed', CURDATE(), NOW()),
('Water the indoor plants', 'completed', CURDATE(), NOW()),
('Prepare dinner and wash the dishes', 'pending', CURDATE(), NOW()),

('Do laundry and fold clothes', 'completed', DATE_SUB(CURDATE(), INTERVAL 1 DAY), NOW()),
('Take out the trash and recycling bins', 'completed', DATE_SUB(CURDATE(), INTERVAL 1 DAY), NOW()),
('Clean the kitchen counters and vacuum living room', 'completed', DATE_SUB(CURDATE(), INTERVAL 1 DAY), NOW()),

('Pay monthly electric and water bills', 'pending', DATE_ADD(CURDATE(), INTERVAL 1 DAY), NOW()),
('Schedule dentist checkup appointment', 'pending', DATE_ADD(CURDATE(), INTERVAL 1 DAY), NOW()),
('Wash the car and check tire pressure', 'pending', DATE_ADD(CURDATE(), INTERVAL 2 DAY), NOW());
