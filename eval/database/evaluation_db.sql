-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 19, 2021 lúc 06:07 PM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `evaluation_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `academic_list`
--

CREATE TABLE `academic_list` (
  `id` int(30) NOT NULL,
  `year` text NOT NULL,
  `semester` int(30) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Start,2=Closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `academic_list`
--

INSERT INTO `academic_list` (`id`, `year`, `semester`, `is_default`, `status`) VALUES
(1, '2019-2020', 1, 0, 0),
(2, '2019-2020', 2, 0, 0),
(3, '2020-2021', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_list`
--

CREATE TABLE `class_list` (
  `id` int(30) NOT NULL,
  `curriculum` text NOT NULL,
  `level` text NOT NULL,
  `section` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `class_list`
--

INSERT INTO `class_list` (`id`, `curriculum`, `level`, `section`) VALUES
(1, 'BSIT', '1', 'A'),
(2, 'BSIT', '1', 'B'),
(3, 'BSIT', '1', 'C'),
(4, 'ĐH', '2020-2021', 'K45-CNTT-A'),
(5, 'Đại học', '2020-2021', 'K46.CNTT.A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `criteria_list`
--

CREATE TABLE `criteria_list` (
  `id` int(30) NOT NULL,
  `criteria` text NOT NULL,
  `order_by` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `criteria_list`
--

INSERT INTO `criteria_list` (`id`, `criteria`, `order_by`) VALUES
(1, 'TIÊU CHÍ 1', 0),
(2, 'TIÊU CHÍ 2', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluation_answers`
--

CREATE TABLE `evaluation_answers` (
  `evaluation_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `rate` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `evaluation_answers`
--

INSERT INTO `evaluation_answers` (`evaluation_id`, `question_id`, `rate`) VALUES
(1, 1, 5),
(1, 6, 4),
(1, 3, 5),
(2, 1, 5),
(2, 6, 5),
(2, 3, 4),
(3, 1, 5),
(3, 6, 5),
(3, 3, 4),
(4, 1, 5),
(4, 6, 5),
(4, 3, 1),
(5, 1, 5),
(5, 6, 3),
(5, 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluation_list`
--

CREATE TABLE `evaluation_list` (
  `evaluation_id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `restriction_id` int(30) NOT NULL,
  `date_taken` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `evaluation_list`
--

INSERT INTO `evaluation_list` (`evaluation_id`, `academic_id`, `class_id`, `student_id`, `subject_id`, `faculty_id`, `restriction_id`, `date_taken`) VALUES
(1, 3, 1, 1, 1, 1, 8, '2020-12-15 16:26:51'),
(2, 3, 2, 2, 2, 1, 9, '2020-12-15 16:33:37'),
(3, 3, 1, 3, 1, 1, 8, '2020-12-15 20:18:49'),
(4, 3, 4, 5, 1, 2, 11, '2021-05-15 11:44:13'),
(5, 3, 5, 6, 1, 2, 12, '2021-05-17 06:35:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faculty_list`
--

CREATE TABLE `faculty_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `faculty_list`
--

INSERT INTO `faculty_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(2, '002', 'Nguyễn Viết ', 'Hưng ', 'nguyenviethung@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1621072320_mustang_car_sports_car_163407_1400x1050.jpg', '2021-05-15 16:52:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_list`
--

CREATE TABLE `question_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `question` text NOT NULL,
  `order_by` int(30) NOT NULL,
  `criteria_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `question_list`
--

INSERT INTO `question_list` (`id`, `academic_id`, `question`, `order_by`, `criteria_id`) VALUES
(1, 3, 'Thầy cô có đi dạy đúng giờ', 0, 1),
(3, 3, 'Huỳnh Bảo Lộc rất giỏi', 2, 2),
(5, 0, 'Question 101', 0, 1),
(6, 3, 'Có giao bài tập về nhà', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restriction_list`
--

CREATE TABLE `restriction_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `restriction_list`
--

INSERT INTO `restriction_list` (`id`, `academic_id`, `faculty_id`, `class_id`, `subject_id`) VALUES
(8, 3, 1, 1, 1),
(9, 3, 1, 2, 2),
(10, 3, 1, 3, 3),
(11, 3, 2, 4, 4),
(12, 3, 2, 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `class_id` int(30) NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `student_list`
--

INSERT INTO `student_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `class_id`, `avatar`, `date_created`) VALUES
(4, '4501104041', 'Huỳnh Anh', 'Dự', '450114041@student.hcmue.edu.vn', 'b2076d5589746fdaf440e2c8959206ed', 4, '1621078080_mustang_car_sports_car_163407_1400x1050.jpg', '2021-05-15 16:32:59'),
(6, '4601104121', 'Trần Thị Bích ', 'Ngọc', 'ngocttb.cnthongtin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 5, 'no-image-available.png', '2021-05-17 06:33:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject_list`
--

CREATE TABLE `subject_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `subject_list`
--

INSERT INTO `subject_list` (`id`, `code`, `subject`, `description`) VALUES
(1, 'MATH-201', 'Đại số tuyến tính', 'DSTT-01'),
(2, 'ENG-101', 'English HP 1', 'English'),
(3, 'M-101', 'Toán giải tích', 'MATH_GT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'HỆ THỐNG ĐÁNH GIÁ HỌC PHẦN', 'duha.cnthongtin@gmail.com', '0366610949', '280 An Dương Vương, Quận 5, TPHCM', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, 'Huỳnh Anh', 'Dự', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', '1621077900_night.jpg', '2020-11-26 10:57:04'),
(2, 'Huynh Anh', 'Du', 'huynhanhdu2000@gmail.com', 'b2076d5589746fdaf440e2c8959206ed', '1621071060_mustang_car_sports_car_163407_1400x1050.jpg', '2021-05-15 16:31:53');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `academic_list`
--
ALTER TABLE `academic_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `class_list`
--
ALTER TABLE `class_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `criteria_list`
--
ALTER TABLE `criteria_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `evaluation_list`
--
ALTER TABLE `evaluation_list`
  ADD PRIMARY KEY (`evaluation_id`);

--
-- Chỉ mục cho bảng `faculty_list`
--
ALTER TABLE `faculty_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `question_list`
--
ALTER TABLE `question_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `restriction_list`
--
ALTER TABLE `restriction_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subject_list`
--
ALTER TABLE `subject_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `academic_list`
--
ALTER TABLE `academic_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `class_list`
--
ALTER TABLE `class_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `criteria_list`
--
ALTER TABLE `criteria_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `evaluation_list`
--
ALTER TABLE `evaluation_list`
  MODIFY `evaluation_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `faculty_list`
--
ALTER TABLE `faculty_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `question_list`
--
ALTER TABLE `question_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `restriction_list`
--
ALTER TABLE `restriction_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `subject_list`
--
ALTER TABLE `subject_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
