-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 21 2023 г., 15:16
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
(12, 'Сообщение 4', '2023-03-21 14:47:06', 3, ''),
(13, 'Сообщение 5', '2023-03-21 14:47:11', 3, ''),
(14, 'Сообщение 6', '2023-03-21 14:47:15', 3, ''),
(15, 'Сообщение 7', '2023-03-21 14:47:21', 3, ''),
(16, 'Сообщение 7', '2023-03-21 14:47:28', 3, ''),
(17, 'Сообщение 7', '2023-03-21 14:56:37', 3, ''),
(18, 'Сообщение 8', '2023-03-21 14:56:41', 3, ''),
(19, 'Сообщение 9', '2023-03-21 14:56:47', 3, ''),
(20, 'Сообщение 10', '2023-03-21 14:57:16', 5, ''),
(21, 'Сообщение 11', '2023-03-21 14:57:23', 5, ''),
(22, 'Сообщение 12', '2023-03-21 14:57:35', 5, ''),
(23, 'Сообщение 13', '2023-03-21 14:57:42', 5, ''),
(26, 'Выведено 20-е сообщение, как по заданию)', '2023-03-21 14:59:12', 3, ''),
(27, '', '2023-03-21 15:02:28', 3, '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(191) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `created_at`, `email`) VALUES
(3, 'Nick', '2e80bbe0ed47ba7a9f9186f7072224e94505d337', '2023-03-20 18:06:00', 'nick@gmail.com'),
(4, 'test', 'b60ab8a27648700381578c0576519ab12a52295a', '2023-03-21 14:36:21', 'test@test.com'),
(5, 'admin', 'b60ab8a27648700381578c0576519ab12a52295a', '2023-03-21 14:38:25', 'admin@admin.ru');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
