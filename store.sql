-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Мар 31 2025 г., 16:20
-- Версия сервера: 8.0.35
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `answer` tinyint NOT NULL,
  `question_id` int UNSIGNED NOT NULL,
  `questionnaire_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_id`, `name`, `code`, `description`, `image`, `created_at`, `updated_at`, `name_en`, `description_en`) VALUES
(1, 1, 'Керамбит', 'karambit', 'Ножь Керамбит', 'categories/NKBYbpUNpSIoECdIiBT64Wc3dMZFRL2zVzNgfI7T.png', '2025-03-30 14:29:58', '2025-03-30 14:29:58', 'Karambit', 'Knife Karambit'),
(2, 2, 'Нож-бабочка', 'butterfly', 'Нож Нож-бабочка', 'categories/gzmxKY0hWncQWULMJOqLLYyDNbkWcvbMb92hUnbs.webp', '2025-03-30 14:31:22', '2025-03-30 14:31:22', 'Butterfly knife', 'Knife Butterfly knife');

-- --------------------------------------------------------

--
-- Структура таблицы `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `type` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `currency_id` int UNSIGNED DEFAULT NULL,
  `only_once` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `expired_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `symbol`, `is_main`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'KZT', '₸', 1, 1, '2025-03-30 19:15:22', '2025-03-30 19:15:22');

-- --------------------------------------------------------

--
-- Структура таблицы `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_12_18_095032_create_products_table', 1),
(4, '2021_12_18_100512_create_categories_table', 1),
(5, '2021_12_19_202906_add_category_id_to_products_table', 1),
(6, '2021_12_24_203321_create_orders_table', 1),
(7, '2021_12_26_085113_create_order_product_table', 1),
(8, '2021_12_26_144253_update_order_product_table', 1),
(9, '2021_12_30_221253_alter_table_users', 1),
(10, '2021_12_31_174223_alter_table_orders', 1),
(11, '2022_01_03_124849_alter_table_products', 1),
(12, '2022_01_07_181402_alter_table_products_count', 1),
(13, '2022_01_10_170410_create_subscriptions_table', 1),
(14, '2022_01_15_101710_localization_products', 1),
(15, '2022_01_15_101824_localization_categories', 1),
(16, '2022_01_16_181709_create_models_currencies_table', 1),
(17, '2022_01_21_173128_alter_table_orders_add_currency_id_and_sum', 1),
(18, '2022_01_21_173322_alter_order_product_add_price', 1),
(19, '2022_01_31_184104_create_skus_table', 1),
(20, '2022_01_31_184117_create_properties_table', 1),
(21, '2022_01_31_184707_create_property_options_table', 1),
(22, '2022_01_31_185221_create_sku_property_option_table', 1),
(23, '2022_01_31_200230_create_property_product', 1),
(24, '2022_02_05_064242_alter_table_products_drop_columns_count_and_price', 1),
(25, '2022_02_05_183711_alter_subscription_table', 1),
(26, '2022_02_06_093904_order_sku', 1),
(27, '2022_02_07_094647_alter_orders_table', 1),
(28, '2022_02_07_094955_create_coupons_table', 1),
(29, '2022_02_08_143531_create_merchants_table', 1),
(30, '2022_02_13_125814_create_questions_table', 1),
(31, '2022_02_13_125904_create_questionnaires_table', 1),
(32, '2022_02_13_125930_create_question_options_table', 1),
(33, '2022_02_13_131013_create_answers_table', 1),
(34, '2022_02_13_140503_alter_table_question_options_add_value', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `currency_id` int NOT NULL,
  `sum` double NOT NULL,
  `coupon_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_sku`
--

CREATE TABLE `order_sku` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `sku_id` int NOT NULL,
  `price` double NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  `new` tinyint NOT NULL DEFAULT '0',
  `hit` tinyint NOT NULL DEFAULT '0',
  `recommended` tinyint NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `description`, `image`, `created_at`, `updated_at`, `category_id`, `new`, `hit`, `recommended`, `deleted_at`, `name_en`, `description_en`) VALUES
(2, 'Керамбит | Кровавая паутина', 'bloody-web', 'Керамбит — это нож с изогнутым лезвием, имитирующим клык тигра, специально разработанный для юго-восточного азиатского боевого искусства силат. Нож обычно держат обратной хваткой, вдевая указательный палец в кольцо на рукоятке. На отдельные части оружия нанесли водостойкую краску красного цвета, черные узоры паутины и слой полуглянца. Внимательно смотри, куда идешь, ведь никогда не знаешь, где можно угодить в паутину', 'products/kC6sflzDMltSK1aelBDYzpts211ZSaylww6nbxc3.png', '2025-03-30 14:43:39', '2025-03-30 15:37:29', 1, 0, 1, 0, NULL, 'Kerambit | Bloody Web', 'The kerambit is a knife with a curved blade imitating a tiger\'s fang, specially designed for the Southeast Asian martial art of silat. The knife is usually held with a reverse grip by inserting the index finger into a ring on the handle. Water-resistant red paint, black spider web patterns and a coat of semi-gloss have been applied to parts of the weapon. Look carefully where you\'re going, because you never know where you might get caught in a spider web');

-- --------------------------------------------------------

--
-- Структура таблицы `properties`
--

CREATE TABLE `properties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `properties`
--

INSERT INTO `properties` (`id`, `name`, `name_en`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Поношенное', 'Worn', '2025-03-30 14:41:47', '2025-03-30 14:41:47', NULL),
(2, 'Немного поношенное', 'A little worn', '2025-03-30 14:42:05', '2025-03-30 14:42:05', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `property_options`
--

CREATE TABLE `property_options` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `property_product`
--

CREATE TABLE `property_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `property_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `questionnaires`
--

CREATE TABLE `questionnaires` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionnaire_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `question_options`
--

CREATE TABLE `question_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` int UNSIGNED NOT NULL,
  `option_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `skus`
--

CREATE TABLE `skus` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `skus`
--

INSERT INTO `skus` (`id`, `product_id`, `count`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 2, 123, 123123, '2025-03-30 14:45:59', '2025-03-30 14:45:59', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sku_property_option`
--

CREATE TABLE `sku_property_option` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `property_option_id` int UNSIGNED NOT NULL,
  `sku_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sku_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'user', 'admin@admin.kz', NULL, '$2y$10$QZxTEzaVM0mGsCsNsu2m3OmxXUj5whwvSlo2DPSF61848CixTIkPG', NULL, '2025-03-30 14:15:48', '2025-03-30 14:15:48', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_sku`
--
ALTER TABLE `order_sku`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `property_options`
--
ALTER TABLE `property_options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `property_product`
--
ALTER TABLE `property_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `skus`
--
ALTER TABLE `skus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sku_property_option`
--
ALTER TABLE `sku_property_option`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_sku`
--
ALTER TABLE `order_sku`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `property_options`
--
ALTER TABLE `property_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `property_product`
--
ALTER TABLE `property_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `questionnaires`
--
ALTER TABLE `questionnaires`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `skus`
--
ALTER TABLE `skus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sku_property_option`
--
ALTER TABLE `sku_property_option`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
