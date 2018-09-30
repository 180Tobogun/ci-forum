-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 30 2018 г., 15:53
-- Версия сервера: 5.7.20
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `discuss_forum`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ci_session`
--

CREATE TABLE `ci_session` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `user_agent`, `last_activity`, `data`, `timestamp`) VALUES
('pn6jltfil8vt6g9nggn01m4rm4v66vgi', '127.0.0.1', NULL, 0, '__ci_last_regenerate|i:1538304795;usr_id|s:1:\"4\";usr_email|s:15:\"admin@gmail.com\";logged_in|b:1;', '0000-00-00 00:00:00'),
('b1tfqu27u1pj6j0g3h2ccrb6qkl356s6', '127.0.0.1', NULL, 0, '__ci_last_regenerate|i:1538304795;usr_id|s:1:\"4\";usr_email|s:15:\"admin@gmail.com\";logged_in|b:1;', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `cm_id` int(11) NOT NULL,
  `ds_id` int(11) NOT NULL,
  `cm_body` text NOT NULL,
  `cm_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_id` int(11) NOT NULL,
  `cm_is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`cm_id`, `ds_id`, `cm_body`, `cm_created_at`, `usr_id`, `cm_is_active`) VALUES
(2, 5, 'test answer 333', '2018-09-30 10:50:44', 6, 1),
(3, 5, 'test answer 333', '2018-09-30 10:51:13', 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `discussions`
--

CREATE TABLE `discussions` (
  `ds_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `ds_title` varchar(255) NOT NULL,
  `ds_body` text NOT NULL,
  `ds_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ds_is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discussions`
--

INSERT INTO `discussions` (`ds_id`, `usr_id`, `ds_title`, `ds_body`, `ds_created_at`, `ds_is_active`) VALUES
(4, 4, 'admin', 'admin test', '2018-09-30 10:32:38', 1),
(5, 5, 'test question desc', 'test test test', '2018-09-30 10:49:39', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(25) NOT NULL,
  `usr_hash` varchar(255) NOT NULL,
  `usr_email` varchar(125) NOT NULL,
  `usr_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_is_active` int(1) NOT NULL,
  `usr_level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_hash`, `usr_email`, `usr_created_at`, `usr_is_active`, `usr_level`) VALUES
(1, 'qwerwe', '7fdff6bfe8db9ace8889b0923d009a5db80cf127', 'werwer@gmail.com', '2018-09-23 10:32:09', 1, 1),
(2, 'qwerwe', '75d4cff7058d4b96200391c62f11c1a9bce5ff34', 'dasdasgadg@gmail.com', '2018-09-30 09:16:46', 1, 1),
(3, 'vbnvbn', 'fc6e017d92e34a08130c0de473adc92b538731e8', 'hvbnj@gsdfg.sdfg', '2018-09-30 09:17:00', 1, 1),
(4, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@gmail.com', '2018-09-30 10:32:38', 1, 2),
(5, 'test question 1', 'a8f41c3928d10ab551f24c4e7d67888da77231bd', 'test@gmail.com', '2018-09-30 10:49:39', 1, 1),
(6, 'test ansver 3333', 'c3f99499c6e762d1fcfa4f66d8a69237f82dfe72', 'testansver333@gmail.com', '2018-09-30 10:50:44', 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ci_session`
--
ALTER TABLE `ci_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cm_id`);

--
-- Индексы таблицы `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`ds_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `cm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `discussions`
--
ALTER TABLE `discussions`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
