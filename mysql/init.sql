-- Prod
CREATE DATABASE IF NOT EXISTS `mkepl_task-management`;

-- Devel
CREATE DATABASE IF NOT EXISTS `mkepl_task-management_devel`;

USE `mkepl_task-management_devel`;

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `deadline` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
);

INSERT INTO `tasks` (`name`, `status`, `deadline`) VALUES
('KPL', 0, '2023-12-31 23:59:59'),
('MKEPL', 1, '2023-11-30 23:59:59');