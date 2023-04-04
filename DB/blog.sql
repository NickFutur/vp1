-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 04 2023 г., 13:06
-- Версия сервера: 5.6.51
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL,
  `author_id` int(11) UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `text`, `created_at`, `author_id`, `image`) VALUES
(4, 'Привет!', '2023-03-21 12:56:33', 3, ''),
(6, 'Тигр ', '2023-03-21 13:17:25', 3, '02cdd79fc2b99ac58c8cfd2e1ff38e811f2d9e30.jpg'),
(7, 'Моё первое сообщение', '2023-03-21 14:36:43', 4, ''),
(8, 'Admin здесь', '2023-03-21 14:38:43', 5, ''),
(9, 'Сообщение 1', '2023-03-21 14:46:51', 3, ''),
(10, 'Сообщение 2', '2023-03-21 14:46:55', 3, ''),
(11, 'Сообщение 3', '2023-03-21 14:47:01', 3, ''),
(26, 'Выведено 20-е сообщение, как по заданию)', '2023-03-21 14:59:12', 3, ''),
(30, 'Всем привет!', '2023-03-31 14:31:32', 3, ''),
(32, 'Ещё раз привет!', '2023-03-31 17:05:42', 3, ''),
(33, 'Hi!', '2023-03-31 17:07:40', 6, ''),
(34, 'It\'s me', '2023-04-04 11:27:29', 3, ''),
(35, 'Палец в верх', '2023-04-04 11:28:31', 3, '5efcabd6ebb0190ba4b73b921a61f29dd0f06aea.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(191) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `created_at`, `email`, `image`) VALUES
(3, 'Nick', '2e80bbe0ed47ba7a9f9186f7072224e94505d337', '2023-03-20 18:06:00', 'nick@gmail.com', NULL),
(4, 'test', 'b60ab8a27648700381578c0576519ab12a52295a', '2023-03-21 14:36:21', 'test@test.com', NULL),
(5, 'admin', 'b60ab8a27648700381578c0576519ab12a52295a', '2023-03-21 14:38:25', 'admin@admin.ru', NULL),
(6, 'testy', '12345', '2023-03-31 17:07:24', 'testy@gmail.com', NULL),
(9, 'test1', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2023-04-03 16:19:05', 'test1@gmail.com', NULL),
(28, 'test1', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2023-04-04 11:13:33', 'test11@gmail.col', NULL),
(29, 'img1', '2ecdb2d9fd189e153b6b5129559226e50384e190', '2023-04-04 12:23:27', 'img@gmail.com', 'cber.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
