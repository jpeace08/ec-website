-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 31, 2020 lúc 01:45 PM
-- Phiên bản máy phục vụ: 8.0.18
-- Phiên bản PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `e-website`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `icon`, `deleted_at`, `created_at`, `updated_at`, `active`) VALUES
(2, 'Laptop', 0, 'laptop', 'fa-laptop-alt', NULL, '2020-12-24 08:54:14', '2020-12-29 05:38:10', 1),
(3, 'Tablet', 0, 'tablet', 'fa-tablet', NULL, '2020-12-24 08:56:50', '2020-12-29 02:29:30', 1),
(4, 'Điện thoại', 4, 'dien-thoai', 'fa-mobile-aly', NULL, '2020-12-26 01:03:09', '2020-12-29 05:38:12', 1),
(14, 'Hàng tiêu dùng', 0, 'hang-tieu-dung', 'fa-mobile-aly', NULL, '2020-12-29 02:33:24', '2020-12-30 08:26:37', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_12_24_013224_create_table_trademarks', 1),
(3, '2020_12_24_013239_create_table_categories', 1),
(9, '2020_12_24_020558_add_column_active_to_table_categories', 2),
(10, '2020_12_24_020648_add_column_active_to_table_trademarks', 2),
(12, '2020_12_27_141509_create_table_product_image', 3),
(13, '2014_10_12_000000_create_users_table', 4),
(14, '2014_10_12_100000_create_password_resets_table', 4),
(15, '2019_08_19_000000_create_failed_jobs_table', 4),
(19, '2020_12_24_013231_create_table_products', 5),
(20, '2020_12_24_020502_add_column_active_to_table_products', 5),
(21, '2020_12_30_181746_create_table_orders', 5),
(22, '2020_12_30_181850_create_table_order_detail', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_money` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_address`, `customer_phone`, `quantity`, `total_money`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Phạm Thế Giầu', 'Hải Phòng', '0962130377', 1, '26990000', NULL, '2020-12-31 06:23:13', '2020-12-31 06:23:13'),
(2, 'Vũ Thanh Lâm', 'Hải Phòng', '0962130344', 1, '26990000', NULL, '2020-12-31 06:23:57', '2020-12-31 06:23:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `orders_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `trademark_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `price`, `slug`, `thumb`, `content`, `category_id`, `trademark_id`, `deleted_at`, `created_at`, `updated_at`, `active`) VALUES
(2, 'Samsung Galaxy M51', 'Samsung lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ Galaxy M với tên gọi là Samsung Galaxy M51. Thiết kế mới này tuy nằm trong phân khúc tầm trung nhưng được Samsung nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', '9490000', 'dien-thoai-samsung-galaxy-m51', '1609389484-1609348117-samsung-galaxy-m51-trang-new-600x600-600x600.jpg', '<h3 style=\"margin-left:0px;\">Thiết kế hiện đại và đẳng cấp.</h3><p style=\"margin-left:0px;\">Ấn tượng ban đầu với <a href=\"https://www.thegioididong.com/dtdd-tu-6-inch\">màn hình</a> của Galaxy M51 là kiểu màn hình Infinity-O rộng 6.7 inch. Kiểu thiết kế này đưa camera selfie thu gọn hơn chỉ bằng một hình tròn nhỏ cùng thiết kế <a href=\"https://www.thegioididong.com/dtdd-man-hinh-tran-vien\">màn hình tràn viền</a> làm tăng khả năng hiển thị hình ảnh hơn.</p><p style=\"margin-left:0px;\">Ngoài ra, máy còn sở hữu công nghệ màn hình Super AMOLED Plus&nbsp;mang đến chất lượng hiển thị sắc nét, hình ảnh tươi tắn cho bạn tận hưởng các chương trình giải trí hấp dẫn, thưởng thức các bộ phim bom tấn, chơi những tựa game yêu thích vô cùng bắt mắt.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-274020-094023.jpg\" alt=\"Sở hữu màn hình tràn viền với độ phân giải cao | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Mặt lưng của máy được thiết kế màu gradient, chất liệu vỏ làm bằng nhựa nên máy rất nhẹ chỉ có trọng lượng 213 g và với độ mỏng 9.5 mm. Bên cạnh đó, các cạnh của máy bo cong ôm sát phần khung viền mang lại cảm giác vừa chắc chắn mà rất nhẹ nhàng khi cầm nắm trên tay.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-274020-094029.jpg\" alt=\"Thiết kê mặt lưng bóng bẩy, sang trọng | Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Camera đột phá thách thức mọi góc độ</h3><p style=\"margin-left:0px;\">Tuy là chiếc điện thoại nằm trong phân khúc tầm trung nhưng lại sở hữu tới 4 camera sau với độ phân giải cực kì ấn tượng. Camera cảm biến chính với độ phân giải lên đến 64 MP mang đến những bức ảnh cực kỳ rõ nét ngay cả trong điều kiện thiếu sáng.&nbsp;</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-274020-094041.jpg\" alt=\"Sở hữu 4 camera sau với độ phân giải cực kì ấn tượng | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Kế đến là <a href=\"https://www.thegioididong.com/dtdd-camera-goc-rong\">camera góc siêu rộng</a> (Ultra wide) với độ phân giải 12 MP kết hợp cùng camera chính 64 MP cho khả năng chụp bao quát lên tới 123 độ, hình ảnh sắc nét. Những khung cảnh núi rừng hùng vĩ giờ đây có thể gói gọn trong chiếc camera của Samsung Galaxy M51.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-272420-102407.jpg\" alt=\"Ảnh chụp góc siêu rộng từ camera | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Bên cạnh những bức ảnh góc rộng, máy còn có khả năng chụp cận cảnh với những chi tiết nhỏ và hỗ trợ <a href=\"https://www.thegioididong.com/dtdd-camera-xoa-phong\">xoá phông</a> lấy độ sâu trường ảnh với hai camera bao gồm <a href=\"https://www.thegioididong.com/dtdd-camera-macro\">camera macro</a> chụp cận cảnh với độ phân giải là 5 MP và&nbsp;camera đo chiều sâu có độ phân giải 5 MP.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-272420-102412.jpg\" alt=\"Ảnh chụp cận cảnh macro từ camera | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Ngoài việc mang đến những bức ảnh đầy ấn tượng, bộ tứ camera của Galaxy M51 cũng mang đến chất lượng quay video 4K cực kì sắc nét, màu sắc sống động sẽ lưu giữ được những khoảnh khắc kỉ niệm đáng nhớ.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-800-533-7.jpg\" alt=\"Chất lượng quay video 4K cực kì sắc nét từ camera | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Camera selfie của Galaxy M51 cũng không kém phần chất lượng khi sở hữu độ phân giải tới 32 MP, với tính năng chụp ảnh HDR, tự làm đẹp khuôn mặt giúp những bức ảnh chân dung hoặc những tấm ảnh chụp ngoài trời cho chất lượng tốt hơn, rõ nét hơn giúp bạn tự tin toả sáng trong mọi khung hình.</p><p style=\"margin-left:0px;\">Ngoài ra tính năng lựa chọn góc selfie thông minh, máy sẽ tự động chuyển sang chế độ chụp góc rộng khi selfie với nhóm bạn mang mọi người gắn kết với nhau hơn qua từng khoảnh khắc selfie.&nbsp;Về khả năng quay video, camera selfie còn có khả năng quay video cho chất lượng hình ảnh Full HD.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-800-533-8.jpg\" alt=\"Camera selfie với độ phân giải lên đến 32 MP | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Pin siêu khủng, sử dụng thoải mái cả ngày lẫn đêm</h3><p style=\"margin-left:0px;\">Được nâng cấp viên pin khủng lên đến 7000 mAh xứng đáng là chiếc <a href=\"https://www.thegioididong.com/dtdd-pin-khung\">điện thoại pin trâu</a> nhất trong phân khúc <a href=\"https://www.thegioididong.com/dtdd?p=tu-4-7-trieu\">điện thoại tầm trung</a> mang đến cho bạn cả ngày dài sử dụng kết hợp công nghệ <a href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\">sạc pin nhanh</a> 25 W giúp bạn nạp lại pin cho máy rất nhanh và hiệu quả.</p><p style=\"margin-left:0px;\">Với lượng pin được sạc đầy 100% bạn sẽ có thể đàm thoại liên tục 64 giờ, sử dụng internet, xem video lên đến 24 giờ hoặc nghe nhạc liên tục trong khoảng 182 giờ. Giờ đây, bạn sẽ không phải lo lắng về việc sạc pin trước hay mang theo cục sạc dự phòng khi rời khỏi nhà.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-800-533-9.jpg\" alt=\"Dung lượng pin khủng cùng công nghệ sạc nhanh | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Tuyệt vời hơn, Galaxy M51 còn có tính năng reverse charging, nghĩa là Galaxy M51 cũng có thể biến thành một cục sạc dự phòng đa năng nếu như một chiếc điện thoại khác của bạn cần được sạc pin.&nbsp;</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-800-533-10.jpg\" alt=\"Tính năng reverse charging mới | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Hiệu năng mạnh mẽ vượt trội</h3><p style=\"margin-left:0px;\">Galaxy M51 sở hữu con chip <a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-qualcomm-snapdragon-730-1174819\">Snapdragon 730 8 nhân của Qualcomm</a> với <a href=\"https://www.thegioididong.com/dtdd-ram-8gb-tro-len\">RAM&nbsp;8 GB</a>, tốc độ xử lý lên tới 2.2 GHz giúp bạn tiết kiệm điện năng cho máy đồng thời tăng tốc độ phản hồi cho bạn trải nghiệm mượt mà hơn khi dùng nhiều tác vụ cùng lúc.</p><p style=\"margin-left:0px;\">Samsung Galaxy M51&nbsp;còn sở hữu bộ nhớ trong với&nbsp;<a href=\"https://www.thegioididong.com/dtdd-rom-128-den-256gb\">dung lượng 128 GB</a>,&nbsp;cho không gian lưu trữ rộng lớn hơn, thoải mái hơn khi lưu phim ảnh, video, game...</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-271120-101154.jpg\" alt=\"Sở hữu con chip Snapdragon 730 8 nhân | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Chip đồ hoạ Adreno 618 giúp <a href=\"https://www.thegioididong.com/dtdd-choi-game\">điện thoại chơi game</a> thêm tính chân thực với đồ họa phong phú hơn, xử lý chất lượng hình ảnh và chơi trò chơi HDR với nhiều sắc thái màu.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-274020-094053.jpg\" alt=\"Hỗ trợ thẻ nhớ ngoài | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Linh hoạt hơn với hai hệ thống bảo mật</h3><p style=\"margin-left:0px;\">Bạn có thể hoàn toàn an tâm khi sử dụng Samsung Galaxy M51 bởi chiếc điện thoại này được trang bị đến 2 hệ thống bảo mật bao gồm <a href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\">bảo mật vân tay</a>&nbsp;được đặt bên khung viền của máy và tính năng&nbsp;<a href=\"https://www.thegioididong.com/dtdd-bao-mat-khuon-mat\">bảo mật khuôn mặt</a>. Với 2 hệ thống bảo mật được tích hợp trong cùng một chiếc điện thoại, bạn sẽ linh động được cách mở khoá hơn.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-274120-094105.jpg\" alt=\"Tích hợp bảo mật vân tay cạnh viền | Samsung Galaxy M51\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Nhìn tổng thể, Samsung Galaxy M51 có mức giá hợp lý còn được sở hữu những tính năng hiện đại về thiết kế đồng thời nổi bật về chất lượng chắc chắn sẽ không làm thất vọng người dùng yêu công nghệ khi lựa chọn Galaxy M51.</p>', 4, 4, NULL, '2020-12-30 21:38:04', '2020-12-30 21:38:04', 1),
(3, 'Vsmart Live 4 6GB', 'Vsmart Live 4 6GB là mẫu smartphone tầm trung gây ấn tượng với cụm 4 camera sau đa chức năng, dung lượng pin khủng và hiệu năng mạnh mẽ cùng nhiều tính năng hấp dẫn khác sẽ mang đến trải nghiệm tốt nhất đến người dùng.', '4490000', 'dien-thoai-vsmart-live-4-6gb', '1609389589-1609341259-vsmart-live-4-den-600x600.jpg', '<h3 style=\"margin-left:0px;\">Ngoại hình sang trọng tinh tế</h3><p style=\"margin-left:0px;\"><a href=\"https://www.thegioididong.com/dtdd-vsmart\">Vsmart</a>&nbsp;vẫn giữ lại kiểu dáng như các sản phẩm trước, mặt lưng của máy được hoàn thiện bằng chất liệu nhựa nhám mờ, ở giữa nổi bật là logo màu xám trắng dễ dàng nhận biết, thiết kế này thì phù hợp với mọi lứa tuổi.</p><p style=\"margin-left:0px;\">Mặt trước của máy được bảo vệ lớp kính cường lực Corning Gorilla Glass 3 có độ bền nhất định, ít trầy xước và chịu được lực ấn mạnh tay hay va chạm nhẹ. Smartphone này còn được trang bị&nbsp;<a href=\"https://www.thegioididong.com/dtdd-bao-mat-van-tay\">cảm biến vân tay</a>&nbsp;ở mặt lưng giúp bạn mở khóa một cách nhanh chóng chỉ với một chạm duy nhất.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-060920-030942.jpg\" alt=\"Vsmart Live 4 6GB | Thiết kế hiện đại, tinh tế\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Vsmart Live 4 trang bị&nbsp;<a href=\"https://www.thegioididong.com/dtdd-man-hinh-tran-vien\">màn hình tràn viền</a>&nbsp;LTPS IPS LCD với độ phân giải Full HD+ cho hình ảnh hiển thị mượt mà, màu sắc tươi tắn nịnh mắt. Máy có kích thước 6.5 inch giúp bạn đọc báo hay xem phim, chơi game với khung hình to thoải mái.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-170320-030357.jpg\" alt=\"Vsmart Live 4 6GB | Trải nghiệm tuyệt vời với màn hình tràn viền 6.5 inch Full HD+\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Hệ thống 4 camera đẳng cấp, chụp ảnh chuyên nghiệp</h3><p style=\"margin-left:0px;\">Cụm 4 camera sau nằm dọc trong khung hình chữ nhật nổi bật bao gồm camera chính 48 MP, camera góc siêu rộng 8 MP,&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-xoa-phong\">camera xóa phông</a>&nbsp;5 MP và cuối cùng là&nbsp;<a href=\"https://www.thegioididong.com/dtdd-camera-macro\">camera macro</a>&nbsp;2 MP, có thể thấy chiếc Vsmart này tuy có giá không cao nhưng vẫn được tích hợp các tính năng chụp ảnh hiện đại theo xu thế như cảm biến AI, chụp góc rộng, xóa phông, chụp đêm,...&nbsp;</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-060920-030936.jpg\" alt=\"Vsmart Live 4 6GB | Cụm 4 camera chất lượng, chụp ảnh chuyên nghiệp\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Vsmart Live 4 còn tích hợp khả năng quay phim chất lượng cao đến 4K, Full HD cho chất lượng video đạt chuẩn cao để khi phát lên TV cỡ lớn hay máy trình chiếu thì cũng không bị bể nét hay bị mờ.&nbsp;</p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-104120-014120.jpg\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;text-align:center;\">Camera góc thường trên Vsmart Live 4</p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-102920-122944.jpg\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;text-align:center;\">Camera góc rộng trên Vsmart Live 4</p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-102920-122955.jpg\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;text-align:center;\">Camera macro trên Vsmart Live 4</p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-103520-013542.jpg\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;text-align:center;\">Camera macro trên Vsmart Live 4</p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;text-align:center;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;text-align:center;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;text-align:center;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;text-align:center;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;\"><br data-cke-filler=\"true\"></p><p style=\"margin-left:0px;\">Mặt trước là camera selfie có độ phân giải 13 MP cũng được trang bị các tính năng chủ yếu như làm đẹp, xóa phông, tự lấy nét,... giúp bạn dễ dàng có được bức ảnh selfie ưng ý nhất.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-170720-030701.jpg\" alt=\"Vsmart Live 4 6GB | Camera selfie 13 MP đầy đủ tính năng chụp AI làm đẹp\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Đa nhiệm và chơi game ổn định</h3><p style=\"margin-left:0px;\">Máy sở hữu&nbsp;<a href=\"https://www.thegioididong.com/dtdd-ram-4-den-6gb\">RAM 6 GB</a>&nbsp;và&nbsp;<a href=\"https://www.thegioididong.com/dtdd-rom-32-den-64gb\">ROM 64 GB</a>&nbsp;kết hợp&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-qualcomm-snapdragon-675-1171997\">chip Snapdragon 675</a>&nbsp;8 nhân đủ mạnh để đảm bảo rằng bạn mở cả 10 tab ứng dụng hay chơi vài tựa game setting trung bình như Liên Quân Mobile hay PUBG mà nó vẫn chạy mượt trong vài giờ tuy nhiên khi chơi game thời gian dài thì máy sẽ bị nóng lên.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-170820-030853.jpg\" alt=\"Vsmart Live 4 6GB | Chip Snapdragon 675 8 nhân chiến mọi tựa game\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Khi đo với Antutu Vsmart Live 4 cho ra con số khá ấn tượng khoảng 223.000 điểm, với điểm số này giúp <a href=\"https://www.thegioididong.com/dtdd-choi-game\">điện thoại chơi game</a> tốt các tựa game hot hiện nay như Liên Quân, PUBG, Asphalt 9,... một cách mượt mà, ít gặp tình trạng đứng hoặc lag khi chơi.&nbsp;</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-100120-010156.jpg\" alt=\"Antu được 223270 điểm | Vsmart Live 4\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Sản phẩm chạy trên nền Android 10, giao diện thân thiện với người dùng và có nhiều tùy biến thông minh.</p><h3 style=\"margin-left:0px;\">Dung lượng pin khủng 5000 mAh</h3><p style=\"margin-left:0px;\">Vsmart Live 4 là chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd-pin-khung\">điện thoại pin trâu</a>&nbsp;khi sở hữu viên pin lớn lên đến 5000 mAh tha hồ sử dụng trong suốt ngày dài. Thời gian sạc của máy cũng được rút ngắn đáng kể nhờ vào công nghệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-sac-pin-nhanh\">sạc nhanh</a>&nbsp;Quick Charge 3.0 với công suất 18W thông qua cổng sạc Type-C.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/227529/vsmart-live-4-6gb-170820-030814.jpg\" alt=\"Vsmart Live 4 6GB | Dung lượng pin khủng 5000 mAh\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Với mức giá tầm trung, nhưng Vsmart Live 4 đã bắt kịp xu hướng các smartphone hiện nay với thiết kế hiện đại, màn hình tràn viền, cụm camera đa chức năng chuyên nghiệp và dung lượng pin khủng.</p><p style=\"margin-left:0px;\">Đây sẽ là một lựa chọn phù hợp với mọi người dùng khi đang cần tìm một chiếc <a href=\"https://www.thegioididong.com/dtdd?p=tu-4-7-trieu\">điện thoại tầm trung</a> được trang bị đầy đủ tính năng hiệu quả mang lại trải nghiệm tuyệt vời cho người dùng.</p>', 4, 5, NULL, '2020-12-30 21:39:49', '2020-12-30 21:39:49', 1);
INSERT INTO `products` (`id`, `name`, `desc`, `price`, `slug`, `thumb`, `content`, `category_id`, `trademark_id`, `deleted_at`, `created_at`, `updated_at`, `active`) VALUES
(4, 'iPhone 12 256GB', 'iPhone 12 256 GB được Apple cho ra mắt đã đem đến làn sóng mạnh mẽ đối với những ai yêu công nghệ nói chung và “fan hâm mộ” trung thành của iPhone nói riêng, với con chip mạnh, dung lượng lưu trữ lớn cùng thiết kế toàn diện và khả năng hiển thị hình ảnh xuất sắc.', '26990000', 'dien-thoai-iphone-12-256gb', '1609389703-1609341917-iphone-12-trang-new-600x600-600x600.jpg', '<h3 style=\"margin-left:0px;\">Thiết kế hoàn thiện đến từng chi tiết</h3><p style=\"margin-left:0px;\">Màn hình <a href=\"https://dienmayxanh.com/kinh-nghiem-hay/tim-hieu-cong-nghe-man-hinh-super-retina-xdr-tren-1214864\">Super Retina XDR</a> 6.1 inch sắc nét, màu sắc sống động, đem đến những hình ảnh chi tiết, sắc nét và chân thật.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-273920-083915.jpg\" alt=\"Màn hình chuẩn Super Rentina XDR | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Hoàn thiện bằng khung nhôm tái chế, thân thiện với môi trường, các góc cạnh vuông vức, ít bo tròn, iPhone 12 có kích thước nhỏ hơn so với iPhone 11 nhưng tạo cảm giác cứng cáp và mạnh mẽ hơn.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274020-084011.jpg\" alt=\"Các góc cạnh trông vuông vức, cứng cáp hơn | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">iPhone 12 sử dụng công nghệ kính cường lực mới, lần đầu được giới thiệu bởi Apple với tên gọi Ceramic Shield. Nhờ việc đưa các tinh thể sứ nano vào cấu trúc bên trong, qua đó giảm thiểu tác động của việc rơi vỡ gấp 4 lần, nâng cao độ bền của thiết bị.</p><p style=\"margin-left:0px;\">Bên cạnh đó, Apple còn áp dụng quy trình trao đổi ion kép vào mặt sau của điện thoại giúp tăng cường khả năng chống xước.</p><p style=\"margin-left:0px;\">Thỏa thích lựa chọn màu sắc cá tính riêng cũng như sở thích của bạn với 5 gam màu năng động và thời thượng.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274120-084113.jpg\" alt=\"Nhiều màu sắc cho bạn sự lựa chọn phù hợp | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Trang bị chipset mạnh mẽ nhất 2020</h3><p style=\"margin-left:0px;\">iPhone 12 được trang bị con chip A14 Bionic sở hữu tốc độ xử lý lên đến 3.1 GHz, sản xuất trên tiến trình 5 nm, CPU gồm 6 nhân, với 4 nhân tiết kiệm pin và 2 nhân mạnh, nâng cao hiệu suất xử lý đồng thời duy trì hoạt động trong thời gian dài.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-275020-085029.jpg\" alt=\"Trang bị chipset mạnh nhất A14 Bionic | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Không thể không nhắc đến dung lượng bộ nhớ trong lên đến 256 GB, cùng khả năng mở rộng thêm 2 TB trên iCloud, phá vỡ mọi rào cản về lưu trữ dữ liệu trong thế giới <a href=\"https://www.thegioididong.com/dtdd\">smartphone</a>.</p><p style=\"margin-left:0px;\">Việc chụp ảnh camera và chơi game sẽ được nâng lên tầm cao mới, với hiệu suất xử lý hình ảnh hơn 80% so với phiên bản tiền nhiệm. Bên cạnh đó, nhờ bộ vi xử lý khủng này, cho phép thực hiện 11 ngàn tỷ phép tính trong mỗi giây, mang đến trải nghiệm mượt mà, không giật lag với hầu hết hoạt động của người dùng.</p><h3 style=\"margin-left:0px;\">Phá vỡ khái niệm camera trên smartphone</h3><p style=\"margin-left:0px;\">Thế hệ iPhone 2020 mới nhất trang bị hệ thống camera kép ở mặt sau, khả năng chụp ảnh được cải thiện đáng kể nhờ bộ vi xử lý A14 Bionic, bên cạnh việc mở rộng khẩu độ giúp cảm biến thu được lượng ánh sáng nhiều hơn 27%, mang lại những khung hình xuất sắc, chuẩn màu trên từng khoảnh khắc cuộc sống.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274120-084141.jpg\" alt=\"Hệ thống camera sau | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Công nghệ Smart HDR 3 hỗ trợ nhận diện khung cảnh, vật thể, giúp điều chỉnh cân bằng màu sắc, độ tương phản, kết cấu và độ bão hòa trong mọi bức ảnh, tích hợp thêm chế độ Deep Fusion giúp phân tích nhiều độ phơi sáng nhằm tối đa hóa chi tiết hình ảnh.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274220-084202.jpg\" alt=\"Hỗ trợ công nghệ HDR 3 cho hình ảnh chi tiết hơn | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Chế độ chân dung với khả năng kiểm soát độ sâu và hiệu ứng bokeh nâng cao, làm mờ hậu cảnh một cách nghệ thuật để dồn hết sự tập trung vào đối tượng.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274220-084212.jpg\" alt=\"Khả năng chụp chân dung ấn tượng | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Ngoài ra, bức ảnh sẽ càng tuyệt hơn khi chọn một trong sáu hiệu ứng ánh sáng: High-Key Like Mono, Natural Light, Studio Light,… dễ dàng tạo nên những bức hình chuẩn nghệ thuật, khẳng định chất riêng của bản thân.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274220-084225.jpg\" alt=\"Chụp ảnh đầy ấn tượng khi có nhiều hiệu ứng ánh sáng | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><h3 style=\"margin-left:0px;\">Mẫu iPhone đầu tiên được trang bị 5G</h3><p style=\"margin-left:0px;\">Được cho là tính năng phổ biến trên các điện thoại Android hàng đầu, thì nay, 5G lần đầu tiên xuất hiện trên iPhone. Apple đã xác nhận công nghệ 5G này có thể hoạt động với tất cả các nhà mạng trên thế giới.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274220-084247.jpg\" alt=\"5G cho tốc độ load cực nhanh | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\"><br>Với chế độ Điều chỉnh dữ liệu thông minh, khi tốc độ 5G không cần thiết, máy sẽ tự động sử dụng 4G LTE để tiết kiệm pin và ngược lại để đảm bảo tốc độ kết nối nhanh nhất.</p><h3 style=\"margin-left:0px;\">Thời lượng pin đủ dùng</h3><p style=\"margin-left:0px;\">Apple tuyên bố pin của iPhone 12 có thể kéo dài 16 tiếng phát phát lại video. Công nghệ Magsafe mới, hỗ trợ sạc không dây có công suất 15 W.</p><figure class=\"image ck-widget\" contenteditable=\"false\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/228737/iphone-12-256gb-274320-084304.jpg\" alt=\"Hỗ trợ nhiều công nghệ sạc | iPhone 12 256 GB\"><div class=\"ck ck-reset_all ck-widget__type-around\"><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_before\" title=\"Insert paragraph before block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__button ck-widget__type-around__button_after\" title=\"Insert paragraph after block\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 10 8\"><path d=\"M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038\"></path></svg></div><div class=\"ck ck-widget__type-around__fake-caret\"></div></div><figcaption class=\"ck-editor__editable ck-editor__nested-editable ck-hidden ck-placeholder\" data-placeholder=\"Enter image caption\" contenteditable=\"true\"><br data-cke-filler=\"true\"></figcaption></figure><p style=\"margin-left:0px;\">Tính năng sạc nhanh có sẵn trên điện thoại có thể giúp pin từ 0 đến 50% trong nửa giờ, nhưng bạn sẽ cần mua một bộ sạc 20 W riêng để có thể có được tính năng đó.</p><p style=\"margin-left:0px;\">Nhìn chung, iPhone 12 256 GB sở hữu một thiết kế cao cấp, sang trọng, hút mắt, với bộ vi xử lý mạnh hàng đầu thế giới, camera với nhiều tính năng, tối ưu hóa hình ảnh, thỏa sức sáng tạo và tận hưởng những hiệu năng cực khủng đến từ thế hệ iPhone mới nhất 2020 của Apple.</p>', 4, 9, NULL, '2020-12-30 21:41:43', '2020-12-30 21:41:43', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `desc`, `created_at`, `updated_at`) VALUES
(25, 2, '1609389487-1609348117-sam-sung-1.jpg', 'Điện thoại Samsung Galaxy M51', '2020-12-30 21:38:07', '2020-12-30 21:38:07'),
(26, 2, '1609389487-1609348118-sam-sung-2.jpg', 'Điện thoại Samsung Galaxy M51', '2020-12-30 21:38:07', '2020-12-30 21:38:07'),
(27, 2, '1609389487-1609348119-sam-sung-3.jpg', 'Điện thoại Samsung Galaxy M51', '2020-12-30 21:38:07', '2020-12-30 21:38:07'),
(28, 2, '1609389487-1609348119-sam-sung-4.jpg', 'Điện thoại Samsung Galaxy M51', '2020-12-30 21:38:07', '2020-12-30 21:38:07'),
(29, 2, '1609389487-1609348119-sam-sung-5.jpg', 'Điện thoại Samsung Galaxy M51', '2020-12-30 21:38:07', '2020-12-30 21:38:07'),
(30, 3, '1609389590-1609341260-v-smart-live-4-1.jpg', 'Điện thoại Vsmart Live 4 6GB', '2020-12-30 21:39:50', '2020-12-30 21:39:50'),
(31, 3, '1609389590-1609341260-v-smart-live-4-2.jpg', 'Điện thoại Vsmart Live 4 6GB', '2020-12-30 21:39:50', '2020-12-30 21:39:50'),
(32, 3, '1609389590-1609341261-v-smart-live-4-3.jpg', 'Điện thoại Vsmart Live 4 6GB', '2020-12-30 21:39:50', '2020-12-30 21:39:50'),
(33, 4, '1609389705-1609341918-iphone-12-trang-new.jpg', 'Điện thoại iPhone 12 256GB', '2020-12-30 21:41:45', '2020-12-30 21:41:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trademarks`
--

CREATE TABLE `trademarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trademarks`
--

INSERT INTO `trademarks` (`id`, `name`, `slug`, `logo`, `created_at`, `updated_at`, `active`) VALUES
(4, 'Samsung', 'samsung', '1609041561-samsung-logo.png', '2020-12-26 20:59:21', '2020-12-27 08:15:46', 1),
(5, 'VinSmart', 'vinsmart', '1609068375-vinsmart-logo.png', '2020-12-26 20:59:46', '2020-12-27 08:15:45', 1),
(9, 'Apple', 'apple', '1609341563-apple-logo.png', '2020-12-30 08:19:23', '2020-12-30 08:19:23', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`products_id`),
  ADD KEY `order_detail_orders_id_foreign` (`orders_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `trademarks`
--
ALTER TABLE `trademarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_orders_id_foreign` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_detail_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
