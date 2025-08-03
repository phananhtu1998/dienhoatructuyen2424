-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jun 18, 2025 at 05:40 AM
-- Server version: 9.2.0
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkingdevgo`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` char(36) NOT NULL,
  `number` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '[active,inactive]',
  `images` varchar(255) NOT NULL,
  `created_by` char(36) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='account';

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `number`, `code`, `name`, `email`, `username`, `password`, `salt`, `status`, `images`, `created_by`, `is_deleted`, `create_at`, `update_at`) VALUES
('00a8d061-a6ab-4500-bfd5-5132210f541e', 54826081, 'TC_voducduy40', 'voducduy40', 'voducduy40@gmail.com', 'voducduy40', 'd1b4b3bdc517fd5458062f79cf4bf8f65b362cea17607ff632a75ec1c317af79', '75edf0bab99fb12ce8a82bd3504e954d', 0, '/parkingbuckets/1745388456390349482_VoDucDuy22081053.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-23 06:07:36', '2025-04-25 04:10:58'),
('0134e60c-817e-4381-8ff4-99c1fe283dae', 1431239610, 'TC_leducbao', 'Lê Đức Bảo', 'leducbao@thaco.com.vn', 'leducbao', '585de03337d242b25d9cc79d7b98c4454d753147e1b195d59c8beadcef2ebee2', 'bde4244cdb233a6999b2271674ac5e0b', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:24:42', '2025-06-18 02:01:39'),
('025e5f15-a203-4080-a74f-fc07fb8d995c', 1071266467, 'TC_lehoangbuu', 'Lê Hoàng Bửu', 'lehoangbuu@thaco.com.vn', 'lehoangbuu', '9c38f3db8caa032904ed8470fee78cde3cd28a180b2e4bec05848c26181b79e5', 'fb9e46473651bf702f2fb4258a64d7fc', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:06:42', '2025-06-17 09:06:42'),
('03fa3240-e797-44cb-8515-87ca237c63e5', 678478461, 'TC_levantuong', 'Lê Văn Tưởng', 'levantuong@thaco.com.vn', 'levantuong', 'ec8b6ea121289ea745bd78c33af02cf93b421ccab49f944560d636a0cce482c5', '39e37e557185eb23f6fd983f6430b436', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:09:18', '2025-06-17 09:09:18'),
('04736374-cec6-4c54-acac-f17e7dece80b', 690093810, 'TC_ADMIN', 'voducduy4', 'voducduy4@gmail.com', 'voducduy4', 'b0b9f815539ebd2c9d9cfbf759c9b8a6dfe4cc8c3f522b42e383b932ef5a8184', '1796f44ee6e9a9337664b5c9e9a6b857', 0, '/parkingbuckets/1745023083042428954_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 00:43:09', '2025-04-24 08:50:03'),
('05a159ba-2d4c-4c7c-88ac-9617bfac1ba8', 420852447, 'TC_test2805', 'test 28056', 'test2805@gmail.com', 'test2806', '6803ba5f6cbe862b557603148a16a6f58d1020f0915e5935113ff89ccb24d46c', 'b25b472f3377ffcf2b5ccfddcbe0649f', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:48:11', '2025-06-16 08:10:12'),
('069e6dd3-e946-4266-8f08-b0aabffa4f95', 412755598, 'TC_voducduy13', 'voducduy13', 'voducduy13@gmail.com', 'voducduy13', '6af981d899441eacd8c0c2b40c4ded4ead114cdc7cd601df8845ffabc30e3adc', 'e9d272da60ba0efaac17cdef657e03a8', 0, '/parkingbuckets/1745291086364714062_VoDucduy_aokysu.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:29:25', '2025-04-22 06:35:22'),
('0a62f357-e006-4384-99f8-68c57bb60c7e', 1983877558, 'TC_voducduy13', 'voducduy13', 'voducduy13@gmail.com', 'voducduy13', 'fcd8e6bf0077c511d55cdb0a3df57427294f8b46fe0025bec150bd42fbde5bde', 'b4d89a087a4e946dbcdf24f5f525de69', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:18:18', '2025-05-05 09:27:05'),
('0cbce78b-b439-4ef8-96d2-6e3cce544cfd', 1887358279, 'TC_voducduy14', 'voducduy14', 'voducduy14@gmail.com', 'voducduy14', '81618cd7995edd0be625d7102e359df8bf5d4d412e48df2cfc67720d89f7ba5d', '4fcd5929fdec9dcc97d805130c54add8', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:18:36', '2025-04-25 04:21:31'),
('0e63f96f-8135-485d-a246-91f00e140d32', 533334236, 'TC_buithanhson', 'Bùi Thanh Sơn', 'buithanhson@thaco.com.vn', 'buithanhson', 'cb14045b82aed93144c5068a11a58ae7a858dc9c5cb7fcd06352edc339d2adba', '32def6e3964273ca99174bcbad9bce55', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:52:43', '2025-06-16 07:52:43'),
('0e9c2893-cc45-43f7-986d-6b109a64c64b', 1921718313, 'TC_voducduy154', 'voducduy154', 'voducduy154@gmail.com', 'voducduy154', '1f8c35c39a1e22334424ce11f3bb070dfdd4a05c0959af7c4677790651b1ab21', '3b67101b5e0e118c49b6427741075c3f', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:43', '2025-06-17 03:47:43'),
('0ea47c73-453b-4e08-aa44-30805cf7a04a', 388575219, 'TC_voducduy100', 'voducduy100', 'voducduy100@gmail.com', 'voducduy100', '90a32dc9f8afc45780a1eb197fb80ac1e61539dcabf83794fd6376867517f21f', 'fd156a762f9ad0b94b171f4f2cd50eb0', 1, '/parkingbuckets/1749280526191984428_car.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 07:15:26', '2025-06-07 07:35:22'),
('0ef69410-1d17-4613-95e9-8c5dac52763b', 67232017, 'TC_voducduy158', 'voducduy158', 'voducduy158@gmail.com', 'voducduy158', 'db0cfc52fefd32e01df6a260d69fe0b5cc495ddcdfa37ce732326adc68aa134e', '0b609679f7401d933b102ddd62321935', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:49:31', '2025-06-17 03:49:31'),
('11e056d3-634e-45c0-b598-306e9793ddbc', 156155126, 'TC_voducduy22', 'voducduy22', 'voducduy22', 'voducduy22', 'e7a4bbbe52b4d182d7e8c98a06225695d3bea011ba8f745cde5b863b73f47046', 'b8c127f3dd9bcb216e41d6fe9d5ac2fa', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:28:21', '2025-05-05 09:25:19'),
('1298d606-3ae2-449e-aebc-64aca57c3047', 94391020, 'TC_voducduy151', 'voducduy151', 'voducduy151@gmail.com', 'voducduy151', '89aa3c7d5f9dec4638510a9c9d8e78051e00990d616646b03792342aba221bbe', 'c1237209a5084ccdf464bec02c0e53de', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:46:48', '2025-06-17 03:46:48'),
('13fbd1b8-8a84-40c6-b530-72d16cfe94e4', 131997048, 'TC_voducduy3', 'voducduy3', 'voducduy3@gmail.com', 'voducduy3', '48faf2204dd4a90e971e8f265bf419e3e47f9e98f168de12e9f9952ef37d3998', '93c4b523b1d855e3259348b6b3c2d97b', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:13:18', '2025-04-25 04:13:18'),
('165b8a45-2879-410c-9810-8f5d97cf1f0a', 894083709, 'TC_nguyenductinh', 'Nguyễn Đức Tính', 'nguyenductinh@thaco.com.vn', 'nguyenductinh', '50f73f18487c05521b10f1676e0c9fc41e20b71d4bcce3b17fa814b01d7ff165', '28745004b13081f40b163cdca276e391', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:08:14', '2025-06-17 09:08:14'),
('18190936-5b69-49c7-ae39-bfba0565dc2f', 1016714262, 'TC_nguyen văn', 'Nguyễn Văn', 'nguyenvanthaco@gmail.com', 'nguyenvan', '9192b91ee15542c472db9b736f5d8fa65bb9a8902fe1ad4b3a87a4c3d1946ccd', 'a700161fe06d8c3c418f0c7b96507838', 1, '/parkingbuckets/1749611457304686752_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 08:32:52', '2025-06-11 03:10:57'),
('1975a786-6f67-445c-8689-1bb16b9fd983', 1423435431, 'TC_voducduy162', 'voducduy162', 'voducduy162@gmail.com', 'voducduy162', '5b3ef78a1ffc153a752337416be53cf16e80f0755a1dbbcc7d84198f547c0d4e', '8ecd958ff649b246df979a1474dac608', 1, '/parkingbuckets/1750132263251498731_be.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:03', '2025-06-17 03:51:03'),
('1ebe5191-0d3a-4cdd-9e1a-12fc9f58aa22', 381574632, 'TC_DTTT', 'ĐTTL', 'dttl@gmail.com.vn', 'DTTT', '2034df4760282371894911ff0a4890f1c1afc3931917fa2d107c5cb1eec0ca96', 'd23cf0c57e54b2ec98c7f1c90c320c4d', 1, '/parkingbuckets/1749888333119027276_Hinh-hoa-bo-cong-anh.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 08:05:33', '2025-06-16 01:02:15'),
('20a6b4b0-94d7-4acd-932f-2531e0759487', 254293970, 'TC_nguyenvand', 'nguyenvand', 'nguyenvand@gmail.com', 'nguyenvand', '9fd4ecbc5ce1321919259348db733687182b3909297debc223e0a2064edad5d6', '8a3de889af91196c1b6d1fc62e192ef5', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:58:48', '2025-06-16 07:47:27'),
('214ab878-ccab-405a-84a7-91c00e069723', 153775110, 'TC_vo duc duy 103', 'voducduy103', 'voducduy103@gmail.com', 'vo duc duy 103', 'a377811cfcd7b199f54b2515798fe81b230354dbb62446179f89f03e7ff9c1c5', 'f15e2e02d5eb8b39e5fccea774a86909', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-11 01:52:24', '2025-06-11 01:53:32'),
('22edff91-b584-4d35-a39b-459dd83321c3', 1964951166, 'TC_voducduy161', 'voducduy161', 'voducduy161@gmail.com', 'voducduy161', '0ce47dd45731f85a1fb85f78749ab4db7dc476b5d3eae5ef7d160740966bb3ab', '9f148caaf583b434c7d0541aa4e6558d', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:50:34', '2025-06-17 03:50:34'),
('245a42fd-2d55-4958-b4d3-5c225c8a0466', 1151372408, 'TC_nguyenthuongtin', 'Nguyễn Thương Tín', 'nguyenthuongtin@thaco.com.vn', 'nguyenthuongtin', '97bcbbe27382da41c3968dc4254af31188a4f3a4d572b1f819d6062c3c53dfb7', 'a2a08232a5f8a0cb2de0a6a3ffd02363', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:11:48', '2025-06-17 09:11:48'),
('274e3db5-a5ec-485c-9181-51f620e0310e', 1447094499, 'TC_dautheduc', 'Đậu Thế Đức', 'dautheduc@thaco.com.vn', 'dautheduc', '85c36a9cafcf0e3c0ce45ab6208071abea2b89f25042fec8b5e754b393bafa58', '05e25955ceacc2f7e727c5bd8988be1a', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:33:02', '2025-06-16 07:33:02'),
('2779ad3c-60b6-4bd3-8386-d8a15f724bb8', 1209664119, 'TC_voducduy150', 'voducduy150', 'voducduy150@gmail.com', 'voducduy150', 'c404c4a3219ff52783fd1e1f87d6fd6b89ccca491e9e35d1b86b4ab2070261d6', '598da125ab724270264ae41e711eaee8', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:33:38', '2025-06-17 03:33:38'),
('2837a504-4cc8-4827-b0c4-0fa1e3ccb325', 578522938, 'TC_phamvansang', 'Phạm Văn Sang', 'phamvansang@thaco.com.vn', 'phamvansang', 'c281d9d94ec3c4e7a4a65c657ece98da5467489da31cf1689565907bc65d2854', '578d590a9d1465f49c732ca144074b41', 1, '/parkingbuckets/1750151079285119521_Screenshot_42.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:04:39', '2025-06-17 09:04:39'),
('2aecc04d-fb1a-4c6a-823d-d6a3d13da9bd', 779800588, 'TC_voducduy84', 'voducduy84', 'voducduy84@gmail.com', 'voducduy84', '40d8276b81e9a3388e6e8ce53f6d4604c4363c44f317b80f47a451de5833eceb', '0825775def99fac4332ce1601f0a663e', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:22:19', '2025-04-24 03:23:04'),
('2b9d7b50-3497-4d58-b0ab-eaf891cca75f', 408557881, 'TC_anhtu', 'anh tú', 'at@gmail.com', 'anhtu', '635590dca54ef18a6d422e23683657cc0509eb120136fdc73d73932bf04f3da7', 'fc124605dd2dc670660437df14de4f81', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 09:08:05', '2025-06-11 03:14:21'),
('2df3efb5-c29d-49eb-a2a3-8270d91a9b04', 1240552324, 'TC_nguyencuong', 'Nguyễn Cường', 'nguyencuong@thaco.com.vn', 'nguyencuong', 'a64daece1e56fcf6f7d325b1a393572415500790f0e1d7b75c2f60e17cc20ba2', 'ea5aafd9bd1d62c8c6bc8e6c9f12d892', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:43:52', '2025-06-16 07:43:52'),
('2fa63932-e639-4593-8ce0-ee91926f7678', 1662446365, 'TC_voducduy105', 'voducduy105', 'voducduy105@gmail.com', 'voducduy105', '3832143a526cf4bdca5e5e5caea65b8c644420417ee4570b2f213a98a39e9233', '6ad5cffff298dba093937e58440589ef', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:10:34', '2025-06-17 01:10:34'),
('31ea19da-21b2-4d0d-b41e-1f7c7130a667', 814938419, 'TC_tranvanhoi', ' Trần Văn Hội', 'tranvanhoi@thaco.com.vn', 'tranvanhoi', '4dcf1172358b9fbf42ee6786429a77be3ee0a591d6a40764583c169dea0a87f3', 'ebb375cdf37d42d479d1a9b4284e2525', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:10:17', '2025-06-17 09:10:17'),
('3205701d-3149-4410-9058-c6f26a774045', 2055553609, 'TC_voducduy30', 'voducduy30', 'voducduy30@gmail.com', 'voducduy30', 'a8bbfb7c7b9bfd48b72166a81e4ab673bece14157b7dfb684cc6be9cd22235d2', 'e9e59ef1cbd2075c4a3657fe3f05724c', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-28 02:40:27', '2025-04-28 02:40:27'),
('32bb8141-481b-42fe-a6ff-49fdd44d79ea', 1196500939, 'TC_voducduy5', 'voducduy5', 'voducduy5@gmail.com', 'voducduy5', '4a7c72e6fabb5cbbb1d01cb8a926b33536374e868556cd44ce551ac038ef88e0', '026477f9c25fa35d1681a2977b350ec4', 1, '/parkingbuckets/1745554461929738822_tuyenAI.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:14:21', '2025-04-25 04:14:21'),
('3326ca85-c386-4f73-94c9-b0d4ace0c4dd', 343069492, 'TC_trantanthanhchung', 'Trần Tấn Thành Chung', 'trantanthanhchung@thaco.com.vn', 'trantanthanhchung', '1458fb110dcc6fa24e141f68020abeefbf58ed1df2cd367df6d3bc4f7c9ee434', 'c42d46f157fc59f4a032cc73e202f86e', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:11:21', '2025-06-17 09:11:21'),
('33876fa1-868e-4a58-a3f5-959a571160c1', 1849190849, 'TC_voducduy11', 'voducduy11', 'voducduy11@gmail.com', 'voducduy11', '59a655912f90ae74521c8c702fcc072ee88b2b29dc6ff57854c98176c9a4e772', '191b9c1ef0eef35161774255bfe819ae', 0, '/parkingbuckets/1745554640096218063_z5838819445523_3c28af0d374623829b77b9bbaa9678b9.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:17:20', '2025-05-29 01:08:16'),
('35a80007-c6c7-4df8-96f3-b829eb477d33', 1450131375, 'TC_cudinhhuy', 'Cù Đình Huy', 'cudinhhuy@thaco.com.vn', 'cudinhhuy', 'c687a41510296497eabadaa89a2ff145599a102193ec0dd19b0f21e67b57e99e', 'e08d454d93f1a9b91fbff541f9be96c3', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:09:51', '2025-06-17 09:09:51'),
('35b4603d-7cea-4580-8eab-149cce2aad1e', 1436569136, 'TC_voducduy80', 'voducduy80', 'voducduy80@gmail.com', 'voducduy80', 'ee916a407c43f43a130b91bc5b951aba5e56e3ef3886526e10f5cf2f83ff2070', '954ef018e76de1563520d5ad1305e9d0', 0, '/parkingbuckets/1745300951461118233_car2.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 05:49:11', '2025-04-25 04:10:58'),
('36030ad7-b8f9-45ee-ae42-2b8bf957b0fa', 640118751, 'TC_voducduy22', 'voducduy22', 'voducduy22@gmail.com', 'voducduy22', '75fc1ab8d468b4eb65f37a610fbff148d3e9b4e1db91acf64a7b1be24adec153', '724feaa6143d517e91cce678d56266f3', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:36:15', '2025-04-24 06:21:50'),
('365974a5-23e1-46f2-a02f-1e8d640015eb', 150858659, 'TC_voducduy12', 'voducduy12', 'voducduy12@gmail.com', 'voducduy12', 'ccfb9f2c3b1386e5ef29b2df3229b88989fa6b63bd5cd9ae2bfb119eeb51ca6e', 'f6b800666835bee652a10444274b6b60', 0, '/parkingbuckets/1745050866953945361_11179458_bill-cafe-0944745931.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:21:06', '2025-04-25 04:10:58'),
('36b9f2ca-f97f-4c7b-a796-f3e40cacf8d1', 1059125587, 'TC_voducduy156', 'voducduy156', 'voducduy156@gmail.com', 'voducduy156', '811514daced754f2fbc75948718c5756994d59d5eb45ad16bc094d99d54a1c31', 'c5c50c7773ae7ec8a31946cc5bb63168', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:31', '2025-06-17 03:48:31'),
('372dc29e-986a-4f16-9a30-c4e2816d56be', 1031250035, 'TC_voducduy1', 'voducduy1', 'voducduy1@gmail.com', 'voducduy1', '631a3d678c6bf989f4024d85ed005b76f84fd94022bd610536da282d14cc6e3b', '379827d891305b4fd399b28d0cfcb6d8', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 07:20:39', '2025-04-25 04:10:58'),
('38d16031-b1eb-4710-809d-05cb735fedbe', 201787482, 'TC_phanvandung', 'Phan Văn Dung', 'phanvandung@thaco.com.vn', 'phanvandung', '36cbf4fa4df126c1f8e27dcb86801eff7de742016a712b7f022395154b112c9d', 'a284d009690910ee9809fe97cf195d2c', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:21:29', '2025-06-16 07:21:29'),
('3a12f805-ab93-4dd6-819d-e77fd968d211', 631549406, 'TC_tathanhtuan', 'Tạ Thanh Tuân', 'tathanhtuan@thaco.com.vn', 'tathanhtuan', 'acbda0908db6ae8fb45154aef610cfec372041658c1ec1b08f2156c8d96132f2', '50da2fb19e6d54038508450b15e5ee6b', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:41:43', '2025-06-16 07:41:43'),
('3e14b4a3-6f7e-47b3-aa47-a1202c9e2bac', 1932734322, 'TC_voducduy2', 'voducduy2', 'voducduy2@gmail.com', 'voducduy2', 'f0355310211807eb2615545fa9ca1d8902b7857829fb0115fc9c2c02f25ef463', 'dac76173b0660184cc19dac0b8803eb3', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:58:36', '2025-04-25 04:10:58'),
('3fcf2ce4-6c66-4f22-a8bf-7e3b67983f7d', 596958324, 'TC_ADMIN', 'voducduy7', 'voducduy7@gmail.com', 'voducduy7', '5e4432519bfbe41aa9797883d9a552e7cbcc47680594907c2012028660da1e65', 'f6757de62c1c66f3145ecf3c924ad250', 0, '/parkingbuckets/1745041155865836517_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 05:40:18', '2025-04-22 05:39:21'),
('42c5640e-998c-4440-bdd8-5934f1f6f639', 189811003, 'TC_voducduy20', 'voducduy20', 'voducduy20@gmail.com', 'voducduy20', '72625283ae6a75bd9a51c8aae1a3b731ac099f601affd151443df2dc2edb66d6', 'a22c2da56877ff2548925a1ffa98fb42', 0, '/parkingbuckets/1745051707678394520_car.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:35:07', '2025-04-25 04:10:58'),
('43a7e1ac-8d4b-42ff-ac5b-ef6e83c1abb9', 2125243153, 'TC_voducduy1', 'voducduy1', 'voducduy1@gmail.com', 'voducduy1', '46300fb51221d0e559599a0ea01b9613c49c06f821132c37d04d0246da2c7f5b', '44735c3ab2a42d4a52d7151acccf83cd', 0, '/parkingbuckets/1745554302162172652_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:11:42', '2025-04-25 04:19:01'),
('44569dc8-08b7-44f8-8839-55b6beba80da', 1993716840, 'TC_nguyenphanhoangdung', 'Nguyễn Phan Hoàng Dũng', 'nguyenphanhoangdung@thaco.com.vn', 'nguyenphanhoangdung', 'be9c91fb4a90b0de402c03ac401507ade3816ef475979ad910b710650a9af48d', 'dd22b57c365d63c583784b22909d1991', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:35:56', '2025-06-16 07:35:56'),
('45ab8e40-165f-48d9-80ad-80a82eaee2f4', 277607314, 'TC_voducduy37', 'voducduy37', 'voducduy37@gmail.com', 'voducduy37', '8d84d94dd232f7537e19d182b4d05fe1787f6d292c9f4c07f8ff19b012626ac9', 'dd8cf596653b4bba9d48db3811d971ea', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:40:49', '2025-04-25 04:10:58'),
('4643ab25-a78c-47df-828c-f0d6839b3e12', 901644450, 'TC_voducduy16', 'voducduy16', 'voducduy16@gmail.com', 'voducduy16', '3031cbe81b9ad5bab337e00c81c2fe767d33990ad0f3f773c52e3dc702d12fd1', 'd49843176f2481568dba0ab67205232d', 0, '/parkingbuckets/1745051570332264914_z5838819445523_3c28af0d374623829b77b9bbaa9678b9.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:32:50', '2025-04-24 08:54:57'),
('46991b48-0a5c-42e5-a609-821353f1fe38', 1770115342, 'TC_phanvandung', 'Phan Văn Dung', 'phanvan dung', 'phanvandung', 'c0240be27f0e06875f497cf648d6f01f3394a1bd2dfee8b13912cbd43040c3c6', 'eba2a7870d9bc808d668911e9c40a50c', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-16 07:20:50', '2025-06-16 07:21:00'),
('4ba6570b-d176-48cc-85a0-c6ec7ce669cd', 1282579205, 'TC_voducduy8', 'voducduy8', 'voducduy8@gmail.com', 'voducduy8', '6c55938bc4bd5c9e6440c7690d5a6312fd0cc7133c7adc2284b59daca33ff327', '555dd80b0ea28ca9a1260ff3c1c34156', 0, '/parkingbuckets/1745041155865836517_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:01:01', '2025-04-22 06:36:34'),
('4e1c9d33-411b-4150-9783-b494d56f3168', 161543605, 'TC_voducduy155', 'voducduy155', 'voducduy155@gmail.com', 'voducduy155', '6275dbb45873e8e6c44c18f943dce2b3d00b5b738dfab817cd6f304520272467', '1cfddabecb4b7c5ee4aaeec935db1b40', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:06', '2025-06-17 03:48:06'),
('4f5e1175-1e26-4b6b-bdef-6290a6504dc1', 720128212, 'TC_huynhdaitin', 'Huỳnh Đại Tín', 'huynhdaitin@thaco.com.vn', 'huynhdaitin', 'f8e5cfec00f3cdf4a266b21e762f48da4a15ac5c56ea6fd864add8b22350d05c', 'ccc24dd3b985c9d6431253be39da9293', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:23:55', '2025-06-17 09:23:55'),
('50b960e2-a5a6-493c-9f59-cfb91cd58d34', 2127708468, 'TC_voducduy103', 'voducduy103', 'voducduy103@gmail.com', 'voducduy103', 'c17d9be65d690891c72ec9df68294439a12d3e5cd94876be9f1511e3762115b5', '81a9fcdfec9a005fb94fa1c840b3553a', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:03:30', '2025-06-17 01:03:30'),
('5aa3732e-a26a-4693-95d6-5623f77c5ecb', 2130182705, 'TC_thaidinhhoang', 'Thái Đình Hoàng', 'thaidinhhoang@thaco.com.vn', 'thaidinhhoang', '59099f03ff831585dcc611ec606031466bb445ac474567ea7d77e0a6939abd87', '051f4d1b9c589675c6e99d3a71c8b216', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:36:38', '2025-06-16 07:36:38'),
('60577134-c2e4-4dfd-a6d3-154026a104c4', 451111105, 'TC_voducduy18', 'voducduy18', 'voducduy18', 'voducduy18', '40081a470f1fc229c647a5e90eee0136e622888c5d3632a717968d752f7c23fa', '6ac46403d2c3112ac30e7a69347dd599', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:26:46', '2025-04-26 08:06:25'),
('647df7a7-6fb2-4c6e-aacc-6c34c44ffbcc', 1472501233, 'TC_tranquocanh', 'Trần Quốc Anh', 'tranquocanh@thaco.com.vn', 'tranquocanh', 'dceef424642e6846df858b6afb1a025e2af3c8a5341b92bb6f0281cbd8ad5ec7', 'd3e3045feea78f6ebcea9becfc3a159c', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:33:52', '2025-06-16 07:33:52'),
('64ab389a-dd92-40cc-a586-5557c56b066e', 257721355, 'TC_nguyvanngoc', 'Nguyễn Văn Ngọc', 'nguyvanngoc@thaco.com.vn', 'nguyvanngoc', 'e1a4d3b10468f0fda576f1279be8475d0463d17c4ab315b8725ec1d3be2807cb', '6b621480d854575445143cfa4d0226ea', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:18:26', '2025-06-17 09:18:26'),
('6591dab0-1fdb-4b1f-af15-3dd6febcef43', 2082162229, 'TC_voducduy16', 'voducduy16', 'voducduy16@gmail.com', 'voducduy16', '60437e5d8cc07f7639756e69405b60da511137bac0fc5f6a9d8ca220fd86b776', '771bd87a374f4401ae6a71e993c46ea6', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:25:43', '2025-05-05 09:25:19'),
('698a0fb4-b151-4029-80c2-ec848d0afbc7', 291188955, 'TC_nguyentaivang', 'Nguyễn Tài Vang', 'nguyentaivang@thaco.com.vn', 'nguyentaivang', '6df038e8aaf264b233076b4f374d4b41ad8e50feeba03c3780e2289b3f21f9d7', '55ba2106d41f527629838a2ed89bf24c', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:45:27', '2025-06-16 07:45:27'),
('6b58799e-45dc-4489-abd3-c6c09f4bdfb6', 1962015766, 'TC_voducduy36', 'voducduy36', 'voducduy36@gmail.com', 'voducduy36', '6382bd6c7daaa734edc5a499551ae20b3fc31423554d4501f9a8853b134b86a6', '29bd42417694388aa96d96ec7f42dec4', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:26:11', '2025-04-25 04:10:58'),
('6e12c9ad-53c9-4809-b263-4e7b12ae888e', 381881851, 'TC_dinhthitruclinh', 'Đinh Thị Trúc Linh', 'dinhthitruclinh@thaco.com.vn', 'dinhthitruclinh', 'd334d5942e335dfcd8c4f41a133063bd5363fef677ef71380c4555e43ad286e2', '3e94568f31c131c90a3bf51f551724e8', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:41:43', '2025-06-10 07:04:35'),
('6e217271-9d44-45ce-8b7c-1726091eab8e', 1091602068, 'TC_nguyenquocduy', 'Nguyễn Quốc Duy', 'nguyenquocduy@thaco.com.vn', 'nguyenquocduy', '8be6af6d42c50ed691937f23b7801b97cedd3f1d2ae15d0250eaee1f2aa43c9b', '45cd88308c61012c09e71d69ee1af8c4', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:05:12', '2025-06-17 09:05:12'),
('6e372bb9-c21f-4e4d-a6f8-7c07ed9f002d', 209610, 'TC_voducduy35', 'voducduy35', 'voducduy35@gmail.com', 'voducduy35', '236d561f368a5746d033c7adbd50d818dd8cd8d8ebf701341521c21f2ecf21c7', '739905c92e484e35aa7ff69119fea758', 0, '/parkingbuckets/1745306621335819837_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:23:41', '2025-04-24 02:02:54'),
('70d964ac-901a-4dad-898d-329b777d2405', 867309722, 'TC_vonguyenhoang', 'Võ Nguyên Hoàng', 'vonguyenhoang@thaco.com.vn', 'vonguyenhoang', 'e52898b8e85ee34f43a02036b49c959cf5947c37e9c0a7eb00be8fb70dbb15b6', '617af87ee886a51f54150133087da307', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:47:03', '2025-06-16 07:47:03'),
('72024815-e681-4791-bc10-6c5624f40740', 140000914, 'TC_voducduy50', 'voducduy50', 'voducduy50@gmail.com', 'voducduy50', '10ab2a612fe89b66f0bd5fc4f1cf75f09bae38040d6ec7ecbe621f4d37f74b33', 'fe1469ec75a0e85932a19680ebbff8c7', 0, '/parkingbuckets/1745292156955129139_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 03:22:36', '2025-04-24 06:26:40'),
('735be44c-8d88-4fc2-9f28-595275779217', 420904946, 'TC_phanthanhdanh', 'Phan Thành Danh', 'phanthanhdanh@thaco.com.vn', 'phanthanhdanh', '69e340e169a276062065002c47f8e301ffb121aa92d6962747668d6fb29b3ec0', 'be6d635bd60eec574807d6601a8db743', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:13:24', '2025-06-17 09:13:24'),
('78e9d9d1-5732-4df8-bb2a-64644d35972f', 519066249, 'TC_phamminhson', 'Phạm Minh Sơn', 'phamminhson@thaco.com.vn', 'phamminhson', 'a781fe4c784015a3c23108ab1f93e46bec7bb409de46a05e6a5df6d4498036f6', '49bc4f2c32b28879563ec619bf129bd2', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:44:21', '2025-06-16 07:44:21'),
('7bc69de4-abe5-47b9-9a64-16e19aaa64e4', 707809724, 'TC_voducduy31', 'voducduy31', 'voducduy31@gmail.com', 'voducduy31', '3937bbd2e5bea7a6464ac094606b59d86557107edb886ebb4faa3f1b83fbc864', 'c9b5275028fc07e6ed5388bd44a92923', 0, '/parkingbuckets/1745305796477877096_car2.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:09:56', '2025-04-22 07:21:36'),
('7befb4be-ac7c-4400-9fcc-780e76e81933', 1280022091, 'TC_Phan Anh Tú 2', 'Phan Anh Tú 2', 'phananhtu2@gmail.com.vn', 'Phan Anh Tú 2', '54998bb267284c7430002c4ca40b848c05bd7b010dad46e700936f6faf26b78e', 'cf21e0f74ef5da441074fbe08215dc18', 0, '/parkingbuckets/1749537837338104771_office-man.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 06:43:57', '2025-06-16 03:27:09'),
('7c18040f-2b12-48c5-ab59-8c01ae056d92', 1292827062, 'TC_phamviettra', 'Phạm Viết Trà', 'phamviettra@thaco.com.vn', 'phamviettra', '9c6be9b2215e17e3bd7aa18f015f4f4e2c48d2aabaa094286a2015cf69d7e47f', 'bbb6066dd7deb50b4cd8c20d1df2a23c', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:49:42', '2025-06-16 07:49:42'),
('7eb86c7b-7200-437d-b80d-9a801a36e9b2', 1798060614, 'TC_voducduy83', 'voducduy83', 'voducduy83@gmail.com', 'voducduy83', 'e32d53285d0b3ee02a42b5c0a7cd53b1837cab13611dc4dfcfa648cc8dfa902e', '3d9a03c27c69fc52b0918884f943ede8', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:21:45', '2025-04-24 03:31:32'),
('866400b4-566c-4ed0-9c57-47747929ba83', 1034642605, 'TC_voducduy18', 'voducduy180', 'voducduy18@gmail.com', 'voducduy180', 'b4a6f2e04f5845b98eb18e729f7e84467292ed26195ff5c1e24275962d71c54b', 'a8e92ba73a07364ef63f818adace9934', 0, '/parkingbuckets/1745051636423334638_z5838819445523_3c28af0d374623829b77b9bbaa9678b9.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:33:56', '2025-04-24 03:40:24'),
('872ab326-b40b-4fb7-b28b-c5f8157fea7c', 457262737, 'TC_ADMIN', 'Admin', 'admin@gmail.com', 'Admin', '61870d2110c706703b709c1348759522e051e8bd25f2a5092df72756967713b0', '4c724d523767fd7b19a89b46d68d9c33', 1, '/parkingbuckets/1749103327039256838_Parking App Logo with Vibrant Background.png', '', 0, '2025-04-18 08:10:35', '2025-06-05 06:02:07'),
('899b82fa-56ed-4ab6-b278-164d84906958', 830385737, 'TC_voducduy33', 'voducduy33', 'voducduy33@gmail.com', 'voducduy33', 'f681438dfa384904c0346fc5d5161182eba6759e320df728b218d256ea8ddbe2', 'd6df615db473992bf1f8b479e7654987', 0, '/parkingbuckets/1745306526881769724_tuyenAI.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:22:06', '2025-04-22 07:22:46'),
('89a79beb-4d6e-41fb-8af4-41cc37898601', 904750120, 'TC_voducduy6', 'voducduy6', 'voducduy6@gmail.com', 'voducduy6', '3d3731cbf956839add4ab459f9a77c67267d83c0e006a31b5275f9d9b53558ab', 'b1aa7070f26e3eedc200d146d0df7b4f', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:14:47', '2025-04-28 02:41:59'),
('8a93524a-0657-4efb-95d9-8a0b5ebaf9ac', 942045955, 'TC_voducduy157', 'voducduy157', 'voducduy157@gmail.com', 'voducduy157', 'de760629e104e20d84905735eab37e15317aea3d6294751c56c64ca3ef077204', 'a638c2c1c9814519d29061836f1f7c88', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:57', '2025-06-17 03:48:57'),
('8be526da-266f-459f-81ed-dacb5f003595', 311297467, 'TC_voducduy153', 'voducduy153', 'voducduy153@gmail.com', 'voducduy153', '9d1917bc4374ef983bf0bbb3fd6c649961bfb1f321b602735f98c9cbbf849092', '8cfff4db0311da03a22e5f3f54202f98', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:28', '2025-06-17 03:47:28'),
('8e9aecdf-a051-4f7c-ba86-2d300764424e', 242896604, 'TC_voducduy159', 'voducduy159', 'voducduy159@gmail.com', 'voducduy159', '74968055904eb902e16896b501771cff71452f1a0e8356cfbbb420173862c754', 'b5a018fcae6054518d34b4d48eb5cf21', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:49:51', '2025-06-17 03:49:51'),
('8e9b4ae3-8583-4c9e-ba05-b4c8bf1ba568', 72929118, 'TC_voducduy15', 'voducduy15', 'voducduy15@gmail.com', 'voducduy15', 'f8e3bedf4fc4d5d1a9885423fec6c05f24779c60333c07b347500b9e2180637e', '9d85ef1923d027d7143af63437dc9d6d', 0, '/parkingbuckets/1745555118055655562_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:25:18', '2025-04-26 08:07:01'),
('90329dcb-d3d2-4217-9d7e-c7abbbf2b8d8', 1967301260, 'TC_voducduy165', 'voducduy165', 'voducduy165@gmail.com', 'voducduy165', 'f1d71d6fa8bafe1b58b15c7a5a7c203b8d1e61ba97971705383c6595c8c14f3a', 'f41cfee2445a49ab50ca6b5691a5b228', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:52:02', '2025-06-17 03:52:02'),
('960753ea-1b0b-428b-992c-f77bc27d5d45', 1497860467, 'TC_ADMIN', 'voducduy34', 'voducduy3@gmail.com', 'voducduy34', 'e4d9a175089a18bfa4afaab7cd1c586ffc6e37283e33e4826fcc4dbeb85c8b75', '622dfb5165b652e08b13cf690eeb3f2f', 0, '/parkingbuckets/1745291382832538192_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:02:16', '2025-04-24 06:27:04'),
('96dbff7a-df9b-420d-9b95-f33fc24d4ab4', 1128502137, 'TC_voducduy1001', 'voducduy1001', 'voducduy1001@gmail.com', 'voducduy1001', 'c9237e5d6205f66825ba67086c1c72ef1bb1db2b58382fc1f380fc0fded780f9', 'c5b3c9d5e9e689fe91cb6869e1ed3183', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 03:50:03', '2025-06-16 03:50:03'),
('98874a38-460d-4e7b-a22c-7b24d6ef3b1c', 1813906722, 'TC_voducduy21', 'voducduy21', 'voducduy21', 'voducduy21', '51acec9523c4adbfe578e4030ca3d2c9b390970e971dec1b990255695d0949a5', '5a5389fc34c4d15816432d5a6d71093b', 0, '/parkingbuckets/1745051736727272862_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:35:36', '2025-04-22 06:22:37'),
('9aa619cf-db2b-4662-adc4-28fd79ef2155', 283126043, 'TC_voducduy164', 'voducduy164', 'voducduy164@gmail.com', 'voducduy164', '225d1873dc91dfeb6e84d3f9193ae229c14c6c2b377d5dbf2a88e54ed77dbabe', 'cd29005dee123e560212e5d054422a80', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:46', '2025-06-17 03:51:46'),
('9c6501a0-16e9-498b-9ed6-166e3a13500f', 1978501733, 'TC_tranbaphuc', 'Trần Bá Phúc', 'tranbaphuc@thaco.com.vn', 'tranbaphuc', 'd0cfee90b0d317344464c61f76de086c961740ffaa4d9d11906947ffea74eb52', '30dcb93fe19e5aff35e3529019b15008', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:12:23', '2025-06-17 09:12:23'),
('9c674cf3-fdb2-4147-ac66-c3da8ed82dc0', 820538454, 'TC_voducduy14', 'voducduy14', 'voducduy14', 'voducduy14', '4bee456674df9c141064dfe2904743adac25aee2245fbabc87cea83a80230ed9', '45eb27f6dcacd14a800ad5485b6ab7ea', 0, '/parkingbuckets/1745555080847636613_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:24:40', '2025-04-25 04:24:40'),
('9cf8ede8-8c8e-4628-a590-591e7957375f', 1865500949, 'TC_voducduy9', 'voducduy9', 'voducduy9@gmail.com', 'voducduy9', '5eeb43a810a3de818dc466367a3984bb9b9bf138a9c3a4635ede99b405f92bf0', 'f401181677974aad50e4153304125d38', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:16:17', '2025-04-25 04:16:17'),
('9ec6622a-9a8f-4f0b-a07d-af23a8682e67', 762492066, 'TC_nguyenvana', 'nguyenvana', 'nguyenvana@gmail.com', 'nguyenvana', '952af32ce6b43498e51fcf005118d8c930573078e20f0b470b93d398d89b3a5c', '49ffbe7d4b40e3e357dabe7834fd3d3e', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 06:32:00', '2025-06-16 08:59:32'),
('a0476bbe-0c86-4b6c-b588-6150eacc1ab4', 627011497, 'TC_voducduy4', 'voducduy4', 'voducduy4@gmail.com', 'voducduy4', 'a375a74c25801c7396fb34772910495c2b259e21d2b77faa207674df03530831', '0c29a20e5a2dfc2b16461f075db69f3e', 1, '/parkingbuckets/1745554427240274133_VoDucduy_aokysu.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:13:47', '2025-05-28 08:08:26'),
('a0ec2050-1702-4b3b-9dcd-8d39fedf9fdd', 1000161177, 'TC_vo duc duy 102', 'voducduy102', 'voducduy102@gmail.com', 'vo duc duy 102', '54313913dc0dcdcc6a4654d828ca5d42a857fa1fe4cee678e2aa1ac631b3097b', '401421b3eb88f8ab8be1f19f4cf53e5a', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-11 01:41:30', '2025-06-11 01:53:36'),
('a3aad319-6ce4-4a5d-8834-7d44a1e7f8d3', 2067871298, 'TC_voducduy43', 'voducduy43', 'voducduy43@gmail.com', 'voducduy43', 'bb2f345da28322979319831065f242137fa97c5ec43a3d979e9bbd4e412e352a', 'eb133f6dca505d4d9dc650364748fa05', 0, '/parkingbuckets/1745307966176253977_Kubenetes Architecture of ChatbotPlatform.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:46:06', '2025-04-23 06:19:30'),
('a55d5946-f864-4b57-aa5e-d3e8d4c1d712', 2093416489, 'TC_ADMIN', 'voducduy6', 'voducduy6@gmail.com', 'voducduy6', 'c3fc4d1bef4215eabd00e0d54f10c269070ea45ac7973584942d503b35909ebf', 'a6f48873e3dc5a0c5461092e05f89c64', 0, '/parkingbuckets/1745035242850917175_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 04:05:02', '2025-04-24 06:30:31'),
('a6ea1ced-3b49-4ff5-b5f6-667660dc71c8', 1594649032, 'TC_voducduy32', 'voducduy32', 'voducduy32@gmail.com', 'voducduy32', '8629cb7bd756a6bc4451b9ed63cdeea4792a54399c40bcaa0f8f4d5c0559d535', 'd7d1467db30a818481256cfdd7a61810', 0, '/parkingbuckets/1745305835295488835_z5838819445523_3c28af0d374623829b77b9bbaa9678b9.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:10:35', '2025-04-22 07:22:46'),
('aab0b916-7465-4dac-b383-032fda093d58', 1264669850, 'TC_voducduy38', 'voducduy38', 'voducduy38@gmail.com', 'voducduy38', '44655a973cb99bdd71651915776eda54e9cec8d885518088d06270855d79f3f9', '6b0f724c1dae8a970e1f00f1fe0d71ba', 0, '/parkingbuckets/1745307807812033905_car2.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:43:27', '2025-04-24 06:19:25'),
('ad0fd441-5ced-4d99-960e-2cb1d883bcbf', 9134291, 'TC_voducduy10', 'voducduy10', 'voducduy10@gmail.com', 'voducduy10', '12298738bb90ac0e92dbba260ae5a7c4c68dcaf959919f849d60fe43f650e4f9', 'c3c96ef8bb33ea1d14342e049aeaa42a', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:16:41', '2025-05-06 01:26:15'),
('ad705a7d-53a4-4737-83ae-3d73f7b5620f', 429159475, 'TC_trandaithang', 'Trần Đại Thắng', 'trandaithang@thaco.com.vn', 'trandaithang', '0ffa12c1e816c846e0bf9e5f6377da0dc714b128c899c1185536b1b734524778', '67c1711cb8d6fdc80f620bab19c81c5e', 1, '/parkingbuckets/1750058386428335530_bg_remove_logo.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:19:46', '2025-06-16 07:19:46'),
('b0220e99-79e0-499e-abce-97789b70a149', 1375338557, 'TC_voducduy30', 'voducduy30', 'voducduy30@gmail.com', 'voducduy30', '4b8cf198019dbca9a7d28fb4a922b39237ef9405b2cb2dfee10c8899c467c3d9', 'e86062980d733dcdb244b8000c7f54ab', 0, '/parkingbuckets/1745296171311431927_VoDucduy_aokysu.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 04:29:31', '2025-04-25 04:10:58'),
('b2cf5b58-2603-4f57-8831-1454e9558b74', 1095383154, 'TC_voducduy42', 'voducduy42', 'voducduy42@gmail.com', 'voducduy42', '932b0745437cf0934e871b685607bee54deb799cfd5a8ff3b57b34da7275eed3', 'dc37c4ed67f392d495e04dcd7b5f3bdb', 0, '/parkingbuckets/1745307916460221369_car2.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:45:16', '2025-04-25 04:10:58'),
('b44e54bc-cc9e-4c78-b5c2-e8569b32a4b7', 1925680265, 'TC_voducduy2', 'voducduy2', 'voducduy2@gmail.com', 'voducduy2', 'c62b224cbe32ae13709c265b47a97cdd78670229bae9865ee351109e8773cedb', 'c1fd616ea9e79a1840d6c8bcea3b9943', 0, '/parkingbuckets/1745484936298676365_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:55:36', '2025-04-24 08:58:01'),
('b50f3f56-fcad-4592-b688-b31f3fe3cb0f', 2048624477, 'TC_voducduy1', 'voducduy1', 'voducduy1@gmail.com', 'voducduy1', 'c754ec46f5f7b86ed6b2c61781ed8d8fedee75efa8141092fee0ea07a7274563', 'c66f89a9bf9cb3aab1f590daf805c30b', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:20:56', '2025-04-26 01:13:10'),
('b6fc0fd2-dad8-499e-b704-f0d85fc47af4', 1530201165, 'TC_nguyenquangtrong', 'Nguyễn Quang Trọng', 'nguyenquangtrong@thaco.com.vn', 'nguyenquangtrong', '6eab84ddf27e8f0daa06893ac81926e51f8db71f71923f1423b15cef22c87d44', 'd782cb03a4cf23f5d4896b445b7c1b33', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:12:53', '2025-06-17 09:12:53'),
('bae84c78-3af7-4bb5-b7f6-1c56f4d76a8c', 748497518, 'TC_dinhngochuy', 'Đinh Ngọc Huy', 'dinhngochuy@thaco.com.vn', 'dinhngochuy', 'ab52a059e2eb789a9106b9e863c5dc1ba0fa91e5cb23598d410a47a6a484899d', '4edb22068f706da1adf06cee03f4f968', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:46:33', '2025-06-16 07:46:33'),
('bb52488a-0c53-47d2-b0a1-ce86ad39f328', 1889840357, 'TC_voducduy10', 'voducduy10', 'voducduy10@gmail.com', 'voducduy10', '75a66c8310e58a9702a9c539595627ff664b52b5d765193b95512f6e7e455c3b', '32f70503d31076bcb7542d98f86b9e79', 0, '/parkingbuckets/1745046193278864212_car.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:18:22', '2025-04-22 06:37:27'),
('bd3cfdf3-d23c-4cbc-8b0e-ec7b95a783bc', 1617174633, 'TC_voducduy82', 'voducduy82', 'voducduy82@gmail.com', 'voducduy82', '00a97702e8bdaa86014c4f4540f10efa878cebe15cda7e48882c94f60e35efb6', '2fb7d59a836d27cf308229da3287de78', 0, '/parkingbuckets/1745464870547401857_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:21:10', '2025-04-24 03:43:39'),
('bde27c39-6817-4320-b4bd-22f018dc4911', 441873205, 'TC_voducduy21', 'voducduy21', 'voducduy21', 'voducduy21', 'd11e1806cf8e99f10d58711aa693cbdd799c80153385dfac44f73227fab14705', '740ca3d770bae32f0f5f5b7c316f9618', 0, '/parkingbuckets/1745555259265836673_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:39', '2025-05-05 09:26:26'),
('be0e6158-053b-4c89-93b2-ae7a453e96dd', 93472434, 'TC_ADMIN', 'voducduy2', 'voducduy2@gmail.com', 'voducduy2', '7257e292009e989172ac37b7bec55f843265d3a68819c4ce72d9ad7ea9f16c7f', 'c49db8ebeaad3c71ac95ffe5db0c0d8d', 1, '/parkingbuckets/1744959947895940575_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:01:45', '2025-04-22 03:42:54'),
('be4668d2-8c84-4327-88e1-b885ada6d612', 1709673143, 'TC_doanvanxuankhoi', 'Đoàn Văn Xuân Khởi', 'doanvanxuankhoi@thaco.com.vn', 'doanvanxuankhoi', '443cf50de7dd665617b01aba8430dbe4826c029aed0cbab5181886daeac69453', '0a2ffcd3b5a5c1d8a20b4a8e564b336d', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:08:42', '2025-06-17 09:08:42'),
('bfc4c186-2aeb-4d41-9b88-6181908b8a4c', 381416779, 'TC_voducduy11', 'voducduy11', 'voducduy11@gmail.com', 'voducduy11', 'b93487d2a05c6caf44b6b46b46e6f80478d35837a3ae711ee4b805b83946bff3', '4ed87a7bc656aa7f2c9328f3fe976da3', 0, '/parkingbuckets/1745048075052227609_car.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:34:35', '2025-04-22 03:35:45'),
('c08266e1-49a5-4926-9076-9bfee4afa8a0', 1230226560, 'TC_20250618035913', 'Đinh Thị T Linh', 'dttl@thaco.com.vn', 'dttl', 'c8113286bc0dd7dd3532046fa429b6230f69339eb66c9d9bbece19cc24654411', '469c110588be78bea7d84d04d6dc6341', 1, '/parkingbuckets/1750219153248597080_parked-car.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 03:59:13', '2025-06-18 03:59:13'),
('c0c99db9-1f65-4801-b52b-88502a073f41', 2082246802, 'TC_ADMIN', 'voducduy5', 'voducduy5@gmail.com', 'voducduy5', 'aaf5431de48e09c723aeb2f266f4a776fbe309b2df194039ec3a7907bf962446', '33d3975953406d143d1869f38b7fa40f', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 00:50:11', '2025-04-24 08:58:01'),
('c19b546a-0e28-4785-8c50-2e0f55a0f7f7', 252254, 'TC_voducduy81', 'voducduy81', 'voducduy81@gmail.com', 'voducduy81', 'fe0b913d56193581d00551af0f77b617b27efe7d45ef2b04c3e09bb3795cdf21', 'efd6238aae97dfb838e41a6b885a43bd', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:20:26', '2025-04-24 03:32:12'),
('c3f23273-67be-4500-9204-299d6f8ecafc', 583659630, 'TC_voducduy180', 'voducduy180', 'voducduy180@gmail.com', 'voducduy180', 'b1baa10309fb404e79fc381f8d2d6432a77862e2c5e05708ad9d4c8c6ccbde0e', '51c179be70a6d06d0b7627a9b270c624', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:43:15', '2025-04-25 04:10:58'),
('c427c410-8cc2-4a0c-9cbf-58a45ea24ecc', 643573388, 'TC_voducduy70', 'voducduy70', 'voducduy70', 'voducduy70', '209eebca51588d47a87daa981e09cbafc28eb9bbdb2711e4a79dfbed6251162c', 'c61a0607ce1976d9d4e8f5435d2fff20', 0, '/parkingbuckets/1745304293713619954_tuyenAI.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 06:44:53', '2025-04-22 06:47:12'),
('c55a3235-30ac-47dc-ba3a-29773dc99ccf', 27470585, 'TC_voducduy41', 'voducduy41', 'voducduy41@gmail.com', 'voducduy41', '4a0a97960d419ba63a1e0d12346a3ffa6d54c5d8d4367766d7ae43219fc31a38', 'c2831481dcbe8b21e931d0b2b3b1fd85', 0, '/parkingbuckets/1745394776243593421_VoDucDuy22081053.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-23 07:52:56', '2025-04-24 08:54:57'),
('c6150d5a-9f1d-4417-bb78-d75c11d0fa1a', 1984230809, 'TC_ADMIN', 'voducduy1', 'voducduy1@gmail.com', 'voducduy1', '0eb74b8a5866e23ea3d931c7c49a29915c5ab60ab32f59158e7781c979d1d28a', '3de2a575fea6ee30b8062dd335b0cec8', 0, '/parkingbuckets/1744959947895940575_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:00:47', '2025-04-22 03:57:11'),
('c6b0da46-f6b2-4e77-9786-9ab955295cea', 2123410007, 'TC_voducduy39', 'voducduy39', 'voducduy39@gmail.com', 'voducduy39', 'be7f46e203ff68528fb9de4b99cd918b76856ab46ef96a01e555a0ba49f73472', 'f8603c76d4729779523bc1bdc82ace38', 0, '/parkingbuckets/1745307837986777418_z5838819445523_3c28af0d374623829b77b9bbaa9678b9.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:43:58', '2025-04-24 06:21:04'),
('c84936e0-0936-4d38-8a09-490d1b6b2968', 770089759, 'TC_voducduy8', 'voducduy8', 'voducduy8@gmail.com', 'voducduy8', '30944756e500722a54189f1faa1f890055e64326a6b58f74d6fe1e7a0a6dc795', 'd9277b38287d93af7263ca8ae614db6e', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:15:52', '2025-04-25 04:15:52'),
('c94f3915-f516-46aa-85d8-74edd6169ac7', 242247588, 'TC_voducduy163', 'voducduy163', 'voducduy163@gmail.com', 'voducduy163', '562558384c827eeec9d2d78c8b940578d36051bb43c9cc8b0c3a7bf808f4818c', '0a99fbe7f6a4aeead5a4fb19af106cd7', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:26', '2025-06-17 03:51:26'),
('d55c17bf-128c-46aa-9e2e-1e7292ec5684', 767489769, 'TC_voducduy17', 'voducduy17', 'voducduy17@gmail.com', 'voducduy17', '1b523f706c7d4a9fbd6dacb73020a84c370f6fc0b35d7f2a603c667c6507754d', '93ed3ee5712da5292eae91418ab82128', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:26:27', '2025-04-28 02:41:53'),
('d90128e6-afae-4a64-8282-25990f2759ba', 1084685447, 'TC_luongvanthanh', 'Lương Văn Thanh', 'luongvanthanh@thaco.com.vn', 'luongvanthanh', '2a795646b12aa1ac0e2157ce5621d6e2d16b292dccfe9ce62c91cc6fe8aa8c46', 'eba474bbd982b0fdc15ed25b7837312a', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:07:13', '2025-06-17 09:07:13'),
('d9741a29-1eb1-4830-ba49-41893494257f', 829308189, 'TC_voducduy1000', 'voducduy1000', 'voducduy1000@gmail.com', 'voducduy1000', '53b33b350e042fa3b3e27f03fe90d5b18b30c3e62b05f09be9cdd80f43409897', '6ce4fa5a544046bd4e77bc9b4cf4781f', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 00:51:44', '2025-06-16 01:04:04'),
('db566cfb-49c3-4140-b3e5-dda8109cbd2f', 219450941, 'TC_voducduy19', 'voducduy19', 'voducduy19', 'voducduy19', '4f539089e38697b92081fee4ea5de17a3328990816d4ce5c07117e107e6c598b', 'b5bf5be5b5c892cbba773fc5fb02f3ca', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:02', '2025-05-05 09:26:26'),
('dcd583f7-f983-48e9-813a-ad074ba549b3', 1235355876, 'TC_test02', 'test 02', 'test02@thaco.com.vn', 'test02', 'd79f6c1d24b319aa4f3f5a85e45600a258e95965363ec8fa72badb06cd86d741', 'd78b23fe88b2d6471c3e25636a07557c', 1, '/parkingbuckets/1750209005689464205_1ed70d510c4b09b82d1930792e6510a5 (1).jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 01:10:05', '2025-06-18 01:10:05'),
('dd66b5f0-2f50-4f6a-9208-e7ea73b3d5f2', 1994990592, 'TC_voducduy12', 'voducduy12', 'voducduy12@gmail.com', 'voducduy12', '7f5b4003b7dbaef035c3a55bf9511128a520e25c981c0bcf19f4f8bcc2df9fa4', 'b25a8bf073a56a45261899eb96418d19', 1, '/parkingbuckets/1745554662785502926_VoDucduy_aokysu.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:17:42', '2025-04-25 04:17:42'),
('e21c496d-b705-400a-b5cc-56ecf6917d41', 2004287380, 'TC_nguyenhuuthanh', 'Nguyễn Hữu Thành', 'nguyenhuuthanh@thaco.com.vn', 'nguyenhuuthanh', '613a25f6251def95b0f06b27cd40163275a9b8fe01625100caa3244e9b34224a', 'a5b406f8d9f4ed3b921a39764817cedd', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:06:15', '2025-06-17 09:06:15'),
('e2fac57b-18c8-494e-9682-f536070f4b3c', 1782285630, 'TC_phantrongvinh', 'Phan Trọng Vinh', 'phantrongvinh@thaco.com.vn', 'phantrongvinh', 'a62f0c005b9044e10f0278129470396ed3ddb4d61160c548ed8691b5e0ce463e', '84b6c4eabe283e0b17c42c4fc0df2c4b', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:07:47', '2025-06-17 09:07:47'),
('e4eeaac1-29e5-4a77-bf5f-d11c56f71242', 883960630, 'TC_voducduy101', 'voducduy101', 'voducduy101@gmail.com', 'voducduy101', '31f4cd871ea532723b2cd13ab0725627d191271f053cbfb59235c6d26a41a363', 'b5672f6887aab6cd5869fa1010476aa1', 1, '/parkingbuckets/1749280987781910247_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 07:23:07', '2025-06-07 07:23:07'),
('e522c95e-0b47-4fd3-8d0f-c76b59830868', 806309206, 'TC_Phan Anh Tú', 'Phan Anh Tú', 'phananhtu@gmail.com.vn', 'Phan Anh Tú', 'c690121ed6907545a2b3e69bd4d8b6ae7d0ff1589571057df48c5036c6a3f80d', 'b0510caadc70512441c395b22de8c093', 1, '/parkingbuckets/1749534935729963218_Screenshot_44.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 05:55:35', '2025-06-10 05:55:35'),
('e5cca269-49c2-4b92-93da-d450baf26b67', 1565725463, 'TC_voducduy3', 'voducduy3', 'voducduy3@gmail.com', 'voducduy3', 'b411a398e26935a3e83fc181a71ab67a2b7436d0254aad9ccc71133c3c5849c7', '4dd7dc8dc750f31a7cd093744be11824', 0, '/parkingbuckets/1745485144159379788_VoDucduy_aokysu.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:59:04', '2025-04-25 04:10:58'),
('e6cd7a36-7fba-44c0-9757-506f6e8fb095', 306627277, 'TC_voducduy82', 'voducduy82', 'voducduy82@gmail.com', 'voducduy82', '90f52c845e533ed5ebf122e304fc7c409754ddc33c502842572d660d5a6fe22b', 'b3d789a9e741b65e4a60f1af29754ec7', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:44:05', '2025-04-25 04:10:58'),
('e8d9c909-710a-4543-a042-f41bfbe27197', 1043531580, 'TC_voducduy102', 'voducduy102', 'voducduy102@gmail.com', 'voducduy102', '92eb6e6f3abbf214ebc3bb8ed4dd9cfbba8ced8b711e03404bf1130b12ce0804', 'f1348713b15b3a5b7990d04c89b3154b', 1, '/parkingbuckets/1749607276403045639_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-11 02:01:16', '2025-06-11 02:01:16'),
('eab68f56-ec1f-4804-af4a-c0bbaadba1f8', 1931016179, 'TC_phamquoctoan', 'Phạm Quốc Toàn', 'phamquoctoan@thaco.com.vn', 'phamquoctoan', '11727fee03b3abfb3a644e48d20cf7312a09c1620be99947d0ae790b32693f71', '2211b15807ba57cad83e009ba41a613f', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:42:11', '2025-06-16 07:42:11'),
('ecd5f5a6-6a3d-4865-a48e-d5b689d19026', 1536851860, 'TC_dangbahung', 'Đặng Bá Hưng', 'dangbahung@thaco.com.vn', 'dangbahung', '70a41a820ff2492fd4890f4fdfce0c0fe5d0968ce6599d2b4f5db702cb674f96', '681e6ef215035dea52c76d48f04ca130', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:10:48', '2025-06-17 09:10:48'),
('f12e29f5-653e-4d8f-9570-73e7422df3fb', 1937212122, 'TC_nguyencongphong', 'Nguyễn Công Phong', 'nguyencongphong@thaco.com.vn', 'nguyencongphong', '761ed419b5adad170246f9a10372d98a22b0d3494d86b988b7ad1a63ebd8371a', 'f486e25d1cde4758dd92c37065561605', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:43:13', '2025-06-16 07:43:13'),
('f25d2ef3-565b-40db-a96c-413b56f1eb79', 1642868979, 'TC_tranthequang', 'Trần Thế Quang', 'tranthequang@thaco.com.vn', 'tranthequang', '0cc3e680e5af93b50f75c35e034c98aacb14e6421c8cee6d4c3bccdde89b1855', '07660bd06b88f5ec6116023b125f5fd2', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:49:10', '2025-06-16 07:49:10'),
('f2e9da12-6096-40b0-98d9-333989ef4d34', 1630195139, 'TC_voducduy160', 'voducduy160', 'voducduy160@gmail.com', 'voducduy160', 'f30629699ca56c946de889937c5bed133fa6189ed3d33dd19f6ea801f82de0a8', '9c4ee79b2ea3935558508ee806243c20', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:50:09', '2025-06-17 03:50:09'),
('f3d18bc2-aea3-4967-a371-449c5df3ed7d', 1206329133, 'TC_voducduy17', 'voducduy17', 'voducduy17@gmail.com', 'voducduy17', '44f3117c3889cf39055129de86255378260af5d474957db3247cea3554c5ff3c', '93b225074a94c584d59a61bcc558ccf4', 0, '/parkingbuckets/1745388889960121123_tuyenAI.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:33:17', '2025-04-24 07:00:40'),
('f5123d64-ce91-4e52-bf08-c716862c4a51', 21423387, 'TC_hello', 'hello', 'helo1123@gmail.com', 'hello', '3ba45f45167ec5fc716e8b4771e7f7cf52a0efe34190c82b0d7dc819b5619c97', '80f0754befae88e9b559d079c05bba5b', 0, '/parkingbuckets/1745041155865836517_bill1.png', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:24:02', '2025-04-24 06:27:04'),
('f5224238-08e1-4d0a-bf34-4e99e1c7ad23', 1753751866, 'TC_voducduy104', 'voducduy104', 'voducduy104@gmmail.com', 'voducduy104', '384951d8bd833cd887518f08564b69184d8d9caa998dfbf3b524f38c69830a35', '659f3e0a8b973f12dc0e72e25cd3c90a', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:06:01', '2025-06-17 01:06:01'),
('f52747c5-3219-4168-9c7f-25c268114328', 2146487544, 'TC_voducduy152', 'voducduy152', 'voducduy152@gmail.com', 'voducduy152', '96d53c4910496bb07ee186ae6056b0eeda5362c4644bf2d982a40667682c9005', '678e5da3e2d549b7420c98738d372bf1', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:06', '2025-06-17 03:47:06'),
('f68653a6-12a9-4fee-b8fc-f61e9a707c80', 1121401769, 'TC_voducduy20', 'voducduy20', 'voducduy20', 'voducduy20', 'c510fb6331473280e54ae81ba25a48af03ac957aa027bb85f13bc9ed9c8e2d7a', '74288ec396b8f5c97feaaed0dc9476c0', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:14', '2025-05-29 09:11:39');
INSERT INTO `account` (`id`, `number`, `code`, `name`, `email`, `username`, `password`, `salt`, `status`, `images`, `created_by`, `is_deleted`, `create_at`, `update_at`) VALUES
('f7807f48-20a5-4e40-afc6-65f7b230a3c0', 13120027, 'TC_20250618031628', 'adddd', 'ad@gmail.com', 'ad', '6d772ef798fc572bc23b25f7ef74fc0e5c6e2c1b11d9622d3a8e50e7b6fa0279', '3b9c9770d2ff0596ff9c7cf6ae1182fc', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 03:16:28', '2025-06-18 03:24:01'),
('f8bbd8e2-9592-45dc-9bef-ec20e146b3c0', 226434690, 'TC_DinhthiTrucLinh', 'Đinh Thị Trúc Linh', 'Đinh Thị Trúc Linh', 'DinhthiTrucLinh', 'dd5f563c02a76013ae194f9d7119084ceaacfe28674fea27065588a040192e0a', '2ed863f6165f17ecf098d84aad4ce208', 1, '/parkingbuckets/1749882062479539860_1-hinh-anh-ngay-moi-hanh-phuc-sieu-cute-inkythuatso-09-13-35-50.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 03:49:20', '2025-06-14 06:21:02'),
('f8f1789f-1ab3-425c-896c-2c90b09333de', 1579270437, 'TC_voducduy7', 'voducduy7', 'voducduy7@gmail.com', 'voducduy7', '48cc7bae326cc65715404a09a5e63d34c30c2a22c5f18cf7790de298a1caf3f1', '4fcceacd98da7f68dda673626f89899a', 0, '/parkingbuckets/1745554517096717297_car2.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:15:17', '2025-04-25 04:18:56'),
('f8f9a8ad-04d4-4893-b353-ec0549a407f1', 445478228, 'TC_voducduy31', 'voducduy31', 'voducduy31@gmail.com', 'voducduy31', '28653d07f0ecc9cc3d820629126f3c304ecca5df5a531cd14b7990acde0448e3', '62a15a3520a9b2b4c8341e5facb89765', 1, '/parkingbuckets/1746425626391271738_drinkCat.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-05 06:13:46', '2025-05-05 06:13:46'),
('fa255ae1-96e0-4264-836a-99e67bf73ad3', 1381698523, 'TC_voducduy15', 'voducduy15', 'voducduy15@gmail.com', 'voducduy15', '959a6bc985df757f0949a4c47bfef990766bf32a345949cc4586eddeb27da8c8', '471304ab60a65c16b32b24b7c45c6d15', 0, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:32:03', '2025-04-22 06:37:36'),
('fba16514-184d-4e4f-9968-675ce0d42352', 216661484, 'TC_phamquangcuong', 'Phạm Quang Cường', 'phamquangcuong@thaco.com.vn', 'phamquangcuong', 'f7527f07958db2fbd2cc59f061cc4abe01b4e18c8df4a745bbd48c92d3263190', '56c79a82ada4a65cf9e6169dd2d9f0b8', 1, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:46:09', '2025-06-16 07:46:09'),
('fbd9adcc-e766-498a-a4da-3a7ebbe9622c', 2126501808, 'TC_voducduy2', 'voducduy2', 'voducduy2@gmail.com', 'voducduy2', 'e537bbfcaced3109a19c8c700cb15b2cb1fa7c6d99bcdf03dc9ff11ffc477ba1', 'd2e7f0372304b04b6ccbb964b50dcbac', 0, '/parkingbuckets/1745554371594186007_VoDucDuy_aovang.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:12:51', '2025-05-29 03:17:12'),
('fc79be34-0b1d-45a1-a901-2e72c186917e', 321259717, 'TC_voducduy9', 'voducduy9', 'voducduy9@gmail.com', 'voducduy9', 'ac310af0f5a1d242def69f39f4bb47d0e4ffb59589c3a2c18dd8ba29312b7f17', 'bc8777130466b498afb46e02cc7241ae', 0, '/parkingbuckets/1745046193278864212_car.jpg', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:21:14', '2025-04-24 06:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `code`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
('02fd332b-a20f-4e62-8b7c-9c1275490c6f', 'TC_20250513021259', 'test10111rr', 1, '2025-05-13 02:12:59', '2025-05-13 06:53:40'),
('14bc21bc-ee6a-4387-a122-c6e5160d9393', 'TC_20250513014637', 'test11', 1, '2025-05-13 01:46:37', '2025-05-13 06:53:53'),
('158ec988-55c4-42a6-97bf-4dde83c4f8a3', 'TC_20250513070930', 'Nhà ăn RD', 0, '2025-05-13 07:09:30', '2025-05-30 02:13:10'),
('1683e426-f0a5-43a2-8c7d-6f9767a738f9', 'TC_20250616014839', 'Khu vực Tải ', 0, '2025-06-16 01:48:39', '2025-06-16 01:48:39'),
('1936f499-d9a3-4e3e-ab08-548b1d7c001d', 'TC_20250617014349', 'ABC', 0, '2025-06-17 01:43:49', '2025-06-17 01:43:49'),
('257cb040-2768-41bb-97e1-59ebb51ff1ad', 'TC_20250617014406', 'AVF', 0, '2025-06-17 01:44:06', '2025-06-17 01:44:06'),
('26a9bb4d-5299-48f9-87b9-b1063d411d95', 'TC_20250614082151', 'Khu vực bãi xe cơ khí2', 0, '2025-06-14 08:21:51', '2025-06-14 08:21:51'),
('38f89358-236f-433c-a1d5-528a38a8b46d', 'TC_20250513071727', 'test100', 1, '2025-05-13 07:17:27', '2025-05-13 07:36:29'),
('40dff2eb-64ed-4eb4-9432-a90661c02bb2', 'TC_20250513073623', 'Bãi xe Trung Tâm RD', 1, '2025-05-13 07:36:23', '2025-06-06 06:33:57'),
('41dc8bf6-b2c3-49e6-9eb0-5e7b1400c4da', 'TC_20250616014912', 'Khu vực nhà máy Kính', 0, '2025-06-16 01:49:12', '2025-06-16 01:49:12'),
('42433816-eafd-4608-ae0b-a25356d0ad2b', 'TC_20250606063336', 'Bãi xe cơ khí 1', 0, '2025-06-06 06:33:36', '2025-06-06 06:33:36'),
('4c19227a-4e30-4358-b884-aa2887e3813d', 'TC_20250513073603', 'test11', 1, '2025-05-13 07:36:03', '2025-06-06 06:34:25'),
('4f42571a-21e1-4fbf-a7f6-dffa8a34f395', 'TC_20250513062109', 'test10', 1, '2025-05-13 06:21:09', '2025-05-13 06:54:00'),
('50345dc6-fe61-4a15-9e5f-7ce496d54dd5', 'TC_20250513042043', 'abc', 1, '2025-05-13 04:20:43', '2025-05-13 06:55:24'),
('5198cfd7-3495-4bb0-8267-72f2066f92ce', 'TC_20250616015040', 'test 2', 0, '2025-06-16 01:50:40', '2025-06-16 01:50:40'),
('5a159a40-5453-425c-8940-937efe2828c6', 'TC_20250513064311', 'ưerwerwer', 1, '2025-05-13 06:43:11', '2025-05-13 06:55:27'),
('5a2070a9-f097-4ba6-a023-7391b369ad9e', 'TC_20250611012721', 'test4', 1, '2025-06-11 01:27:21', '2025-06-16 01:49:46'),
('64c2eea6-1008-4e81-899a-dd4cb92cae6e', 'TC_20250611012710', 'test1', 1, '2025-06-11 01:27:10', '2025-06-16 01:49:48'),
('66e809a3-9f79-424d-83b5-5f24f1c48900', 'TC_20250513062926', 'tesst11', 1, '2025-05-13 06:29:26', '2025-05-13 06:55:29'),
('699a343b-4cd3-4fd4-b6d2-d67d7379b7f3', 'TC_20250513064231', 'ưererwerwer', 1, '2025-05-13 06:42:31', '2025-05-13 06:55:32'),
('6c3838d6-4d4d-460f-82a3-49f5a0a750c7', 'TC_20250614082139', 'Khu vực bãi xe cơ khí 2', 0, '2025-06-14 08:21:39', '2025-06-14 08:21:39'),
('6d6794d5-5347-49df-86db-732a9b2613b9', 'TC_20250617014359', 'BCD', 0, '2025-06-17 01:43:59', '2025-06-17 01:43:59'),
('6de9e0c4-ebae-4b18-8e99-1a5bae264252', 'TC_20250513055423', 'Nhà ăn', 1, '2025-05-13 05:54:23', '2025-05-13 07:09:20'),
('740ddfc5-03f7-4129-9e86-96fd0390877a', 'TC_20250614082119', 'Khu vực bãi xe cơ khí 1', 0, '2025-06-14 08:21:19', '2025-06-14 08:21:19'),
('78102d2d-7379-438a-8221-954012f6da36', 'TC_20250611012717', 'test3', 1, '2025-06-11 01:27:17', '2025-06-16 01:49:51'),
('79080860-927f-4244-a0a4-fa1367c6881c', 'TC_20250606063417', 'Bãi xe Trung Tâm RD', 0, '2025-06-06 06:34:17', '2025-06-06 06:34:17'),
('7f5c0edb-4091-469b-a717-a205fcec3ace', 'TC_20250616015101', 'test 5', 0, '2025-06-16 01:51:01', '2025-06-16 01:51:01'),
('84a898f4-865b-478e-8472-d00686dc947a', 'TC_20250513014555', 'test', 1, '2025-05-13 01:45:55', '2025-05-13 06:55:36'),
('88132a54-06c8-4b05-9e49-1557d91a98d9', 'TC_20250512072916', 'Khu vực trung tâm RD', 1, '2025-05-12 07:29:16', '2025-05-13 07:17:32'),
('895be6d6-2b6f-4972-afdf-2aef7f090925', 'TC_20250611012728', 'test6', 1, '2025-06-11 01:27:28', '2025-06-16 01:49:55'),
('8e031c76-705a-4fc3-bc2b-0f6fb5faecdf', 'TC_20250611012713', 'test2', 1, '2025-06-11 01:27:13', '2025-06-16 01:49:58'),
('8f0e8951-cca8-4f49-8c92-e3e322cb79ed', 'TC_20250513064241', 'sffsfsfsf', 1, '2025-05-13 06:42:41', '2025-05-13 06:55:39'),
('8f2eb505-148a-4f39-92a5-7b3fcbde5a6c', 'TC_20250617014412', 'SFDFDF', 0, '2025-06-17 01:44:12', '2025-06-17 01:44:12'),
('8f69de22-a865-4f1a-b962-13c65de44fea', 'TC_20250513020856', 'test1111', 1, '2025-05-13 02:08:56', '2025-05-13 07:07:21'),
('908612a9-394f-444f-8543-9842cb8f4338', 'TC_20250606074020', 'Bãi xe cơ khí 2', 0, '2025-06-06 07:40:20', '2025-06-06 07:40:20'),
('9656c5ab-e9f9-4442-9532-72824dcb09d1', 'TC_20250611024005', 'tesst111', 1, '2025-06-11 02:40:05', '2025-06-16 01:50:17'),
('978f604b-1454-4042-a6e6-c64e42e27ec1', 'TC_20250513073608', 'Bãi xe cơ khí 3', 0, '2025-05-13 07:36:08', '2025-06-06 08:09:52'),
('984a4578-5d44-41a0-9592-bd7b6c731aaf', 'TC_20250616014824', 'Khu vực Bus', 0, '2025-06-16 01:48:24', '2025-06-16 01:48:24'),
('9b1266cc-8608-4be2-9384-b3ba0291e0ca', 'TC_20250611012732', 'test7', 1, '2025-06-11 01:27:32', '2025-06-16 01:50:14'),
('a4b3022c-9a1b-4bcf-8cee-da63b6826464', 'TC_20250616015057', 'test 4', 0, '2025-06-16 01:50:57', '2025-06-16 01:50:57'),
('a7cb189d-cb70-44f9-9814-cd2cf4e1266c', 'TC_20250513062917', 'test10', 1, '2025-05-13 06:29:17', '2025-05-13 07:07:21'),
('a8d253a7-5523-49fb-9f21-083332b881af', 'TC_20250513020850', 'ssss', 1, '2025-05-13 02:08:50', '2025-05-13 07:07:21'),
('adf315d3-de8a-4390-a65a-4c6505e9b617', 'TC_20250611012724', 'test5', 1, '2025-06-11 01:27:24', '2025-06-16 01:50:12'),
('b4881e1c-4c72-4e7c-a7a0-1856c35ade79', 'TC_20250616014858', 'Khu vực linh kiện nhựa', 0, '2025-06-16 01:48:58', '2025-06-16 01:48:58'),
('bc44d2fc-7878-43ef-8cb8-7ba03dc412f4', 'TC_20250513064224', 'teajfgasfaf', 1, '2025-05-13 06:42:24', '2025-05-13 07:07:21'),
('d1f6d274-d3a4-4fb9-a432-bf87c8ee6e2c', 'TC_20250616015049', 'test 3', 0, '2025-06-16 01:50:49', '2025-06-16 01:50:49'),
('d575bfff-ead6-49ed-8b6f-40668eb122e9', 'TC_20250616015029', 'test 1', 0, '2025-06-16 01:50:29', '2025-06-16 01:50:29'),
('e1f3f415-1a62-42a3-9080-b2573b97a784', 'TC_20250513064215', 'test3288332', 1, '2025-05-13 06:42:15', '2025-05-13 07:07:21'),
('e47aaf05-98f8-4a8e-9faf-d189ed173d25', 'TC_20250513064246', 'fdfsfsfsf', 1, '2025-05-13 06:42:46', '2025-05-13 07:07:21'),
('e758cddf-39bf-4b96-92f6-28fbea6bd070', 'TC_20250617022809', 'Khu vực test', 0, '2025-06-17 02:28:09', '2025-06-17 02:28:09'),
('f3c32f83-984c-461d-aab8-445a8f27d308', 'TC_20250611012737', 'test8', 1, '2025-06-11 01:27:37', '2025-06-16 01:50:07'),
('f4e4213d-c0cc-4919-9bc6-eb52eda7e10d', 'TC_20250616014921', 'Khu vực nhà máy Khuôn', 0, '2025-06-16 01:49:21', '2025-06-16 01:49:21'),
('f5b2ddb9-5ef9-47b3-a333-19548c07d2cc', 'TC_20250513014831', 'test1', 1, '2025-05-13 01:48:31', '2025-05-13 06:55:42');

-- --------------------------------------------------------

--
-- Table structure for table `casbin_rule`
--

CREATE TABLE `casbin_rule` (
  `id` bigint UNSIGNED NOT NULL,
  `ptype` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `casbin_rule`
--

INSERT INTO `casbin_rule` (`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES
(4, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '', 'DELETE', '', '', ''),
(1, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '', 'GET', '', '', ''),
(2, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '', 'POST', '', '', ''),
(3, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '', 'PUT', '', '', ''),
(20, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/account', 'DELETE', '', '', ''),
(17, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/account', 'GET', '', '', ''),
(18, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/account', 'POST', '', '', ''),
(19, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/account', 'PUT', '', '', ''),
(8, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/api', 'DELETE', '', '', ''),
(5, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/api', 'GET', '', '', ''),
(6, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/api', 'POST', '', '', ''),
(7, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/api', 'PUT', '', '', ''),
(16, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/funcpackage', 'DELETE', '', '', ''),
(13, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/funcpackage', 'GET', '', '', ''),
(14, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/funcpackage', 'POST', '', '', ''),
(15, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/funcpackage', 'PUT', '', '', ''),
(12, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/menu', 'DELETE', '', '', ''),
(9, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/menu', 'GET', '', '', ''),
(10, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/menu', 'POST', '', '', ''),
(11, 'p', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '/menu', 'PUT', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_base`
--

CREATE TABLE `customer_base` (
  `id` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_base`
--

INSERT INTO `customer_base` (`id`, `email`, `password`, `salt`, `created_at`, `update_at`, `number`) VALUES
('09ae2a6c-408f-43e6-840c-0df6e28cecb8', 'voducduy@yopmail.com', 'a478b39625a5294b86c9e4c82d5355c7551d6d650f89c818da4d7b83496f5c67', 'b50f82397fe830587143297585cee4ca', '2025-05-13 06:30:58', '2025-05-13 06:30:58', 2012457610),
('49939008-56ad-441b-bd30-dcf277b44b05', 'duy1851999@gmail.com', '4be7e05af8b253902f7c61d7887f71f6452ea79f4350bed9aa0272ec4fe9c0a3', '3feba17a2a73c55739654d21111b13e9', '2025-05-12 07:43:38', '2025-05-12 07:43:38', 2122853903),
('cb62a8e3-9107-4588-9d97-11090f38a758', 'voducduy10@yopmail.com', 'df00c60257348d187b581e79bbaa6d393a0ee21485878c0524d33531a93f7f20', '1791d2faa8eaaaa9632d960ca920a58b', '2025-05-17 05:57:22', '2025-05-17 05:57:22', 1021420638);

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `id` char(36) NOT NULL,
  `username` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `state` tinyint NOT NULL COMMENT 'state: 0-Locked, 1-Activated, 2-Not Activated',
  `is_authentication` tinyint NOT NULL COMMENT 'Authentication status: 0-Not Authenticated, 1-Pending, 2-Authenticated, 3-Failed',
  `mobile` varchar(255) NOT NULL,
  `gender` tinyint NOT NULL,
  `birthday` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `payment_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`id`, `username`, `image`, `state`, `is_authentication`, `mobile`, `gender`, `birthday`, `email`, `created_at`, `update_at`, `name`, `code`, `payment_id`) VALUES
('2368128a-5d38-4348-88e3-69291822ca03', 'ducduy', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-05-12 07:43:38', '2025-05-12 07:45:52', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca04', 'ducduy100', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:30:49', '2025-06-17 01:30:49', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca11', 'ducduy11', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:32:57', '2025-06-17 01:32:57', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca12', 'ducduy12', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:33:42', '2025-06-17 01:33:42', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca13', 'ducduy13', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:35:05', '2025-06-17 01:35:05', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca14', 'ducduy14', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:36:00', '2025-06-17 01:36:00', 'Võ Đức Duy', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca15', 'ducduy15', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:37:14', '2025-06-17 01:37:14', 'Võ Đức Duy 15', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca16', 'ducduy16', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:38:01', '2025-06-17 01:38:01', 'Võ Đức Duy 16', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca17', 'ducduy17', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:40:42', '2025-06-17 01:40:42', 'Võ Đức Duy 17', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca18', 'ducduy18', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:41:40', '2025-06-17 01:41:40', 'Võ Đức Duy 18', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca19', 'ducduy19', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:42:30', '2025-06-17 01:42:30', 'Võ Đức Duy 19', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca20', 'ducduy20', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:43:13', '2025-06-17 01:43:13', 'Võ Đức Duy 20', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca21', 'ducduy21', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:44:19', '2025-06-17 01:44:19', 'Võ Đức Duy 21', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca22', 'ducduy22', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:45:03', '2025-06-17 01:45:03', 'Võ Đức Duy 22', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca23', 'ducduy23', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:46:00', '2025-06-17 01:46:00', 'Võ Đức Duy 23', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca24', 'ducduy24', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:46:38', '2025-06-17 01:46:38', 'Võ Đức Duy 24', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca25', 'ducduy25', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:51:18', '2025-06-17 01:51:18', 'Võ Đức Duy 25', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca26', 'ducduy26', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:52:26', '2025-06-17 01:52:26', 'Võ Đức Duy 26', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca27', 'ducduy27', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:52:59', '2025-06-17 01:52:59', 'Võ Đức Duy 27', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca28', 'ducduy28', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:53:32', '2025-06-17 01:53:32', 'Võ Đức Duy 28', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca29', 'ducduy29', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:54:23', '2025-06-17 01:54:23', 'Võ Đức Duy 29', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca30', 'ducduy30', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:55:16', '2025-06-17 01:55:16', 'Võ Đức Duy 30', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca31', 'ducduy31', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:56:24', '2025-06-17 01:56:24', 'Võ Đức Duy 31', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca32', 'ducduy32', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:57:01', '2025-06-17 01:57:01', 'Võ Đức Duy 32', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca33', 'ducduy33', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:57:33', '2025-06-17 01:57:33', 'Võ Đức Duy 33', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca34', 'ducduy34', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:58:19', '2025-06-17 01:58:19', 'Võ Đức Duy 34', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca35', 'ducduy35', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:58:57', '2025-06-17 01:58:57', 'Võ Đức Duy 35', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca36', 'ducduy36', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 01:59:41', '2025-06-17 01:59:41', 'Võ Đức Duy 36', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca80', 'ducduy80', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:01:28', '2025-06-17 02:01:28', 'Võ Đức Duy 80', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca81', 'ducduy81', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:02:10', '2025-06-17 02:02:10', 'Võ Đức Duy 81', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca82', 'ducduy82', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:02:48', '2025-06-17 02:02:48', 'Võ Đức Duy 82', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca83', 'ducduy83', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:03:25', '2025-06-17 02:03:25', 'Võ Đức Duy 83', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca84', 'ducduy84', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:04:26', '2025-06-17 02:04:26', 'Võ Đức Duy 84', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca85', 'ducduy85', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:04:58', '2025-06-17 02:04:58', 'Võ Đức Duy 85', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca86', 'ducduy86', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:05:49', '2025-06-17 02:05:49', 'Võ Đức Duy 86', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca87', 'ducduy87', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:06:25', '2025-06-17 02:06:25', 'Võ Đức Duy 87', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca88', 'ducduy88', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:07:25', '2025-06-17 02:07:25', 'Võ Đức Duy 88', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('2368128a-5d38-4348-88e3-69291822ca89', 'ducduy89', '/upload/image.png', 1, 1, '123456789', 0, '2025-05-12 07:45:53', 'duy1851999@gmail.com', '2025-06-17 02:08:14', '2025-06-17 02:08:14', 'Võ Đức Duy 89', 'TC_20250512074338', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('50cbebd8-2046-4117-8175-e0607ea65b2a', 'voducduy10', 'string', 1, 1, '0905505924', 1, '2025-05-17 06:02:47', 'voducduy10@yopmail.com', '2025-05-17 05:57:22', '2025-05-17 06:02:46', 'voducduy10', 'TC_20250517055722', '3337a05b-300e-4dde-a098-f243afb0f057'),
('a391b5db-9be5-4850-ab40-42b46ebdb760', 'test customer info', '', 1, 1, 'string', 1, '2025-05-13 06:34:32', 'test123@yopmail.com', '2025-06-13 05:29:30', '2025-06-13 05:29:30', 'test', 'TC_20250513063058', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('a391b5db-9be5-4850-ab40-42b46ebdb764', 'demo1', '', 1, 1, 'string', 1, '2025-05-13 06:34:32', 'voducduy1@yopmail.com', '2025-06-17 00:55:01', '2025-06-17 00:55:01', 'demo', 'TC_20250513063058', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('a391b5db-9be5-4850-ab40-42b46ebdb767', 'account 1', '', 1, 1, 'string', 1, '2025-05-13 06:34:32', 'account1@yopmail.com', '2025-06-17 00:56:58', '2025-06-17 00:56:58', 'demo', 'TC_20250513063058', 'b6f06280-3737-424f-bd5e-67eb5aed99ea'),
('a391b5db-9be5-4850-ab40-42b46ebdb769', 'demo', '', 1, 1, 'string', 1, '2025-05-13 06:34:32', 'voducduy@yopmail.com', '2025-05-13 06:30:58', '2025-05-13 06:34:32', 'demo', 'TC_20250513063058', 'b6f06280-3737-424f-bd5e-67eb5aed99ea');

-- --------------------------------------------------------

--
-- Table structure for table `customer_verify`
--

CREATE TABLE `customer_verify` (
  `id` char(36) NOT NULL,
  `verify_otp` varchar(255) NOT NULL,
  `verify_email` varchar(255) NOT NULL,
  `verify_key_hash` varchar(255) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_verify`
--

INSERT INTO `customer_verify` (`id`, `verify_otp`, `verify_email`, `verify_key_hash`, `is_verified`, `is_deleted`, `created_at`, `update_at`) VALUES
('04adbc12-4502-4ca9-8cf4-43ca3fad419f', '979808', 'voducduy@yopmail.com', 'b08596174b896a207d9f95c3d47cd4a22c77f1cc83702fb2f52ffcb9e1905ae6', 1, 0, '2025-05-13 06:29:46', '2025-05-13 06:30:33'),
('2de1d243-6faa-4898-b9f9-22d204d46031', '231276', 'duy1851999@gmail.com', '4b2a5f635acc2e64acbd6695fb4dfde4774242952e1c758cf0e559141ae2db13', 1, 0, '2025-05-12 07:30:42', '2025-05-12 07:31:58'),
('52ba3fff-020f-4cc3-85f1-6936aa7f8d46', '299287', 'buithikieu16tclc3@gmail.com', 'f14ff5bd1872ce207d3b0d8716afe0eb5b858aff6d0a1b5697b8ddc16104489f', 1, 0, '2025-04-21 03:13:06', '2025-04-21 03:14:07'),
('632e47a2-8972-4c99-9bce-85c2a1bed8d8', '931900', 'voducduy10@yopmail.com', 'b96cd1c5e9f311559e62482e8f39cae07695195be6387bf49547e4e2c823d559', 1, 0, '2025-05-17 05:55:17', '2025-05-17 05:56:51'),
('8752cc22-08f8-45d9-84dc-5c902986a30a', '535417', 'phananhtu1998@gmail.com', 'f9e9e711eaf54c3e6e9d03bc08db0efefc717b07b5c50d917cc02d63dcaf1218', 0, 0, '2025-04-24 08:23:41', '2025-04-24 08:23:41'),
('e25497c0-ee30-48dd-ad57-40ab77b2b87b', '363232', 'phananhtu1998@gmail.com', 'f9e9e711eaf54c3e6e9d03bc08db0efefc717b07b5c50d917cc02d63dcaf1218', 0, 0, '2025-04-21 01:32:27', '2025-04-21 01:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `goose_db_version`
--

CREATE TABLE `goose_db_version` (
  `id` bigint UNSIGNED NOT NULL,
  `version_id` bigint NOT NULL,
  `is_applied` tinyint(1) NOT NULL,
  `tstamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `goose_db_version`
--

INSERT INTO `goose_db_version` (`id`, `version_id`, `is_applied`, `tstamp`) VALUES
(1, 0, 1, '2025-04-18 08:09:46'),
(2, 20250311052428, 1, '2025-04-18 08:09:46'),
(3, 20250313142409, 1, '2025-04-18 08:09:47'),
(4, 20250317053633, 1, '2025-04-18 08:09:48'),
(5, 20250321061956, 1, '2025-04-18 08:09:49'),
(6, 20250324084532, 1, '2025-04-18 08:09:49'),
(7, 20250325053255, 1, '2025-04-18 08:09:50'),
(8, 20250326083423, 1, '2025-04-18 08:09:51'),
(9, 20250411064024, 1, '2025-04-18 08:09:51'),
(10, 20250411064046, 1, '2025-04-18 08:09:52'),
(11, 20250411064603, 1, '2025-04-18 08:09:53'),
(12, 20250419042815, 1, '2025-04-19 07:26:37'),
(13, 20250508140433, 1, '2025-05-12 06:44:06'),
(14, 20250508140447, 1, '2025-05-12 06:44:06'),
(15, 20250508140458, 1, '2025-05-12 06:44:06'),
(16, 20250508140519, 1, '2025-05-12 06:44:06'),
(17, 20250509133502, 1, '2025-05-12 06:44:06'),
(18, 20250509133548, 1, '2025-05-12 06:44:06'),
(19, 20250514062226, 1, '2025-05-24 08:10:59'),
(20, 20250522131845, 1, '2025-05-24 08:10:59'),
(21, 20250523055412, 1, '2025-05-24 08:10:59');

-- --------------------------------------------------------

--
-- Table structure for table `keytoken`
--

CREATE TABLE `keytoken` (
  `id` char(36) NOT NULL,
  `account_id` char(36) NOT NULL,
  `refresh_token` text NOT NULL,
  `refresh_tokens_used` json DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='keytoken';

--
-- Dumping data for table `keytoken`
--

INSERT INTO `keytoken` (`id`, `account_id`, `refresh_token`, `refresh_tokens_used`, `create_at`, `update_at`) VALUES
('86bab4e4-e97f-4ccb-8f9d-e86f1aaeac73', '2b9d7b50-3497-4d58-b0ab-eaf891cca75f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDkwMjgxMDAsImp0aSI6IjI0MWE2MDUzLTNlYTMtNGRlMi1hZGQ4LTU1ZmVkMDI5OWVmYiIsImlhdCI6MTc0ODQyMzMwMCwiaXNzIjoicGFya2luZ2RldmdvIiwic3ViIjoiNDA4NTU3ODgxY2xpdG9rZW4xOWY2MDJiMy00NTY5LTQ3OGItODY3Yy1jYmQ0YzkyNmFkMjcifQ.ilKs5iCLjrkKaqaYt3vQ-3CCyD-3h5gbrIhOpB2Y3YY', '[]', '2025-05-28 09:08:20', '2025-05-28 09:08:20'),
('b244e272-3e19-4a68-81a7-08251c5c1c0a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTA3NDU2MzUsImp0aSI6ImU0YmRhODNkLWIyZWEtNDQ1My04NzEyLWQyNDk3ZjQ0YjIyMyIsImlhdCI6MTc1MDE0MDgzNSwiaXNzIjoicGFya2luZ2RldmdvIiwic3ViIjoiNDU3MjYyNzM3Y2xpdG9rZW5hZWUwNTFmOS0wMmRkLTQxOWUtODAxNC1mZDYzM2FhN2Q5NDYifQ.fDT2YGO-A330pR3ALLqbrfTNiOGiS2uQc3hKqP40fXE', '[null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTA0ODgzMjMsImp0aSI6Ijg3MTdiNDZkLTU1YWQtNDZlOS04NTVkLTI3OTk4YThlZGMwMSIsImlhdCI6MTc0OTg4MzUyMywiaXNzIjoicGFya2luZ2RldmdvIiwic3ViIjoiNDU3MjYyNzM3Y2xpdG9rZW5hMzlmZDMxYS02YjA5LTRlZWMtYjAyMS1jMTY1OTc4MjA2YzcifQ.FF8bPWnjas7J0Go2uL0ODthbE48doi8k-M84Kd98K9Y\", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]', '2025-04-18 09:07:15', '2025-06-17 06:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `keytokencustomer`
--

CREATE TABLE `keytokencustomer` (
  `id` char(36) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `refresh_token` text NOT NULL,
  `refresh_tokens_used` json DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='keytokencustomer';

--
-- Dumping data for table `keytokencustomer`
--

INSERT INTO `keytokencustomer` (`id`, `customer_id`, `refresh_token`, `refresh_tokens_used`, `create_at`, `update_at`) VALUES
('c0fef71a-ab51-4e87-9593-dd19ef2d01c6', '2368128a-5d38-4348-88e3-69291822ca03', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDgwNDkyMzAsImp0aSI6IjgyNWM3NjFkLTgyNWUtNDQ5Mi05MzAwLTk3Yjc0ZjU0ZTU3NyIsImlhdCI6MTc0NzQ0NDQzMCwiaXNzIjoicGFya2luZ2RldmdvIiwic3ViIjoiMjEyMjg1MzkwM2NsaXRva2VuZDY3MWI2NGEtNDQ0NS00ZjIyLWEzYTQtMDg4MTIyNjlhYTJlIn0.70I0xfJqZ-u7tPk5Ov8mVkCl7NmiJuIiIj5ZWBxauZE', '[]', '2025-05-12 07:46:30', '2025-05-17 01:13:50'),
('f8c2bdf5-48b3-470a-9218-93735bb191f9', '50cbebd8-2046-4117-8175-e0607ea65b2a', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDk4ODk2MTIsImp0aSI6ImNhMGEyNDM5LTdlNWUtNDVkMi05MzFhLTI1OWRlZWQ4MDM4OSIsImlhdCI6MTc0OTI4NDgxMiwiaXNzIjoicGFya2luZ2RldmdvIiwic3ViIjoiMTAyMTQyMDYzOGNsaXRva2VuYjNhOTBhMjYtNWJhZC00N2JiLTgxYzYtOWQ1MzQ3YTdhYTc4In0.QEux3wgNvRcc32kURixlDXdZar9Zmb6PSDy49rQyewg', '[]', '2025-05-17 06:03:36', '2025-06-07 08:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `id` char(36) NOT NULL,
  `license` text NOT NULL,
  `role_id` char(36) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`id`, `license`, `role_id`, `date_start`, `date_end`, `created_at`, `update_at`, `is_deleted`) VALUES
('1b79a8d6-1e0c-41cb-8e8c-6e9f84322494', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6IjM4NDY0MWZiLTdhYzQtNDcxNy05YWExLTFiMGNmYTBmMWRhZiJ9.8kHjNZk1ozSJIPjMVe4myKwxz1WazjKMBgApzEPRBYk', '288a0fcf-a138-43e5-999c-bd150773b1e4', '2025-04-23 07:19:33', 'NO_EXPIRATION', '2025-04-23 07:19:32', '2025-04-23 07:19:32', 0),
('1c75da86-5b32-452d-bb38-fa6ed919bc85', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wNiAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI0ZWJiZGYwZS0wMDYxLTRkMTktODkzYi0wNGJiNjY1MDY1YzUifQ.TzlFpVXQgL1ff2v2JIKyxyoOO3-IhB2R0tE0ZftaNfA', '2f63866d-53ba-4ac6-b56c-074e1864c027', '2025-05-29 00:00:00', '2025-06-05 00:00:00', '2025-05-29 06:51:52', '2025-05-29 06:51:52', 0),
('2010e3a8-e184-47d0-81b1-dc9264e238a8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wNSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMDEgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI1ZmQ3MTM2Yy02ZTg1LTQxYWYtODQyYS1hMzBlMmJlMjIxZTYifQ.fho4lqIGxcrxnSVGWNHhXw4AMrOy-QfzxRz9st4q_RQ', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '2025-06-01 00:00:00', '2025-06-05 00:00:00', '2025-05-28 09:11:32', '2025-05-28 09:11:32', 0),
('20d38b36-c9bd-4d7d-924b-69767fa77d0d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xNiAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI4MDcyNmIxZC00MzNlLTRkYjItOGM2NS00NTAxZDI4ZTgxNmYifQ.qXxoHjueiNkV0WXE9IHuWnb1Z9Pq7SzvPKswldg6Jqo', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '2025-06-14 00:00:00', '2025-06-16 00:00:00', '2025-06-14 08:09:52', '2025-06-14 08:09:52', 0),
('25a9c3ca-4964-4c74-943c-f07d53852574', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI1ZGRkZmVjYS0yOTRmLTQ1ZTctYWM3Ny1kYThjNWM3ZWMxZmQifQ.t1sbKmgiR1GDRmXJeI8DfRLwRyIkD-kce8Ou2XPWwo8', '7b6c108e-eb25-493d-a62e-411f14e26ea5', '2025-06-10 00:00:00', '2025-06-11 00:00:00', '2025-06-10 07:56:11', '2025-06-10 07:56:11', 0),
('27860cff-ed53-4e93-b89f-14d599ab25f0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6ImZhYTIzMWYxLWRjNmEtNDQyNS1hOTFkLWRlOTFiMzg0MmRmMCJ9.S8iLLCXR9tiy7us3gxKF1esUSpZdObBiOlcFJcApgMw', '1929b8c5-a3a5-420d-afff-6108fc573a2b', '2025-06-10 08:43:22', 'NO_EXPIRATION', '2025-06-10 08:43:21', '2025-06-10 08:43:21', 0),
('279124c0-8bf6-4d0b-b77d-f4d7b202f403', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNS0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjggMTY6MTU6MjMiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIzOGEzNGQ3My1jNzQzLTQ2ZWYtOTAwMy01MzNkMWM2YzFmZTIifQ.Do-QTZ6e-rpzyrv8ifcI4e2JizmwDQCXyMui_2Qffos', '9478e463-297a-4001-80d5-174e5888497a', '2025-05-28 16:15:23', '2025-05-31 00:00:00', '2025-05-28 09:15:21', '2025-05-28 09:15:21', 0),
('28d8df88-bddf-4120-8eb9-a59d8fe41ae8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wNSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5NTBjNmViZi05MzkyLTQ5YzItYWE1OS1iYTkyM2ZhOGYxYmEifQ.MgZQshvAOjhgy-gqYq1cpfWTFzNNnebb0kpbxj2swQ0', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '2025-05-29 00:00:00', '2025-06-05 00:00:00', '2025-05-29 06:50:01', '2025-05-29 06:50:01', 0),
('2c896fff-0a6e-4c02-88c3-2f47169470d8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xNyAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI1MTM3N2Q3Yi0xZmFiLTQxMTgtYTExNi1lZjcxODFhMThkMjQifQ.AC3zETBIFCgYe6ehM75bolPg1k-Y1dt7VrwXSrX7eB4', '49713563-730c-42ac-aadd-708767257d13', '2025-06-14 00:00:00', '2025-06-17 00:00:00', '2025-06-14 07:56:19', '2025-06-14 07:56:19', 0),
('2d80cab0-95d4-4c7d-8983-48b1c4db107f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wNCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMDEgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJjNTc4ZWUzNy04NTIwLTQwNDAtODcxNi0wYmM2NDhhYWU5NTQifQ.uXAlMFSALsfZcZ6pMCp_JCSmPdEq0pFBu6zAvb54YyU', '181ad901-d797-4d9f-b4a3-71a04fb24971', '2025-06-01 00:00:00', '2025-06-04 00:00:00', '2025-05-28 09:11:13', '2025-05-28 09:11:13', 0),
('3375f96b-dcc5-492a-ab49-cb3b0af401a1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IjIwMjUtMDMtMjggMTE6MjI6MzAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIzMDE0MjZlNS1lOWQwLTRkNWMtYjYzNi1lNGI4YmI0Y2JkZmYifQ.PP9HPqdaioyRZYyQrgkNx5pUu_GZENVfioDSq3J0xxo', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '2025-03-28 18:22:30', 'NO_EXPIRATION', '2025-04-18 08:10:35', '2025-04-18 08:10:35', 0),
('338a9b27-c3ef-4de5-8b89-dbf5e4df859c', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMTQ6NTA6MTgiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJhZDcyNTM3My04Y2ExLTQxNTYtODVjZS00NmY2ZDM3NTU1N2IifQ.leU4jXFkSDPSO4zgP8SpY8VYz_FgPFCdnepi-ufQWHU', 'a3549215-4f8e-44b1-be0c-8cf7b1749c09', '2025-06-14 14:50:18', '2025-06-30 00:00:00', '2025-06-14 07:50:31', '2025-06-14 07:50:31', 0),
('33ac70e5-b1a1-43c7-b856-3197fa0a978f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0yOSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMTM6MzY6MTIiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJmZGRiYmJhNC0zN2QxLTQ0MTYtYWY3Zi05NGRhODM4MTBmNTEifQ.oKniMI9mLV5YO7h4yCcdqPFzCFsrpAk5izLl8xfqcaw', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '2025-05-29 13:36:12', '2025-06-29 00:00:00', '2025-05-29 06:36:59', '2025-05-29 06:36:59', 0),
('3b773074-8e8a-40ac-84f4-7d9eae39a7f0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6IjNlNjZkMmYyLTE3ZWMtNDM4MS05Zjk4LWQ0ZDQ1NDcxNDlhNyJ9.EaU1ZPLL3AxJJXXcL8IXmhu_ba_5IhY6Gx4_j6kEPy8', 'dca022b6-44ac-4384-8e05-f1f141a15dcc', '2025-06-14 06:42:33', 'NO_EXPIRATION', '2025-06-14 06:42:32', '2025-06-14 06:42:32', 0),
('40788de1-1caa-4bc6-9682-b031980c4be4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xNSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI0MzUwZDdhMy0xOGY4LTQxN2YtOGFkOS04NjU2NTE5OGJhYmUifQ.lZkuNCX8DuOlLXMRXfOCGMdR60OzwC2pdvH5rlz8-5Y', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '2025-05-29 00:00:00', '2025-06-15 00:00:00', '2025-05-29 02:47:30', '2025-05-29 02:47:30', 0),
('41c72442-b881-492b-ba7f-b11c07794f18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMTU6NTI6MzIiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJmZTRiMzZiYy1iNGU1LTRkOWMtOWYyZi02Y2JjNTJlODY3YTIifQ.skSTw0Nyj85S_xEqod7jOSUDbxODLxJ6QA4_tiGHXuE', '5e9356b9-6962-4687-b02e-c78ff8effba9', '2025-06-10 15:52:32', '2025-06-30 00:00:00', '2025-06-10 08:52:15', '2025-06-10 08:52:15', 0),
('449f50a5-63b3-4cdf-8000-bd3cc3189930', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMTU6Mzg6MjUiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJiMzk0ZWEyZS1mNWYzLTQ4YzEtOTY5Ni03MDQ2ODBjMmQwMGEifQ.hrm9EVDTp8gMYS7kxn0w3v4D-EhnoAD-kL9DZ2ZQCYQ', '5e9356b9-6962-4687-b02e-c78ff8effba9', '2025-06-10 15:38:25', '2025-06-30 00:00:00', '2025-06-10 08:38:23', '2025-06-10 08:38:23', 0),
('49b1e54e-6477-40e7-8c0e-7711c394c911', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xMyAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTMgMTM6MzY6NTkiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI4NjljYjBkNi04MjU5LTRjYTEtOGJlOC02MjY4NjI4YzVlNTgifQ.Ibug_x1mjIkwl6Lc5UTvqUu_Hv0mfwf4QmQCYTeADQM', 'ab36d147-9c63-40e6-8ce3-dd7f691e7d88', '2025-06-13 13:36:59', '2025-07-13 00:00:00', '2025-06-13 06:37:04', '2025-06-13 06:37:04', 0),
('5993850b-8034-4ba9-96f4-19ae204929da', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6IjU5ODhkOTExLTg1MDctNDA5Yy04M2ZhLTBhOGY0ZTc5ZmVhYyJ9.HaZvYNB2G35KLpf3DTjW9TQq2eF9l-kKshfokDho7L8', 'd47297af-916b-405a-9e96-7f1118d4a588', '2025-04-24 02:51:17', 'NO_EXPIRATION', '2025-04-24 02:51:16', '2025-04-24 02:51:16', 0),
('5a9acc48-90e3-4b26-9f9c-a9ef1f841df1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNC0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDQtMjQgMDk6NTA6MTciLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI0ODZmNTM5MS02NTk5LTQzZjItOWQ1OC0yMmYwODlmYjBhMzIifQ.AT41cYLObL5TOs88fchz-EDIT7Yd3zFeVPhPDx6pm-w', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '2025-04-24 09:50:17', '2025-04-30 00:00:00', '2025-04-24 02:50:34', '2025-04-24 02:50:34', 0),
('5b672b65-5751-405b-ac6f-951944c74d4d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMTM6NDI6NDYiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJhM2QwZDg5NS1kNjhkLTQxZjAtOTI5NC0zNzY1MWI5NDY2N2QifQ.FQVHXywhabo1QMXvepauGNArvK-Qf8TN6nqKzVAIx5w', '8a5870d6-2141-4557-969c-c9300751c136', '2025-06-14 13:42:46', '2025-06-30 00:00:00', '2025-06-14 06:42:58', '2025-06-14 06:42:58', 0),
('5cfefeca-509e-46bb-b930-f1b0f479b894', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMTU6MzA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5YmI2MGE0Zi02ZTg1LTRhYjUtOTM4NC00MzA1MzdlYmU5NDEifQ.CrgrT70P3hUQLyF-l9vFO7mUEeuEdK04QhgQiAv-E3o', 'c7e35969-2279-420a-88ca-efa5de5abfbb', '2025-06-10 15:30:00', '2025-06-30 00:00:00', '2025-06-10 08:29:43', '2025-06-10 08:29:43', 0),
('6e5b518f-2694-48d2-b4bf-62bf88539db6', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMTQ6NDk6NDIiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIyMjdhYzE5ZC1lODczLTQ5NWUtOTVjZC0wY2ZmYmZjOTE0MWUifQ.STJvJ2opB6pgK1-PUSoxdnJ29imLP-seSD_vM2oMHJI', 'a3549215-4f8e-44b1-be0c-8cf7b1749c09', '2025-06-14 14:49:42', '2025-06-30 00:00:00', '2025-06-14 07:49:54', '2025-06-14 07:49:54', 0),
('82bfe409-cf38-45f5-bcda-f4db6859cd7a', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wOSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMDEgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJiNTM0YjZmYi00MzZmLTRkOWYtYmM1My04NGRjNWYzNjhkMjgifQ.Liy1htFqkk0U01ETtHO1c9mwiWwx9iERdnLRN02YPDY', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '2025-05-01 00:00:00', '2025-06-09 00:00:00', '2025-04-23 06:48:28', '2025-04-23 06:48:28', 0),
('8ca09d26-bd19-4402-adba-345a436b025b', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xNCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMTM6MTk6MjMiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkY2IwZGRjMy04NDgwLTQzNzUtODcxYS1kOTkzYmEzYzhkM2UifQ.LXEQUVMSm_nRpoelazijnAK3GjSsaBEAvhXs4oXs_Iw', 'a3055ca3-1b69-41dc-85b0-784b6d7e8988', '2025-06-14 13:19:23', '2025-07-14 00:00:00', '2025-06-14 06:19:35', '2025-06-14 06:19:35', 0),
('8d9c5380-3634-4ab6-8c96-ddfb1883c4a4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6IjI0NTFhYWVhLTQ4OTUtNGYxZS05YjI0LTczY2ExNDY0OTRkZSJ9.9eElE5ptY6UXwun7TOldRQ-eQnd4P2iXtbZg-mTImWE', '23e6c60c-9f64-4cb3-871c-02370771bb95', '2025-05-31 00:00:00', 'NO_EXPIRATION', '2025-04-24 02:51:31', '2025-04-24 03:05:59', 0),
('8e149595-622f-4dc9-afed-7d61e33d8f98', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0wMyAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIzZjM4Y2M3Ni1kNmI5LTQ4OGYtOTYxZi0wYjBmODk5NDBhNGUifQ.XkdVfN6iSkrKDWZAJNGzTz4qDESpE7Vpm0lj1j8fio4', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '2025-05-29 00:00:00', '2025-06-03 00:00:00', '2025-04-23 06:46:32', '2025-05-29 01:08:43', 0),
('91184bae-c5f3-46a5-b7d4-52efdcac2b23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTEgMDg6MTM6MDEiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5ZDU0MjQyYi1jMjRlLTQyZGQtYWVmZS05YzUxZDE3NzRmZTgifQ.j3enEzIvhUDPXMBKZoRg_fiIDq_qnujswopNni21OtU', 'ee0cac60-57f4-402e-afc0-6badd6898bc9', '2025-06-11 08:13:01', '2025-07-11 00:00:00', '2025-06-11 01:12:50', '2025-06-11 01:12:50', 0),
('9599c671-58ee-4b31-8118-ac49607a5dae', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkNGNkOWVjMy1lY2M1LTQxZWMtYTNlNC1hNTc3NTAyODQ3OWYifQ.DmD3C73k3n3APtVNdB_L6oJYf2YRTpY77JxkcXgBjkY', '924f4154-86ff-4d6d-a160-e6fbbb84dee3', '2025-06-10 00:00:00', '2025-06-11 00:00:00', '2025-06-10 08:05:53', '2025-06-10 08:05:53', 0),
('9c679899-f9e4-4fef-b0dc-099f44b749d7', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNC0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDQtMjMgMTU6NTU6NTEiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJiNTAwMTExNS01OWQ5LTQ2N2YtYmM3Zi05MjBkNTEwOTQzOTgifQ.gTs6fxBVe54QOPZ4az0pfbZiPi5pzVmdbHfCYzY0_8o', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '2025-04-23 15:55:51', '2025-04-30 00:00:00', '2025-04-23 08:56:02', '2025-04-23 08:56:02', 0),
('a087508f-a487-4cf7-a2c3-07d593ee8d3c', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6ImFiMGUzODgwLWUyMTYtNDhiNC05NjU5LTc4Y2U3YTJjMGZiYSJ9.XvG6KXKye_Kb9lBtoz12HUi_j7QaEGX5WNaBKe_KhEk', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '2025-05-31 00:00:00', 'NO_EXPIRATION', '2025-04-24 02:52:39', '2025-04-24 02:56:22', 0),
('a27e7319-35f5-48cd-8cfa-bc0563c63dec', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6IjVkMzI4ZmJhLTVmYzYtNDZjNS04NWI2LWZlZGEwMjFlODdhNSJ9.bG2wr0X69pwKlFxkqru1pUzjhz3hXbVEGPP0KAmAZ00', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '2025-03-28 11:22:30', 'NO_EXPIRATION', '2025-04-19 07:00:35', '2025-04-22 08:17:18', 0),
('a2b29a42-5172-447e-8478-d0f181faaad1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0yMiAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI1NWY2ZDExNy04ZDIzLTQzZWQtYjIxYS05NmVhOGUxOGU5ZTUifQ.SaBLWyscytJWHl0fNKcYkCQy-iX-cUvz4qCWlTD5nxA', '073d6a20-3971-41da-8527-f3f44118d595', '2025-06-14 00:00:00', '2025-06-22 00:00:00', '2025-06-14 08:11:15', '2025-06-14 08:11:15', 0),
('a85e4ef7-3361-4593-a35a-b6c8c3ce16bb', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIxZDZlYjY2NS0yNmQzLTQ1MjMtYTkxZi1iNGIxYzg0MDEyZDMifQ.TvyRISRCEJw4kLvxwLGFYC7rWl6Aj-ZR0w3k2D3BOmg', 'c69b0d76-d788-4908-8a1b-0a7e198b6a7f', '2025-06-10 00:00:00', '2025-07-11 00:00:00', '2025-06-11 01:12:08', '2025-06-11 01:12:08', 0),
('aa50e5de-defe-41ef-9409-a7683f51d566', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNS0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiIwMWY2MDViYy1kODI5LTQ4YTctYTYwNy0wYThhYjg2ZjNmZTgifQ.QyzvRAlpxtukLhutvm_-15wcHOYp3tf1uXzHlttmJ5w', '42258027-6e17-4c44-ba5b-227322583e6f', '2025-05-29 00:00:00', '2025-05-30 00:00:00', '2025-05-29 07:02:44', '2025-05-29 07:02:44', 0),
('af337ff6-a61a-4f7f-bc16-70b01a77abb9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6ImE3YjVhYWE1LTRjNzUtNDQ5Ny04MTQ1LWYyZmZiNDU4MDQzMSJ9.Rtrr19ULw1KGUsyznlr2rS-cB4HxxnALmMdhlnF0Ioo', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '2025-05-29 02:48:57', 'NO_EXPIRATION', '2025-05-29 02:48:56', '2025-05-29 02:48:56', 0),
('b1d54254-3046-4483-a446-851ccc1d7575', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6Ijc4NmFiYmRmLWVhYmEtNDI3Mi04NGVjLWY3MjI4OTc5NmVhOCJ9.QM237ByE_XzFvUfz7MwCEPrDf1fz5u2Q7GGscxKPbnA', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '2025-03-28 11:22:30', 'NO_EXPIRATION', '2025-04-19 07:01:18', '2025-04-22 08:16:50', 0),
('b77eb935-863a-4f9f-bf58-8329ac488615', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNS0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDQtMjYgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI3YTQyMmQ1Mi00NWU2LTRmMGUtOWY5Mi1jYTg2MzQ4ZTlmNWYifQ.SSyG61xPQGOV5nfGgISroXz9o3kHiidOzsMQAAH66g4', '826e7157-513f-400e-83d6-b9648c932432', '2025-04-26 00:00:00', '2025-05-31 00:00:00', '2025-04-23 08:20:55', '2025-04-26 08:02:08', 0),
('b9327008-6697-4468-aa5e-a270dd482208', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkMTE3MGMwOS0zMjhlLTRiMzQtODEwZC1lZGRkYTAwZTNkZjQifQ.PdsklqTwG8A07ModQ0muFUp7DigSC2HYfXVzTGsBXgw', '67811d29-e1fd-41c5-b8d4-c1b389f35a70', '2025-06-10 00:00:00', '2025-06-11 00:00:00', '2025-06-10 08:15:10', '2025-06-10 08:15:10', 0),
('bde79f4a-c345-47a0-b915-b05ca98463d1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTYgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5ZWFmY2Y0Mi04MjQ5LTQ5ODYtODkyNy02NDgyYWJmNDlkZDQifQ._zIlOobXbIWgzo-bFXhlgrz3OxLISQl8tg_6dG0A0qQ', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '2025-06-16 00:00:00', '2025-07-31 00:00:00', '2025-06-16 07:16:37', '2025-06-16 07:16:37', 0),
('bf3cea72-f417-4433-a20b-1ccc8929c358', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNS0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMDg6NDU6MTAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJiMzAzYmY4Yi1kNWZlLTQzOTQtYWQyNy0yMGNlNzkxZmIxODMifQ.TdSBlxmLmfAFOcQ4lTMWn7eu-hD_w7ucG2fHkLI0b4s', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '2025-05-29 08:45:10', '2025-05-31 00:00:00', '2025-05-29 01:45:57', '2025-05-29 01:45:57', 0),
('cfc0f50d-9386-4798-b623-7808a69375b6', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTEgMDg6MDY6NTEiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJiOWUwMmE1NC04MDFlLTQ3YzAtODI4ZC04NTEwMzEyOTRkOWEifQ.ceOhy8JCOWOVdIV667ZPXw7rorkkJhQohOxGLrTKpBw', '5d905b5a-8024-441e-9e2a-912fbe001367', '2025-06-11 08:06:51', '2025-07-11 00:00:00', '2025-06-11 01:06:40', '2025-06-11 01:06:40', 0),
('d22dcf18-12c2-4fcb-b238-d4dbf722f351', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI4OTYwMzEwOC02OTc0LTRiY2EtYTRmOS00ZmIyNjlmYjJlM2IifQ.-G8KWrdarzBMOz6fwxpeCTP73wJcJw_ty04vSOW0Dcg', 'a3549215-4f8e-44b1-be0c-8cf7b1749c09', '2025-06-10 00:00:00', '2025-07-11 00:00:00', '2025-06-11 01:10:29', '2025-06-11 01:10:29', 0),
('d4a9dec4-0d05-4342-bb32-1766d787abbf', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNS0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjkgMTM6MDM6NDIiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkOTRmMDI2ZS00ZTAwLTQxMTAtOTdjYi1iNzJmN2IxMjYyYjMifQ.hujpCbqo9IDTkSHRquHDDwibivb8n6sEmWYL-2CV6w0', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '2025-05-29 13:03:42', '2025-05-31 00:00:00', '2025-05-29 06:04:28', '2025-05-29 06:04:28', 0),
('d730862f-9380-4865-a013-32b17308075c', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0xMi0zMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTYgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5YTE1ODQxMS04M2I3LTRjZDUtODllYS03NWE5MWQ4NTQyZGQifQ.6_v6VMi7IHcRtf4vyqKhYNJHoEFFffMF-MYEJoyi8YA', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '2025-06-16 00:00:00', '2025-12-31 00:00:00', '2025-06-16 07:17:43', '2025-06-16 07:17:43', 0),
('d9cc0de1-5ace-4b53-b06a-cfb179cf1c61', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0yMSAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI5YWYyNmUxNy1hZDJmLTRlYzItODE2OC1iODU4ZmM3OTVmNjcifQ.tleEWSHvH_DxZOd_oNEZdGzX_rrar3YThdBpO-UIXvY', '1e9adb00-716c-4007-a154-0ba999ec1904', '2025-06-14 00:00:00', '2025-06-21 00:00:00', '2025-06-14 08:09:08', '2025-06-14 08:09:08', 0),
('db862a76-0ff8-4762-b540-8f3dc6ca376e', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0xNyAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTQgMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkNjk2MDA3My05YTIxLTRiYTItODhkMC05YjUxYzgxMmMyYTUifQ.FhuYFxY0bN6YReOyuVH6FXyOpCr9MYjFtxdJNVjP21Q', '77658513-c248-46ee-9013-69786eee0264', '2025-06-14 00:00:00', '2025-06-17 00:00:00', '2025-06-14 06:45:00', '2025-06-14 06:45:00', 0),
('efaba6b2-b92f-44bf-9a95-a0d44388857a', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiTk9fRVhQSVJBVElPTiIsImRhdGVzdGFydCI6IiIsImlzcyI6InBhcmtpbmdkZXZnbyIsImp0aSI6ImE4ZjkxZWNmLWFkNmItNGY4Mi1hNGJjLTBjZDBkMGU0MzE3ZiJ9.LHRW-3aBs-MBt6eXZV3Z2POJuMppb3qyKn_ZeQ6ZP-E', '3b8d96f1-ba83-41e1-9837-26d52535a129', '2025-05-29 06:38:28', 'NO_EXPIRATION', '2025-05-29 06:38:28', '2025-05-29 06:38:28', 0),
('f733123a-1bb0-459a-b2de-2a08c00dc1c0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNy0xNyAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTcgMDc6Mzg6NDQiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI2NzJmOTc1OC1lMzgzLTQzYWItYTk2My1jZDFlN2M4MmQ1ZTEifQ.q3qyaxx0geg6-WfanTQLKmbtf0TYCBbWS-u0VnxzOAU', '082b5d56-15f8-4435-a113-fc7fcf963fc2', '2025-06-17 07:38:44', '2025-07-17 00:00:00', '2025-06-17 00:38:44', '2025-06-17 00:38:44', 0),
('fa5dd47f-d14c-4622-b4d7-3157152d23dc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDUtMjggMDA6MDA6MDAiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiJkYzEwNDNkZi05ZmYxLTQ1NzUtOGVkNy05MTJjMDdjZDBkZTcifQ.kJDqxv6O0UC1Qfk5Hf7S1ZXhnQkM5TklQWB3kn-j3sA', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '2025-05-28 00:00:00', '2025-06-30 00:00:00', '2025-05-28 09:15:11', '2025-05-28 09:15:11', 0),
('fccb31f0-318f-4d62-bd8b-529834be8539', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRlZW5kIjoiMjAyNS0wNi0zMCAwMDowMDowMCIsImRhdGVzdGFydCI6IjIwMjUtMDYtMTAgMTU6MTg6MDIiLCJpc3MiOiJwYXJraW5nZGV2Z28iLCJqdGkiOiI0OGE3NWQ0OS03MWQ4LTQwNjAtYmNhMC0wZWEyNmQ0YTBkMjQifQ.1ygz_CHBjzT90hF5XzmlJZbsbmLmiLaE_pXWNQip034', '860bc1dd-520f-4d41-9ddf-f2f5776ef667', '2025-06-10 15:18:02', '2025-06-30 00:00:00', '2025-06-10 08:17:45', '2025-06-10 08:17:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manage_booking_list`
--

CREATE TABLE `manage_booking_list` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `time_booking` timestamp NOT NULL,
  `description` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manage_booking_list`
--

INSERT INTO `manage_booking_list` (`id`, `code`, `customer_id`, `time_booking`, `description`, `status`, `is_deleted`, `created_at`, `updated_at`, `note`) VALUES
('0033f2b4-78a2-4782-9c63-98c0dce07a50', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-17 02:44:57', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:44:57', '2025-06-17 02:44:57', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a51', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca11', '2025-06-17 02:46:02', 'đặt lịch ngày 6-6-2025', 'Đã xác nhận', 0, '2025-06-17 02:46:02', '2025-06-17 02:46:02', 'test xac nhan'),
('0033f2b4-78a2-4782-9c63-98c0dce07a54', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca11', '2025-06-17 02:48:18', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:48:18', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a55', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca14', '2025-06-17 02:49:15', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:49:15', '2025-06-17 03:30:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a56', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca14', '2025-06-17 02:49:56', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:49:56', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a57', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca14', '2025-06-17 02:50:37', 'đặt lịch ngày 17 tháng 7', 'Đã hủy', 0, '2025-06-17 02:50:37', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a58', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca14', '2025-06-17 02:51:17', 'đặt lịch ngày 18 tháng 6', 'Đã hủy', 0, '2025-06-17 02:51:17', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a59', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca11', '2025-06-17 02:51:42', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:51:42', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a5a', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-06 11:22:30', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-07 08:25:23', '2025-06-07 08:37:28', 'ksgdflllllllllllllllllllllllllllllllllllllldddddddddddddddddddfđfdsfsdfádsádfdsáđàasdfsafsdfas'),
('0033f2b4-78a2-4782-9c63-98c0dce07a5c', 'BX_20250607082526', 'a391b5db-9be5-4850-ab40-42b46ebdb760', '2025-06-16 06:49:32', 'đặt lịch ngày 6-6-2025', 'Đã xác nhận', 0, '2025-06-16 06:49:32', '2025-06-16 06:49:32', ''),
('0033f2b4-78a2-4782-9c63-98c0dce07a5n', 'BX_20250607082525', '2368128a-5d38-4348-88e3-69291822ca03', '2025-06-17 02:42:34', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:42:34', '2025-06-17 02:42:34', 'Test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a60', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:52:44', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:52:44', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a61', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:52:58', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:52:58', '2025-06-17 02:52:58', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a62', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-17 02:53:22', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:53:22', '2025-06-17 02:53:22', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a63', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:53:51', 'đặt lịch ngày 6-6-2025', 'Đã xác nhận', 0, '2025-06-17 02:53:51', '2025-06-17 02:53:51', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a66', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:54:23', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:54:23', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a67', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:54:46', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:54:46', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a68', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca11', '2025-06-17 02:55:35', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:55:35', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a69', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:55:48', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:55:48', '2025-06-17 02:55:48', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a70', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:56:23', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:56:23', '2025-06-17 03:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a71', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:56:38', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:56:38', '2025-06-17 02:56:38', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a72', 'BX_20250607082523', '2368128a-5d38-4348-88e3-69291822ca23', '2025-06-17 02:56:58', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 02:56:58', '2025-06-17 02:56:58', 'test huy'),
('0033f2b4-78a2-4782-9c63-98c0dce07a80', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-17 03:03:40', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 03:03:40', '2025-06-17 03:30:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a81', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-17 03:04:26', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 03:04:26', '2025-06-17 03:30:00', 'Tự động hủy do quá thời gian xác nhận'),
('0033f2b4-78a2-4782-9c63-98c0dce07a90', 'BX_20250607082523', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-17 03:04:46', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-17 03:04:46', '2025-06-17 03:30:00', 'Tự động hủy do quá thời gian xác nhận'),
('03913ec4-96e8-4073-807c-c1a9a2459334', 'BX_20250607052149', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-06 10:22:30', 'đặt chỗ ngày 6/6/2025', 'Đã hủy', 0, '2025-06-07 05:21:49', '2025-06-07 06:00:00', 'Tự động hủy do quá thời gian xác nhận'),
('03bc2ddd-9f2f-4034-8cca-50049c2a8b47', 'BX_20250517073343', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-07-15 11:22:30', 'abc', 'Đã hủy', 0, '2025-05-17 07:33:43', '2025-05-17 07:49:09', 'Không muốn gửi xe nữa'),
('0c46af9b-f48a-41f4-9019-6ce5f44a2892', 'BX_20250520025206', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-05-30 11:22:30', 'abcef', 'Đã xác nhận', 0, '2025-05-20 02:52:06', '2025-05-20 02:52:16', ''),
('1588833d-8818-4a70-ac8b-5b373470f5ed', 'BX_20250517060450', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-30 11:22:30', 'đặt chỗ', 'Đã xác nhận', 0, '2025-05-17 06:04:50', '2025-05-17 07:12:25', ''),
('19155a8c-b67f-4f16-9231-94441d203fe5', 'BX_20250520033802', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-28 11:22:30', 'duytest', 'Đã xác nhận', 0, '2025-05-20 03:38:02', '2025-05-20 03:42:45', ''),
('29af477a-4f50-49ae-9d95-31baf201bec9', 'BX_20250517073155', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-07-30 11:22:30', 'abc', 'Đã xác nhận', 0, '2025-05-17 07:31:55', '2025-05-17 07:32:52', ''),
('2a4c9570-c16e-4df3-9983-a7a4e5fc4d0a', 'BX_20250517072547', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-30 11:22:30', 'abc', 'Đã xác nhận', 0, '2025-05-17 07:25:47', '2025-05-17 07:29:04', ''),
('3165bb19-c653-4486-bbb6-feb9dae7c4ea', 'BX_20250607083905', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-08-28 11:22:30', 'test 7/6 lần 3', 'Đã hủy', 0, '2025-06-07 08:39:05', '2025-06-13 02:52:26', 'lỗi'),
('80aea3aa-4649-4629-8fc9-20292a142f03', 'BX_20250607052017', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '2025-06-06 10:22:30', 'đặt chỗ ngày 6/6/2025', 'Đã hủy', 0, '2025-06-07 05:20:17', '2025-06-07 05:22:02', 'hhh'),
('85948416-deb5-4e24-b6cf-42435730135c', 'BX_20250607064219', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-06 11:22:30', 'đặt lịch ngày 6-6-2025', 'Đã hủy', 0, '2025-06-07 06:42:19', '2025-06-07 07:03:00', 'Tự động hủy do quá thời gian xác nhận'),
('b06ac488-f920-4305-9ea0-9b7ae9c1a102', 'BX_20250517091619', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-07-15 11:22:30', 'abc', 'Đã hủy', 0, '2025-05-17 09:16:19', '2025-05-20 02:41:10', 'test hủy'),
('b9483f50-8379-4c96-9a4d-7b975cd97e76', 'BX_20250520035332', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-15 11:22:30', 'duytest10', 'Đã hủy', 0, '2025-05-20 03:53:32', '2025-06-07 02:11:18', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'),
('c2b56141-c51d-4360-9fca-9d49b614615d', 'BX_20250607020558', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', '2025-06-07 10:22:30', 'đặt chỗ ngày 7/6/2025', 'Đã hủy', 0, '2025-06-07 02:05:58', '2025-06-07 05:18:43', 'huye'),
('c4c1a7a4-8d6a-4b5b-9544-170f34d277f6', 'BX_20250520025112', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-05-30 11:22:30', 'abc', 'Đã xác nhận', 0, '2025-05-20 02:51:12', '2025-05-20 02:51:26', ''),
('c5d804fe-d751-427c-9cb9-101da066ac06', 'BX_20250520025344', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-30 11:22:30', 'abcefghik', 'Đã xác nhận', 0, '2025-05-20 02:53:44', '2025-05-20 03:37:33', ''),
('cc84d7a9-c657-448f-9168-b0576bedfbeb', 'BX_20250607033846', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-07-06 11:22:30', 'dang ky test 7/6', 'Đã hủy', 0, '2025-06-07 03:38:46', '2025-06-07 05:19:05', 'hủy'),
('d4419338-fdba-44bf-b55b-974927876622', 'BX_20250517075825', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-07-15 11:22:30', 'abc', 'Đã hủy', 0, '2025-05-17 07:58:25', '2025-05-17 09:15:58', 'abcdef'),
('dc1bebf6-49b2-417f-a79f-ddd9164b54f5', 'BX_20250520025259', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-30 11:22:30', 'abcefgh', 'Đã hủy', 0, '2025-05-20 02:52:59', '2025-05-20 02:53:32', 'test'),
('e77a4d89-fe9d-48d7-b518-a4fcf02b4ab0', 'BX_20250520034304', '50cbebd8-2046-4117-8175-e0607ea65b2a', '2025-06-28 11:22:30', 'duytest1', 'Đã hủy', 0, '2025-05-20 03:43:04', '2025-05-20 03:53:19', 'test hủy'),
('e7de4d76-6188-4391-9e7c-add07b57e4ff', 'BX_20250517011642', '2368128a-5d38-4348-88e3-69291822ca03', '2025-05-16 11:22:30', 'đặt chỗ a1', 'Đã hủy', 0, '2025-05-17 01:16:42', '2025-05-17 01:34:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` char(36) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_icon` varchar(255) NOT NULL,
  `menu_url` varchar(255) NOT NULL,
  `menu_parent_Id` char(36) DEFAULT NULL,
  `menu_level` int NOT NULL,
  `menu_number_order` int NOT NULL,
  `menu_group_name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL,
  `update_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu_name`, `menu_icon`, `menu_url`, `menu_parent_Id`, `menu_level`, `menu_number_order`, `menu_group_name`, `is_deleted`, `create_at`, `update_at`) VALUES
('0045fd99-8fff-4d32-9116-e0ed05c6df10', 'test8', '', '', NULL, 1, 14, '', 1, '2025-04-28 06:06:14', '2025-04-28 06:06:14'),
('026b0c57-40a7-4ff5-ba40-31feb9b77b68', 'test 1', '', '', NULL, 1, 5, '', 1, '2025-06-10 01:24:12', '2025-06-10 01:24:12'),
('1aedb859-d6bf-4227-81ad-3ab76b8fa0c0', 'Quản lý khách hàng', 'FaUser', 'quan-ly-khach-hang', 'ea59e39d-8552-4993-8f30-7de9930da03f', 2, 2, '/api', 0, '2025-05-30 02:39:07', '2025-05-30 02:39:07'),
('1b50fa06-24d3-4174-a3c9-891b8e148f64', 'dd', '', '', NULL, 1, 4, '', 1, '2025-04-19 02:57:07', '2025-04-19 02:57:07'),
('1fb79c0f-09c0-496d-9a2d-02fc2523052e', 'menu 2', 'FaRegChartBar', 'menu_2', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 5, '/menu2', 1, '2025-06-14 05:50:22', '2025-06-14 05:50:22'),
('222df954-2cba-4a66-9d4c-189f3101d335', 'test', '', '', NULL, 1, 2, '', 1, '2025-04-19 02:06:06', '2025-04-19 02:06:06'),
('226f93ac-233a-47fe-a246-c09775819fc2', 'test 1.1', 'FaParking', 'test_1.1', '026b0c57-40a7-4ff5-ba40-31feb9b77b68', 2, 1, '/api', 1, '2025-06-10 01:26:50', '2025-06-10 01:26:50'),
('23f4e870-b199-4e91-b076-ec3fca40ac58', 'test 2.2', 'FaRegChartBar', 'test_2.2', '342cad9e-44a1-490f-8495-3253a462cd48', 2, 2, '/api', 1, '2025-06-10 01:40:02', '2025-06-10 01:40:02'),
('260a2491-3775-40cb-8dee-43032358d8c8', 'Thông tin khách hàng', 'FaUser', 'thong-tin-khach-hang', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 1, '/api', 0, '2025-05-30 02:41:30', '2025-05-30 02:41:30'),
('27ceb830-a256-4e69-8553-908d90cfd89c', 'test4', '', '', NULL, 1, 10, '', 1, '2025-04-28 06:05:42', '2025-04-28 06:05:42'),
('2aba54f7-71a2-44f9-8917-4d2e53868d11', 'Quản lý thông tin bãi xe', '', '', NULL, 1, 5, '', 0, '2025-05-12 01:31:55', '2025-05-12 01:31:55'),
('2d9717d1-affd-41d8-aef3-c043299c1971', 'abcdfdsf', 'FaParking', 'ffff', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 7, 'fffff', 1, '2025-06-03 01:05:15', '2025-06-03 01:05:15'),
('2df656bc-dcd7-4738-ab98-30967aea446c', 'test3', '', '', NULL, 1, 9, '', 1, '2025-04-28 06:05:35', '2025-04-28 06:05:35'),
('2e32f74c-d725-4ec3-b41c-64f784b49360', 'test', '', '', NULL, 1, 3, '', 1, '2025-04-26 04:23:38', '2025-04-26 04:23:38'),
('342cad9e-44a1-490f-8495-3253a462cd48', 'test ', '', '', NULL, 1, 6, '', 1, '2025-06-10 01:36:46', '2025-06-10 01:36:46'),
('3532553d-dcc7-423d-b72d-7abc1d69e813', 'test100', '', '', NULL, 1, 12, '', 1, '2025-05-05 02:35:54', '2025-05-05 02:35:54'),
('3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'Hệ thống', '', '', NULL, 1, 3, '', 0, '2025-05-28 08:44:04', '2025-05-28 08:44:04'),
('3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'Gói chức năng', 'FaHockeyPuck', 'goi-chuc-nang', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 2, 3, '/goi-chứcdads', 0, '2025-05-28 08:46:11', '2025-05-28 08:46:11'),
('3ee662bb-a780-43da-bf57-235422075f31', 'test1111', '', '', NULL, 1, 7, '', 1, '2025-04-28 06:05:26', '2025-04-28 06:05:26'),
('46062e61-51a5-4fab-81af-d169c50e060e', 'Hệ thống', '', '', NULL, 1, 2, '', 1, '2025-05-28 08:37:00', '2025-05-28 08:37:00'),
('462193b6-83df-4f2f-bb5f-129ee8008c56', 'Quản lý lịch sử giao dịch', 'FaHockeyPuck', 'quan-ly-lich-su-giao-dịch', 'ea59e39d-8552-4993-8f30-7de9930da03f', 2, 3, '/api', 0, '2025-05-30 02:40:15', '2025-05-30 02:40:15'),
('47ee0436-6ab4-4f9f-9b21-935b0f3a339d', 'ddcxxxxxxxxxxxxxxx', '', '', NULL, 1, 7, '', 1, '2025-04-19 03:03:37', '2025-04-19 03:03:37'),
('48464916-ecd4-4b27-8da7-9e3f9bbe578a', 'test7', '', '', NULL, 1, 13, '', 1, '2025-04-28 06:06:07', '2025-04-28 06:06:07'),
('50ecc00f-615e-4da5-9e72-1d36039ada51', 'Tài Khoản', 'FaHockeyPuck', 'tai-khoan', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 2, 1, '/api/taikhoan', 0, '2025-05-28 08:45:27', '2025-05-28 08:45:27'),
('536660d4-59fe-40c2-952d-578edc4e3ee6', 'Quản lý thông tin phương tiện', '', '', NULL, 1, 10, '', 1, '2025-04-25 00:54:09', '2025-04-25 00:54:09'),
('5585915a-5f7d-44d3-ac22-f25336d82cfc', 'test2', '', '', NULL, 1, 8, '', 1, '2025-04-28 06:05:30', '2025-04-28 06:05:30'),
('623e84cb-22b7-47a4-803d-a0863e9c5201', 'dddđ', '', '', NULL, 1, 5, '', 1, '2025-04-19 03:00:53', '2025-04-19 03:00:53'),
('658daa92-0369-44ad-9a41-0bfccb6e6214', 'test', 'FaParking', '/api', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 4, 'test', 1, '2025-06-03 00:58:35', '2025-06-03 00:58:35'),
('68b1770e-b090-4eda-85d1-9ed0c105b322', 'Quản lý khu vực', 'FaParking', 'quan-ly-khu-vuc', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 2, 1, '/api', 0, '2025-05-12 01:33:07', '2025-05-12 01:33:07'),
('6a258e8d-872a-400a-b090-115653368af0', 'Tài khoản', 'FaHockeyPuck', 'tai-khoan', '46062e61-51a5-4fab-81af-d169c50e060e', 2, 2, '/api', 1, '2025-05-28 08:38:45', '2025-05-28 08:38:45'),
('72d64a0c-e800-402e-901f-a0f135caa367', 'Quản lý đặt chỗ', 'FaParking', 'quan-ly-dat-cho', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 2, 4, '/api', 0, '2025-05-14 07:39:14', '2025-05-14 07:39:14'),
('759df5a6-6377-4e16-84ea-896cabcd9698', 'Lịch sử giao dịch', 'FaNewspaper', 'lich-su-giao-dich', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 3, '/api', 0, '2025-05-30 02:42:36', '2025-05-30 02:42:36'),
('77edc260-bf6d-4b97-95cf-df90b0f01be9', 'Chức năng', 'FaHockeyPuck', 'chuc-nang', '46062e61-51a5-4fab-81af-d169c50e060e', 2, 1, '/api', 1, '2025-05-28 08:37:57', '2025-05-28 08:37:57'),
('7b811d1d-ef58-46f7-ad92-5136a0845816', 'Quản lý lưu xe', 'FaParking', 'quan-ly-luu-xe', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 2, 3, '/api', 0, '2025-05-23 00:41:42', '2025-05-23 00:41:42'),
('7c97cf69-9bc9-4c4f-8099-7078e728992d', 'Gói chức năng', 'database', 'goi-chuc-nang', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 3, '/funcpackage', 1, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('85b1e883-f63a-437e-8084-2ab832e7a65f', 'test1111', 'FaParking', '/api1111', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 6, 'dshdsdsdsd', 1, '2025-06-03 01:04:59', '2025-06-03 01:04:59'),
('894fecab-bd0b-4463-9d53-c3fb166b296e', 'test 2.1', 'FaParking', 'test 2.1', '342cad9e-44a1-490f-8495-3253a462cd48', 2, 1, '/api', 1, '2025-06-10 01:37:19', '2025-06-10 01:37:19'),
('9422908b-e19f-41ec-b963-1107f33aeb70', 'Đặt chỗ', 'FaHockeyPuck', 'dat-cho', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 2, '/api', 0, '2025-05-30 02:41:59', '2025-05-30 02:41:59'),
('95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'Quản lý phương tiện', 'FaParking', 'quan-ly-phuong-tien', 'ea59e39d-8552-4993-8f30-7de9930da03f', 2, 1, '/menu', 0, '2025-04-25 01:24:54', '2025-04-25 01:24:54'),
('9b8f6794-42dd-488a-b853-78bc1643b84e', 'test1111', '', '', NULL, 1, 9, '', 1, '2025-04-19 07:33:26', '2025-04-19 07:33:26'),
('a0623b53-75c7-43f1-94e8-8e2eaef561d8', 'gjgjgjg', '', '', NULL, 1, 8, '', 1, '2025-04-19 05:33:11', '2025-04-19 05:33:11'),
('a6d81d0c-4f27-4a5c-86a0-1ae748e989e9', 'test9', '', '', NULL, 1, 14, '', 1, '2025-05-06 03:27:38', '2025-05-06 03:27:38'),
('a9d95b07-3c7e-47bc-8433-9563ae5130dc', 'ddd', 'FaParking', 'dđ', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 5, 'dđ', 1, '2025-04-19 03:00:22', '2025-04-19 03:00:22'),
('ac28b692-5e99-4b6b-bcc0-7b87896230df', 'test', '', '', NULL, 1, 3, '', 1, '2025-04-26 04:23:23', '2025-04-26 04:23:23'),
('b7c3054d-22d3-4711-8cc2-4f1c31441117', 'Quản lý danh sách đặt chỗ', '', '', NULL, 1, 14, '', 1, '2025-05-14 07:24:12', '2025-05-14 07:24:12'),
('bda0e83a-b0c9-4dff-81d7-8def1657fcf6', 'test9', '', '', NULL, 1, 14, '', 1, '2025-04-28 06:06:23', '2025-04-28 06:06:23'),
('c1334bf6-6917-4033-8ea0-6aaca70701b1', 'test1', 'FaParking', 'ddd', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 4, 'dđ', 1, '2025-04-19 02:06:41', '2025-04-19 02:06:41'),
('c2be12fa-c6f1-4df0-8816-ecefadd591af', 'test 9-2', 'FaParking', 'test9-2', 'a6d81d0c-4f27-4a5c-86a0-1ae748e989e9', 2, 2, '/api', 1, '2025-05-30 07:10:10', '2025-05-30 07:10:10'),
('c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'Chức năng', 'FaHockeyPuck', 'chuc-nang', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 2, 2, 'api/chuc-nang', 0, '2025-05-28 08:44:41', '2025-05-28 08:44:41'),
('c5e06c75-db95-43af-b9c1-14b63185314f', 'test111', 'FaParking', '/api1', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 5, 'test', 1, '2025-06-03 01:04:30', '2025-06-03 01:04:30'),
('c60dc41b-e454-4df2-887a-4a8359d45404', 'Chức năng', 'database', 'chuc-nang', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 1, '/menu', 1, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('c75b92d2-b721-490c-8130-f3c948cb45a0', 'fzfsfdsfsdf', 'FaParking', 'fsdfsdfsd', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 6, 'fdsfsdfsd', 1, '2025-04-19 03:02:04', '2025-04-19 03:02:04'),
('c819b6c7-70e5-49ed-90cb-ba97fe833245', 'test6', '', '', NULL, 1, 12, '', 1, '2025-04-28 06:05:55', '2025-04-28 06:05:55'),
('d15947b0-cccf-40ce-a640-7fb6f6f85fa3', 'sfsfsdfsdf', '', '', NULL, 1, 6, '', 1, '2025-04-19 03:01:46', '2025-04-19 03:01:46'),
('d8fddbb0-4ce9-4873-8bda-39ecfd288c72', 'menu2', 'FaSignal', 'menu_2', 'e39e92d5-7622-4053-88d1-f90229aa3341', 2, 4, '/menu2', 0, '2025-06-14 06:00:18', '2025-06-14 06:00:18'),
('dbc455ca-80a7-42fd-bb4f-22459244a734', 'Quản lý bãi xe', 'FaParking', 'quan-ly-bai-xe', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 2, 2, '/api', 0, '2025-05-19 00:48:37', '2025-05-19 00:48:37'),
('dd8fb4f2-1c47-466b-adf6-13dd9cb7e06f', 'Gói chức năng', 'FaHockeyPuck', 'goi-chuc-nang', '46062e61-51a5-4fab-81af-d169c50e060e', 2, 3, '/api', 1, '2025-05-28 08:39:14', '2025-05-28 08:39:14'),
('e160c4ec-bd74-425e-98a8-a68155a657f4', 'Dashboard', '', '', NULL, 1, 3, '', 1, '2025-04-19 02:05:40', '2025-04-19 02:05:40'),
('e39e92d5-7622-4053-88d1-f90229aa3341', 'Quản lý thông tin khách hàng', '', '', NULL, 1, 6, '', 0, '2025-05-30 02:40:52', '2025-05-30 02:40:52'),
('e9f5b58e-91ae-4900-8502-6266540ce865', 'test01-01', 'FaParking', 'test1111', '3ee662bb-a780-43da-bf57-235422075f31', 2, 1, '/api', 1, '2025-05-30 07:07:04', '2025-05-30 07:07:04'),
('ea59e39d-8552-4993-8f30-7de9930da03f', 'Quản lý thông tin phương tiện', '', '', NULL, 1, 4, '', 0, '2025-04-25 01:24:03', '2025-04-25 01:24:03'),
('ee44bcea-68c2-4cd1-b43b-83a7c9a56985', 'Menu A1', 'FaCog', 'menua1', NULL, 1, 14, 'menu_a1', 1, '2025-05-27 08:24:23', '2025-05-27 08:24:23'),
('efc78d7f-6dbb-4957-89d6-03d38be4869c', 'Tài khoản', 'database', 'tai-khoan', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 2, 2, '/account', 1, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('efc78d7f-6dbb-4957-89d6-03d38be4869e', 'Hệ thống', '', '', NULL, 1, 1, '', 1, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('f4edbb71-155c-4714-af9d-a82ab464ffbd', 'test5', '', '', NULL, 1, 11, '', 1, '2025-04-28 06:05:48', '2025-04-28 06:05:48'),
('f995c0cf-1fda-44e4-93aa-29f3019f6842', 'test9-1', 'FaUser', 'test9-1', 'a6d81d0c-4f27-4a5c-86a0-1ae748e989e9', 2, 1, '/api', 1, '2025-05-30 07:09:19', '2025-05-30 07:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `parking_floor_management`
--

CREATE TABLE `parking_floor_management` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parking_lot_id` char(36) NOT NULL,
  `number` int NOT NULL,
  `column` int NOT NULL,
  `row` int NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parking_floor_management`
--

INSERT INTO `parking_floor_management` (`id`, `name`, `parking_lot_id`, `number`, `column`, `row`, `is_deleted`, `created_at`, `updated_at`) VALUES
('08975b31-2c28-4da3-9068-51494575d4ca', 'Tầng 5', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 5, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('0d26568a-8240-42cb-a9ef-8af08b5d5ba6', 'Tầng 1', '48beb8ba-69e7-4a4f-a9e2-06d9ac27b164', 1, 4, 10, 0, '2025-06-11 02:11:31', '2025-06-17 04:04:09'),
('0d8ff987-987e-42b2-b718-94a19d73a89c', 'Tầng 1', '4b177145-1945-43dd-89fb-e89170eb69b5', 1, 10, 4, 0, '2025-06-13 02:50:28', '2025-06-13 02:51:15'),
('111fb097-d859-4a51-a738-0c19480fc782', 'Tầng 3', 'eae272a4-a834-47b7-9092-7d2386185f6d', 3, 0, 0, 0, '2025-06-17 00:41:49', '2025-06-17 00:41:49'),
('183ff67c-2c92-420f-b65d-32341dc3f91b', 'Tầng 3', '199a2f2d-206e-4b39-91ce-b55f06f472bf', 3, 22, 9, 0, '2025-06-16 05:53:08', '2025-06-17 09:26:07'),
('19b13a9e-0dd6-41d1-b0c5-0f3bf7dab76c', 'Tầng 2', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 2, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('1bafacdd-c102-46a3-90bb-7467057c1055', 'Tầng 10', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 10, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('1cdbe3eb-feb0-460b-8d38-422ab48d4731', 'Tầng 6', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 6, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('1fbb4ce3-fbcb-4c88-adbe-385de8d37389', 'Tầng 8', '4b177145-1945-43dd-89fb-e89170eb69b5', 8, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('2c2338c4-9f95-4c35-9533-b8ca70b37727', 'Tầng 6', '4b177145-1945-43dd-89fb-e89170eb69b5', 6, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('2dd6036e-e35e-4729-b05c-ab611b581f1b', 'Tầng 1', 'ae64fae9-f86c-499a-8213-057b74ca5519', 1, 0, 0, 0, '2025-06-11 02:11:38', '2025-06-11 02:11:38'),
('34de0e03-502f-4cae-90fa-c1b8ec435846', 'Tầng 4', '4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 4, 0, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38'),
('36170aed-7322-4f5a-86b0-f6cd0a1754af', 'Tầng 5', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 5, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('3735baf7-af49-4b20-8a14-511a7bcfd521', 'Tầng 1', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 1, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('373ddef0-bbaf-4329-b179-3ecd1e568e94', 'Tầng 1', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 1, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('496793b3-c37c-4dc8-bc53-d5977be8ad05', 'Tầng 1', '3c40d662-72b6-4a68-8c90-2866b940b6a9', 1, 0, 0, 0, '2025-06-17 03:11:04', '2025-06-17 03:11:04'),
('4a15cc75-ad11-4093-8809-59f7f0bd87f6', 'Tầng 2', '4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 2, 0, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38'),
('4a66769f-7b69-4a6b-9e19-4cbc2226f0fc', 'Tầng 1', '492a728e-de2c-4755-b72b-3797c99cd7cd', 1, 6, 3, 0, '2025-06-16 03:34:41', '2025-06-16 05:19:34'),
('4b759eaa-5c5d-40c5-afb1-3beee4492550', 'Tầng 2', '492a728e-de2c-4755-b72b-3797c99cd7cd', 2, 6, 3, 0, '2025-06-16 03:34:41', '2025-06-16 05:20:01'),
('4fd9ded9-0945-42e6-bfd7-70808b7d240f', 'Tầng 8', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 8, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('5009fa81-7cb3-4606-8e07-aa2a77c7e794', 'Tầng 2', 'a4f17a23-3929-4f86-82ff-427290939d63', 2, 0, 0, 0, '2025-06-07 05:54:52', '2025-06-07 05:54:52'),
('5273df4c-4992-4094-ab35-b3bf55d02b9a', 'Tầng 6', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 6, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('5969dcba-e286-417b-b895-a1758a16f279', 'Tầng 10', '4b177145-1945-43dd-89fb-e89170eb69b5', 10, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('5d78d270-48b9-4502-8416-0ba6aafc06bc', 'Tầng 1', '2294427c-ac41-4d0f-aa42-a42a78950856', 1, 6, 3, 0, '2025-06-17 03:10:44', '2025-06-17 03:54:54'),
('5d9762aa-932a-4e37-8142-a559138b88ef', 'Tầng 1', 'eae272a4-a834-47b7-9092-7d2386185f6d', 1, 14, 12, 0, '2025-06-17 00:41:49', '2025-06-17 01:08:11'),
('6016d2ae-fb56-4140-bed4-82ea3a804968', 'Tầng 2', '199a2f2d-206e-4b39-91ce-b55f06f472bf', 2, 10, 10, 0, '2025-06-16 05:53:08', '2025-06-17 09:21:26'),
('64a7034f-da34-404c-a0c7-17dec6efec0e', 'Tầng 1', '1ea672ee-5128-40c1-bb51-4984b83123cc', 1, 0, 3, 0, '2025-06-11 02:12:03', '2025-06-16 03:27:49'),
('6966f0cd-9ceb-4864-93bc-d5103058978d', 'Tầng 2', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 2, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('6ae48997-594e-4b14-a857-b2a117919185', 'Tầng 10', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 10, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('6c7b8b60-bf1c-4cf6-a640-4de141537707', 'Tầng 1', '199a2f2d-206e-4b39-91ce-b55f06f472bf', 1, 6, 4, 0, '2025-06-16 05:53:08', '2025-06-16 05:54:19'),
('6cdd113a-f8c2-41e9-8ede-a760704a81fe', 'Tầng 9', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 9, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('6d077c81-1b70-41b7-964f-9ba55aa829ae', 'Tầng 1', 'a4f17a23-3929-4f86-82ff-427290939d63', 1, 10, 4, 0, '2025-06-07 05:54:52', '2025-06-11 03:19:48'),
('6d2be474-1653-4c1c-b804-df7b82f89754', 'Tầng 1', 'cea7f3c6-fb09-409f-90d8-3556f8868166', 1, 0, 0, 0, '2025-06-11 02:12:26', '2025-06-11 02:12:26'),
('74405568-70fb-4c6b-a232-5157b80f8177', 'Tầng 1', '5890e0a2-dde7-4949-867b-39b19019198a', 1, 0, 0, 0, '2025-06-11 02:12:18', '2025-06-11 02:12:18'),
('74a51c3c-0589-4b1c-b5da-ac6d7fa868c1', 'Tầng 9', '4b177145-1945-43dd-89fb-e89170eb69b5', 9, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('838aa559-494d-48e7-b987-a1f62513aba4', 'Tầng 1', '48ecda90-a0de-47b9-8ba5-6f52b2a05e7f', 1, 1, 1, 0, '2025-06-11 02:11:49', '2025-06-16 08:49:37'),
('84544ef8-975c-44e1-88dd-4bdb48323f12', 'Tầng 1', '5aaf561b-d7eb-49be-a46e-9d24df14701e', 1, 0, 0, 0, '2025-06-11 02:12:10', '2025-06-11 02:12:10'),
('8530169a-8554-496c-94c2-5f0016832dba', 'Tầng 3', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 3, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('8b98b777-ad72-4227-9adf-5425464a8978', 'Tầng 3', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 3, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('8ff522d6-2844-4766-af4b-c7502d4a29a0', 'Tầng 1', '00666034-fd0a-49d3-a5d2-f3fba4b27825', 1, 20, 10, 0, '2025-06-11 02:11:57', '2025-06-17 09:20:15'),
('91b937ab-bea5-413e-a562-ca4c579ac794', 'Tầng 4', '4b177145-1945-43dd-89fb-e89170eb69b5', 4, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('931025e1-5428-4791-b5e0-f549df417280', 'Tầng 8', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 8, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('9750f20a-ff58-4fc5-9b9d-dfb282b5ce4c', 'Tầng 7', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 7, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('9e5c5ee5-6a0c-45f4-82f9-31696fbcee23', 'Tầng 4', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 4, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('a11744ce-91e0-4daf-b425-96c30ecf39cb', 'Tầng 4', 'ec171db1-a11e-49ca-8645-41bb61260c8c', 4, 0, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15'),
('a22cb1c9-6273-45b9-8d50-377c0d77b724', 'Tầng 3', '4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 3, 0, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38'),
('a71b0eee-cc61-4ab5-a9e8-b07b146754f9', 'Tầng 4', 'eae272a4-a834-47b7-9092-7d2386185f6d', 4, 0, 0, 0, '2025-06-17 00:41:49', '2025-06-17 00:41:49'),
('b20adb86-b03f-43eb-8b6d-418227981d39', 'Tầng 7', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 7, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('c7113e1e-7110-4ab3-a271-7a9da5e72df7', 'Tầng 1', '9140e9b3-63e1-40a6-b743-df9c403e9531', 1, 0, 0, 0, '2025-06-17 03:07:36', '2025-06-17 03:07:36'),
('cb08de84-fea7-40f3-9a1b-a6e2aa841ef2', 'Tầng 2', 'eae272a4-a834-47b7-9092-7d2386185f6d', 2, 0, 0, 0, '2025-06-17 00:41:49', '2025-06-17 00:41:49'),
('d1f87046-ce37-41e6-a4a0-007cdee2030b', 'Tầng 3', '4b177145-1945-43dd-89fb-e89170eb69b5', 3, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('d980b682-8586-4d49-b87b-20bc1eb04666', 'Tầng 1', '4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 1, 0, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38'),
('da36126a-4dd7-4e2e-bd46-58eccb3ae8e5', 'Tầng 2', '0a0f0a14-55c0-477c-81eb-34fb1ebcef28', 2, 0, 0, 0, '2025-06-16 00:29:22', '2025-06-16 00:29:22'),
('dc54e33e-2973-4340-9440-ab6d5292d9ab', 'Tầng 9', 'd054e0d4-0bbc-4005-a034-d484cea8f4e1', 9, 0, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02'),
('e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'Tầng 1', '0a0f0a14-55c0-477c-81eb-34fb1ebcef28', 1, 0, 0, 0, '2025-06-16 00:29:22', '2025-06-16 00:29:22'),
('e6338495-5668-4457-bf61-386df1c206f9', 'Tầng 7', '4b177145-1945-43dd-89fb-e89170eb69b5', 7, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('e672d487-613a-4081-b5ee-fe338e4f655a', 'Tầng 2', '2294427c-ac41-4d0f-aa42-a42a78950856', 2, 8, 8, 0, '2025-06-17 03:10:44', '2025-06-17 03:55:08'),
('ec5cbc52-96ed-436c-942d-1d4e467641a4', 'Tầng 5', '4b177145-1945-43dd-89fb-e89170eb69b5', 5, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('ef6e7590-d979-4dfc-b4dc-ad5df5818276', 'Tầng 2', '4b177145-1945-43dd-89fb-e89170eb69b5', 2, 0, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28'),
('f570bfe0-a892-46c3-9c7d-7ffc0329e895', 'Tầng 5', '4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 5, 0, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38'),
('fdcecc54-8cfb-464c-ab0e-faac7944869c', 'Tầng 1', '18bec51d-7099-44e7-87c7-c18f2ac43ad8', 1, 5, 4, 0, '2025-06-11 02:11:43', '2025-06-18 00:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `parking_lot`
--

CREATE TABLE `parking_lot` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `area_id` char(36) NOT NULL,
  `number_of_floors` int NOT NULL,
  `status` tinyint NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `total_parking_positions` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parking_lot`
--

INSERT INTO `parking_lot` (`id`, `code`, `name`, `area_id`, `number_of_floors`, `status`, `is_deleted`, `created_at`, `updated_at`, `total_parking_positions`) VALUES
('00666034-fd0a-49d3-a5d2-f3fba4b27825', 'BX_20250611021157', 'test4', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:11:57', '2025-06-17 07:23:45', 1),
('08fc3aee-8ba8-4ac8-b62d-407f69597037', 'BX_20250513072714', 'Vòng đứng', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 100, 0, 1, '2025-05-13 07:27:14', '2025-05-22 08:58:34', 30),
('0a0f0a14-55c0-477c-81eb-34fb1ebcef28', 'BX_20250616002922', 'Bãi xe (test tạo vị trí)', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 2, 0, 0, '2025-06-16 00:29:22', '2025-06-16 00:29:22', 30),
('18bec51d-7099-44e7-87c7-c18f2ac43ad8', 'BX_20250611021143', 'test3', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:11:43', '2025-06-11 02:11:43', 1),
('199a2f2d-206e-4b39-91ce-b55f06f472bf', 'BX_20250616055308', 'Bãi xe tạo để test (Kiều)', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 3, 0, 0, '2025-06-16 05:53:08', '2025-06-16 05:53:08', 40),
('1b0855e2-7d89-4caa-9534-1c7f35bcb246', 'BX_20250513055819', 'vòng ngang', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 05:58:19', '2025-05-13 05:58:19', 0),
('1ea672ee-5128-40c1-bb51-4984b83123cc', 'BX_20250611021203', 'test5', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:12:03', '2025-06-11 02:12:03', 1),
('2294427c-ac41-4d0f-aa42-a42a78950856', 'BX_20250617031044', 'test 17/6', '1683e426-f0a5-43a2-8c7d-6f9767a738f9', 2, 0, 0, '2025-06-17 03:10:44', '2025-06-17 03:10:44', 10),
('2f92d3d1-85bc-41f4-8803-8465775eff2b', 'BX_20250513013610', 'test', '', 0, 0, 0, '2025-05-13 01:36:10', '2025-05-13 01:36:10', 0),
('2fe656d7-00c6-43af-91b9-97318fe27ed9', 'BX_20250513065057', 'Xếp thảng hàng', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 06:50:57', '2025-05-13 06:50:57', 0),
('3493f52f-d351-4ea2-acf2-e9d1d1ebd508', 'BX_20250513065041', 'Xếp ngang', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 06:50:41', '2025-05-13 06:50:41', 0),
('372adf62-e17e-4119-a94e-51d13a2418a9', 'BX_20250513065049', 'Xếp dọc', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 06:50:49', '2025-05-13 06:50:49', 0),
('3c40d662-72b6-4a68-8c90-2866b940b6a9', 'BX_20250617031104', 'test3', '1683e426-f0a5-43a2-8c7d-6f9767a738f9', 1, 0, 0, '2025-06-17 03:11:04', '2025-06-17 03:11:04', 10),
('48beb8ba-69e7-4a4f-a9e2-06d9ac27b164', 'BX_20250611021131', 'test1', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:11:31', '2025-06-11 02:11:31', 1),
('48ecda90-a0de-47b9-8ba5-6f52b2a05e7f', 'BX_20250611021149', 'test4', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:11:49', '2025-06-11 02:11:49', 1),
('492a728e-de2c-4755-b72b-3797c99cd7cd', 'BX_20250616033441', 'Kiều test (16/6)', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 2, 0, 0, '2025-06-16 03:34:41', '2025-06-16 03:34:41', 10),
('4b177145-1945-43dd-89fb-e89170eb69b5', 'BX_20250613025028', 'Bãi xe Kiều test', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 10, 0, 0, '2025-06-13 02:50:28', '2025-06-13 02:50:28', 4),
('4d6f5365-fd0d-4c24-9e54-acfa5f74722b', 'BX_20250617035438', 'test 17/6', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 5, 0, 0, '2025-06-17 03:54:38', '2025-06-17 03:54:38', 10),
('54d1e5cf-b9d2-437a-a363-8b74d34d8abd', 'BX_20250513064927', 'Xếp chồng', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 06:49:27', '2025-05-13 06:49:27', 0),
('5890e0a2-dde7-4949-867b-39b19019198a', 'BX_20250611021218', 'test7', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:12:18', '2025-06-11 02:12:18', 1),
('5aaf561b-d7eb-49be-a46e-9d24df14701e', 'BX_20250611021210', 'test6', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:12:10', '2025-06-11 02:12:10', 1),
('667768ed-9ebd-4c17-aa71-21abd8d893b7', 'BX_20250513013521', 'string', 'string', 0, 0, 0, '2025-05-13 01:35:21', '2025-05-13 01:35:21', 0),
('74d800f9-f8b5-4c76-8b8e-fdbac5e504e6', 'BX_20250513081043', 'Vòng đứng abcdefghhgds', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 100, 0, 1, '2025-05-13 08:10:43', '2025-05-22 08:58:34', 10),
('9140e9b3-63e1-40a6-b743-df9c403e9531', 'BX_20250617030736', 'Bãi xe test 17/6', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-17 03:07:36', '2025-06-17 03:07:36', 10),
('9170dedc-ea31-470d-9a0a-0dd714860aac', 'BX_20250522072156', 'Vòng đứng', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 100, 0, 1, '2025-05-22 07:21:56', '2025-05-22 08:58:34', 10),
('98604994-f2b3-4b2c-9f8d-4ff74ee213b2', 'BX_20250513064854', 'Vòng nghiêng', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 06:48:54', '2025-05-13 06:48:54', 0),
('9cb13ecf-dc97-4290-b7d9-f00cbbf83710', 'BX_20250616092142', 'string', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 0, 0, 0, '2025-06-16 09:21:42', '2025-06-16 09:21:42', 0),
('a4f17a23-3929-4f86-82ff-427290939d63', 'BX_20250607055452', 'Bãi xe Industries', '42433816-eafd-4608-ae0b-a25356d0ad2b', 2, 0, 0, '2025-06-07 05:54:52', '2025-06-07 05:59:24', 30),
('a886baf7-4b7e-46b4-a9d9-c7b13a7324b0', 'BX_20250512073011', 'Vòng đứng', '88132a54-06c8-4b05-9e49-1557d91a98d9', 0, 0, 0, '2025-05-12 07:30:11', '2025-05-12 07:30:11', 0),
('a8d95709-c1d8-49a3-900b-064b5ca858c4', 'BX_20250522012122', 'test', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 10, 0, 1, '2025-05-22 01:21:22', '2025-05-22 03:48:59', 10),
('ac740311-2585-4d9a-af4c-a5ae57f09a73', 'BX_20250522013602', 'test4', '40dff2eb-64ed-4eb4-9432-a90661c02bb2', 2, 0, 1, '2025-05-22 01:36:02', '2025-05-22 03:46:24', 10),
('ae64fae9-f86c-499a-8213-057b74ca5519', 'BX_20250611021138', 'test2', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:11:38', '2025-06-11 02:11:38', 1),
('b003464e-71f7-4f0c-8187-e1ff829d9387', 'BX_20250513070805', 'Xếp thảng hàng bgfhhhfdggdfhgf', '6de9e0c4-ebae-4b18-8e99-1a5bae264252', 100, 0, 0, '2025-05-13 07:08:05', '2025-05-13 07:08:05', 0),
('bbac5424-f9ff-473b-9a7c-f3b5656730ab', 'BX_20250522085859', 'Bãi xe vòng đứng', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 2, 0, 0, '2025-05-22 08:58:59', '2025-05-30 02:17:31', 30),
('c7c70f8e-9421-4967-8879-d2936683d1f1', 'BX_20250522012435', 'test3', '40dff2eb-64ed-4eb4-9432-a90661c02bb2', 2, 0, 1, '2025-05-22 01:24:35', '2025-05-22 03:48:54', 10),
('cea7f3c6-fb09-409f-90d8-3556f8868166', 'BX_20250611021226', 'test8', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 1, 0, 0, '2025-06-11 02:12:26', '2025-06-11 02:12:26', 1),
('d054e0d4-0bbc-4005-a034-d484cea8f4e1', 'BX_20250607062702', 'Bãi xe test', '908612a9-394f-444f-8543-9842cb8f4338', 10, 0, 0, '2025-06-07 06:27:02', '2025-06-07 06:27:02', 10),
('da5a209b-2947-46ad-990c-7d2b59b6b318', 'BX_20250522085915', 'Bãi xe vòng xoay', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 2, 0, 0, '2025-05-22 08:59:15', '2025-05-22 08:59:15', 20),
('df62965e-07f6-4697-833d-3bfc6b813d3a', 'BX_20250522012235', 'test1', '40dff2eb-64ed-4eb4-9432-a90661c02bb2', 10, 0, 1, '2025-05-22 01:22:35', '2025-05-22 03:47:19', 10),
('eae272a4-a834-47b7-9092-7d2386185f6d', 'BX_20250617004149', 'test 17/6', '158ec988-55c4-42a6-97bf-4dde83c4f8a3', 4, 0, 0, '2025-06-17 00:41:49', '2025-06-17 00:41:49', 40),
('ec171db1-a11e-49ca-8645-41bb61260c8c', 'BX_20250607062215', 'Bãi xe vòng đứng', '42433816-eafd-4608-ae0b-a25356d0ad2b', 10, 0, 0, '2025-06-07 06:22:15', '2025-06-07 06:22:15', 10);

-- --------------------------------------------------------

--
-- Table structure for table `parking_management`
--

CREATE TABLE `parking_management` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `parking_spot_id` char(36) NOT NULL,
  `status` tinyint NOT NULL,
  `time_checkin` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parking_management`
--

INSERT INTO `parking_management` (`id`, `code`, `customer_id`, `parking_spot_id`, `status`, `time_checkin`, `created_at`, `updated_at`) VALUES
('7b2a0bae-195e-4105-9366-3c362398366c', 'DC_1234530', 'a391b5db-9be5-4850-ab40-42b46ebdb760', '0f2b99af-372e-4bb2-abd0-2cd49ecd642a', 1, '2025-05-23 06:15:50', '2025-06-16 07:03:35', '2025-06-16 07:03:35'),
('7b2a0bae-195e-4105-9366-3c362398366f', 'DC_1234535', 'a391b5db-9be5-4850-ab40-42b46ebdb760', '', 2, '2025-05-23 06:15:50', '2025-05-23 06:15:50', '2025-05-23 06:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `parking_spot`
--

CREATE TABLE `parking_spot` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parking_floor_id` char(36) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `spot_number` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `x` int NOT NULL DEFAULT '0',
  `y` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `parking_spot`
--

INSERT INTO `parking_spot` (`id`, `name`, `parking_floor_id`, `qrcode`, `spot_number`, `status`, `is_deleted`, `created_at`, `updated_at`, `x`, `y`) VALUES
('024eac88-7b09-42a9-99a2-74d47b74293b', 'B1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'DSĐSD', 5, 0, 0, '2025-06-18 00:23:12', '2025-06-18 00:23:12', 1, 2),
('026a3325-4ecf-49ef-91c0-fa841060ab77', 'C1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'SFRDFDF', 3, 0, 1, '2025-06-16 07:19:04', '2025-06-16 07:19:16', 3, 1),
('030d4e24-8ce4-4064-bbf0-a561f0d0b96b', 'A2', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'DFDF', 2, 0, 1, '2025-06-16 07:23:17', '2025-06-16 07:26:32', 2, 1),
('07e929db-a422-4343-a7c8-db30560b79b3', 'A10', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'SDSDSD', 10, 0, 1, '2025-06-17 06:27:06', '2025-06-17 09:02:44', 1, 10),
('087521dc-6d2d-43bc-8aed-9130b0529590', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ÀDSFSDFSDF', 1, 0, 1, '2025-06-16 07:20:13', '2025-06-16 07:21:02', 1, 1),
('0dadc8f5-0619-4bd1-b7d6-18a1d24fbfa8', 'B12', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'fgfgfgfg', 3, 0, 1, '2025-06-16 08:53:25', '2025-06-17 07:45:48', 3, 1),
('0f2b99af-372e-4bb2-abd0-2cd49ecd642a', 'A1', '0d8ff987-987e-42b2-b718-94a19d73a89c', 'sdsdasdad', 5, 1, 0, '2025-06-13 08:49:47', '2025-06-13 08:49:47', 3, 1),
('1c668181-76e7-465e-ad68-1a99c7c62960', 'A1', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'QSEQWEWE', 1, 0, 1, '2025-06-17 06:22:08', '2025-06-17 06:25:18', 1, 1),
('1d6b65bf-e54d-4ae8-864b-d538da42df37', 'sdgajsdsddddfdwwđ', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'sdsdsdsdaaddđfdfsdfwwd', 14, 0, 0, '2025-06-16 01:39:41', '2025-06-16 01:39:41', 6, 2),
('1f070ced-5df3-487f-9b79-bde3b864a7fa', 'A12', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'SDFDSFSF', 12, 0, 1, '2025-06-17 06:27:19', '2025-06-17 09:02:44', 1, 12),
('210511bb-6ac1-4401-9982-66eb4dfe2b17', 'sdgajsdsddddfdww', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'sdsdsdsdaaddđfdfsdfww', 5, 0, 0, '2025-06-16 01:38:05', '2025-06-16 01:38:05', 5, 1),
('27f1fac9-d454-4749-9113-e918e2855772', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', '12SDD', 1, 0, 1, '2025-06-16 07:22:38', '2025-06-16 07:26:32', 1, 1),
('29c54210-497f-469f-8b00-0790d6d15876', 'A1', '8ff522d6-2844-4766-af4b-c7502d4a29a0', 'DSDSD', 1, 0, 1, '2025-06-16 07:44:03', '2025-06-16 07:44:04', 1, 1),
('29de88a5-316e-4784-81e5-2c558e1e1461', 'A6', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'FSFSFSF', 6, 0, 1, '2025-06-17 06:26:33', '2025-06-17 09:02:44', 1, 6),
('2c8979f4-b290-4915-9caf-6bbfde0663f7', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ABCXV', 1, 0, 1, '2025-06-16 05:55:03', '2025-06-16 05:55:26', 1, 1),
('2f533342-41d4-4391-a7f7-5f7feb588c7c', 'A3', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'ĐÂSDSD', 3, 0, 1, '2025-06-17 06:25:45', '2025-06-17 09:02:44', 1, 3),
('3436dfdb-660d-4d15-b094-872f4b908f95', 'vị trí 1', '00666034-fd0a-49d3-a5d2-f3fba4b27825', 'string', 1, 0, 0, '2025-06-11 02:21:15', '2025-06-11 02:21:15', 1, 1),
('3a034ff7-8a43-40fb-8263-d2c022629184', 'vị trí 1', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:22:44', '2025-06-11 03:22:44', 1, 1),
('3a57a233-cb7f-4dec-b089-f30678cb89de', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'EWEWQE', 1, 0, 0, '2025-06-17 07:45:59', '2025-06-17 07:45:59', 1, 1),
('3cefafeb-a49e-45db-9ce3-4c20c81265ab', 'B2', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ƯEWEQWE', 6, 0, 0, '2025-06-18 00:23:21', '2025-06-18 00:23:21', 2, 2),
('468e366e-3b9b-4362-a06e-7db7dae8d4c8', 'A9', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'DSDSDSD', 9, 0, 1, '2025-06-17 06:26:56', '2025-06-17 09:02:44', 1, 9),
('5d2e856d-5b00-465c-84fe-300e44b9f507', 'sdgajsdsd', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'sdsdsdsdaad', 2, 0, 0, '2025-06-16 01:35:04', '2025-06-16 01:35:04', 2, 1),
('65cf1214-f0d7-4165-b1a7-211d991f1adc', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ABCFG', 1, 0, 1, '2025-06-16 07:18:05', '2025-06-16 07:20:06', 1, 1),
('674f35c5-d54b-4414-99a3-ea0cea5c38a4', 'A11', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'ƯQWQ', 11, 0, 1, '2025-06-17 06:27:13', '2025-06-17 09:02:44', 1, 11),
('688a463e-9d77-445c-869d-11b4c2b34581', 'A3', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'RÊR', 3, 0, 0, '2025-06-17 07:46:14', '2025-06-17 07:46:14', 3, 1),
('72b3867b-c3aa-45fc-a917-64f1d2cc2727', 'A2', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ÊRER', 2, 0, 0, '2025-06-17 07:46:06', '2025-06-17 07:46:06', 2, 1),
('72b3a909-76f0-42c5-b212-57072c4fe68a', 'A4', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'SDSDASD', 4, 0, 1, '2025-06-17 06:25:52', '2025-06-17 09:02:44', 1, 4),
('746afb6c-cba9-41e8-b2c4-097addfabc9e', 'vị trí 1', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:21:17', '2025-06-11 03:21:17', 0, 0),
('75c187fc-9640-483f-b19e-7bd104461025', 'abxd', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'rferwerwer', 32, 0, 0, '2025-06-16 01:42:00', '2025-06-16 01:42:00', 8, 4),
('77c67ac7-59b7-4f1b-ab1b-dd255019a180', 'A7', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'FDFDFF', 6, 0, 1, '2025-06-17 06:26:12', '2025-06-17 06:26:24', 1, 6),
('799ed273-8168-4176-8c23-31e23d3e8e2b', 'vị trí 4', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:23:45', '2025-06-11 03:23:45', 1, 1),
('7a801c1d-88fe-4cdd-a8f3-4200193ee48c', 'vị trí 1', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:23:36', '2025-06-11 03:23:36', 1, 1),
('7b6d4fc5-ebb9-4a07-825a-cc41e7ba864b', 'a12', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'dđ', 1, 0, 1, '2025-06-16 08:51:49', '2025-06-17 07:45:48', 2, 1),
('7d7ba16d-7706-422e-afa2-14d0ec566d1d', 'A1', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'DSD', 1, 0, 1, '2025-06-17 06:25:25', '2025-06-17 09:02:44', 1, 1),
('7ff470b9-948b-4ba3-8e36-cc48c3a3ae16', 'abc', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'fafsdfsdfdf', 1, 0, 0, '2025-06-16 01:33:35', '2025-06-16 01:33:35', 1, 1),
('8011ec0a-87bd-42c1-9a25-4714b9c0c970', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ABCXYZ', 1, 0, 1, '2025-06-16 05:55:52', '2025-06-16 07:17:27', 1, 1),
('8a66c242-9838-4c2d-b081-4d4213e9f601', 'A13', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'EQWEQW', 12, 0, 1, '2025-06-17 06:27:28', '2025-06-17 09:02:44', 1, 13),
('8ad4f53a-f2ed-43d8-b57b-429d0f094392', 'Vị trí 3', '0d8ff987-987e-42b2-b718-94a19d73a89c', 'ABCXYZ', 4, 1, 0, '2025-06-13 02:52:24', '2025-06-13 02:52:24', 3, 3),
('8d4c32a9-88b7-4f4e-a8c6-ab3bcd60d80a', 'string', '8ff522d6-2844-4766-af4b-c7502d4a29a0', 'string', 0, 0, 1, '2025-06-11 02:35:17', '2025-06-16 06:08:48', 0, 0),
('8efa60f1-6ebc-43a2-98d5-005dfbfdcac2', 'A2', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'RFWEREWR', 2, 0, 1, '2025-06-17 06:23:25', '2025-06-17 06:25:18', 2, 1),
('909f2a86-42c6-4cc8-bef2-028bc0feb3cd', 'A2', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'ADASDA', 2, 0, 1, '2025-06-17 06:25:35', '2025-06-17 09:02:44', 1, 2),
('92682c32-b245-4146-a2c3-737624b75cb6', 'A7', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'DSDSD', 7, 0, 1, '2025-06-17 06:26:40', '2025-06-17 09:02:44', 1, 7),
('95385113-d6af-40d3-860d-f4402b813a34', 'sdgajsdsddd', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'sdsdsdsdaaddđ', 3, 0, 0, '2025-06-16 01:35:13', '2025-06-16 01:35:13', 3, 1),
('95b4fd1d-93da-44b0-80a1-3fb53a1b0dce', 'A3', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'FASFDF', 3, 0, 1, '2025-06-16 07:20:41', '2025-06-16 07:21:02', 3, 1),
('95d9f20d-988f-4694-ac46-d2a2da87f1c7', 'B11', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'SFAFDSFSF', 4, 0, 1, '2025-06-16 08:57:41', '2025-06-17 07:45:48', 4, 1),
('9ec14f6d-f6f0-46cb-8ae7-10d9bfea4b6d', 'A3', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ADASDSD', 3, 0, 1, '2025-06-16 07:24:08', '2025-06-16 07:26:29', 3, 1),
('a56527a1-ca4e-47ef-98f7-2d1a74580e56', 'A4', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'DFDSFSDF', 4, 0, 1, '2025-06-16 07:24:35', '2025-06-16 07:24:36', 4, 1),
('aa376590-4dda-412e-a8f0-64e59b4539b4', 'B1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ĐSSSC', 2, 0, 1, '2025-06-16 06:47:45', '2025-06-16 07:19:59', 2, 1),
('ad232d58-e671-4abe-92d7-c9596b071a4d', 'A4', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ÂFDSFDF', 4, 0, 1, '2025-06-16 07:20:51', '2025-06-16 07:21:02', 4, 1),
('aeaf1889-d9ff-4884-a440-4f9face6b0e3', 'A8', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'REWRWER', 8, 0, 1, '2025-06-17 06:26:49', '2025-06-17 09:02:44', 1, 8),
('afab857a-b97c-461b-b8d0-f92b364a14a6', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'QE', 1, 0, 1, '2025-06-16 07:21:48', '2025-06-16 07:21:57', 1, 1),
('b16b510d-3e61-4107-bb4b-1429414fc52f', 'A2', '0d8ff987-987e-42b2-b718-94a19d73a89c', 'sdsdasdad', 3, 0, 1, '2025-06-13 08:49:47', '2025-06-17 07:33:37', 3, 2),
('b3c89d52-7eee-4661-98f2-a12f89b60025', 'A1', '8ff522d6-2844-4766-af4b-c7502d4a29a0', '1234', 1, 0, 1, '2025-06-17 05:23:36', '2025-06-17 05:24:14', 1, 1),
('b4dc8fc8-4819-40c2-921b-c4e74e20a62a', 'A6', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'RẺWER', 6, 0, 0, '2025-06-17 07:46:35', '2025-06-17 07:46:35', 6, 1),
('b5960f75-a973-4763-85ec-cda156baa683', 'A2', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'FAFAF', 2, 0, 1, '2025-06-16 07:20:22', '2025-06-16 07:21:02', 2, 1),
('b92c7e5c-9f4e-4010-942d-03876e035845', 'sdgajsdsddddfd', 'e3cd6918-fce9-4cd4-89ce-6e2e8e8b13a3', 'sdsdsdsdaaddđfdfsdf', 4, 0, 0, '2025-06-16 01:35:20', '2025-06-16 01:35:20', 4, 1),
('bfc7d45b-2472-4f26-812c-321064dc5171', 'A2', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ABCXVD', 2, 0, 1, '2025-06-16 05:55:12', '2025-06-16 05:55:26', 2, 1),
('c051395d-31bd-4de8-8eaf-1647d4615e3c', 'Vị trí 1', '0d8ff987-987e-42b2-b718-94a19d73a89c', 'ABCXYZ', 1, 0, 1, '2025-06-13 02:51:51', '2025-06-17 07:33:29', 1, 1),
('ca57931a-2651-430a-99c3-6ace78c6083b', 'A3', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ABCXVDX', 3, 0, 1, '2025-06-16 05:55:18', '2025-06-16 05:55:26', 3, 1),
('cde31364-5a2f-4d6d-9f20-35724ac18e0e', 'vị trí 3', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:21:40', '2025-06-11 03:21:40', 0, 2),
('d79be025-12a1-417e-bd30-09b08ff31189', 'A5', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'FDSFDSFDF', 5, 0, 1, '2025-06-17 06:26:01', '2025-06-17 09:02:44', 1, 5),
('dad384e0-4b46-4e19-9ef5-9f0468101ae9', 'vị trí 2', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:21:27', '2025-06-11 03:21:27', 0, 1),
('db2c6723-9298-4856-9d6b-f6c59b0ce96d', 'a1', '8ff522d6-2844-4766-af4b-c7502d4a29a0', 'đsd', 1, 0, 1, '2025-06-16 07:46:11', '2025-06-16 07:47:49', 1, 1),
('e87c50d3-f676-458c-a6d2-5839db81c0c9', 'Vị trí 2', '0d8ff987-987e-42b2-b718-94a19d73a89c', 'ABCXYZ', 2, 0, 1, '2025-06-13 02:52:09', '2025-06-17 07:33:32', 2, 1),
('e9e341a6-f67f-445a-90e4-db1ac43499ce', 'A1', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'DFFF', 1, 0, 1, '2025-06-16 07:56:37', '2025-06-17 07:45:48', 1, 1),
('e9ec0cf7-5a28-4cdd-b3c9-843d20ba2229', 'vị trí 4', '6d077c81-1b70-41b7-964f-9ba55aa829ae', 'YAGDKSADASD', 1, 0, 0, '2025-06-11 03:21:57', '2025-06-11 03:21:57', 1, 1),
('f0b9eea1-a5f7-4ce9-93b4-8365fc8476fe', 'A4', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ĐFSDF', 4, 0, 1, '2025-06-16 07:25:27', '2025-06-16 07:25:29', 4, 1),
('f3651ace-af79-4bce-9832-45966e019c22', 'A1', '6016d2ae-fb56-4140-bed4-82ea3a804968', 'dfdfsf', 1, 0, 1, '2025-06-17 01:37:43', '2025-06-17 01:37:48', 1, 1),
('f7462730-8409-4344-86c1-8eefe0e926e4', 'A5', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'RRWER', 5, 0, 0, '2025-06-17 07:46:28', '2025-06-17 07:46:28', 5, 1),
('fa7aa369-353c-46a7-abe2-bf9ae6208ea1', 'A4', '6c7b8b60-bf1c-4cf6-a640-4de141537707', 'ÊREWRWER', 4, 0, 0, '2025-06-17 07:46:22', '2025-06-17 07:46:22', 4, 1),
('ff2fc306-c806-4dfc-8540-519b65e3e0e9', 'A1', '8ff522d6-2844-4766-af4b-c7502d4a29a0', 'SFSF', 1, 0, 1, '2025-06-16 07:41:07', '2025-06-16 07:41:08', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
('3337a05b-300e-4dde-a098-f243afb0f057', 'Vô thời hạn', 0, '2025-05-17 06:01:37', '2025-05-17 06:01:37'),
('b6f06280-3737-424f-bd5e-67eb5aed99ea', 'Trả trước', 0, '2025-05-12 07:29:33', '2025-05-12 07:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_left_value` int NOT NULL,
  `role_right_value` int NOT NULL,
  `role_max_number` int NOT NULL,
  `license_id` char(36) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `code`, `role_name`, `role_left_value`, `role_right_value`, `role_max_number`, `license_id`, `created_by`, `is_deleted`, `create_at`, `update_at`) VALUES
('017a19d0-c789-4960-acc4-e2856ecdc6c4', '', 'test3', 14, 15, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:56:45', '2025-04-22 00:56:45'),
('061cb1b1-6d62-46f9-ad08-810e8438bf66', 'TC_173656', 'Kiều abc', 112, 113, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 02:49:47', '2025-06-17 02:49:47'),
('073d6a20-3971-41da-8527-f3f44118d595', 'TC_809278', 'test sắp hết hạn', 78, 79, 20, 'a2b29a42-5172-447e-8478-d0f181faaad1', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 08:11:07', '2025-06-14 08:11:07'),
('082b5d56-15f8-4435-a113-fc7fcf963fc2', 'TC_756885', 'Trial Key 17/6', 102, 103, 10, 'f733123a-1bb0-459a-b2de-2a08c00dc1c0', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 00:38:34', '2025-06-17 00:38:34'),
('08fea5c9-1e1b-46c2-aab4-f8348bbb4961', 'ADMIN_DUY', 'ADMIN_DUY', 2, 3, 30, 'a27e7319-35f5-48cd-8cfa-bc0563c63dec', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-18 09:00:24', '2025-04-18 09:00:24'),
('0ecd20e6-f349-4f97-a405-4bda325b45f4', 'TC_397753', 'Gói chức năng nâng cao - Khách hàng trường Cao đẳng THACO', 98, 99, 8, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:44:28', '2025-06-16 05:44:28'),
('118f1cee-7fbf-43d0-ac16-94232cdd6ab1', 'TC_543420', 'testcđ', 108, 109, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 02:11:31', '2025-06-17 02:11:31'),
('17aad2cb-1716-4a49-9796-b41398ede512', 'TC_731814', 'Gói chức năng - cấu hình', 80, 81, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:40:33', '2025-06-16 05:40:33'),
('181ad901-d797-4d9f-b4a3-71a04fb24971', 'TC_772284', 'test28', 36, 37, 30, '2d80cab0-95d4-4c7d-8983-48b1c4db107f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:47:08', '2025-05-28 08:47:08'),
('1929b8c5-a3a5-420d-afff-6108fc573a2b', 'TC_860738', 'gói chức năng 6/3/2025', 50, 51, 30, '27860cff-ed53-4e93-b89f-14d599ab25f0', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-03 05:46:07', '2025-06-03 05:46:07'),
('19c8d03d-c7c3-4d75-9a36-8788d97da71c', 'TC_292025', 'Gói chức năng - quản lý', 82, 83, 30, 'bde79f4a-c345-47a0-b915-b05ca98463d1', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:40:47', '2025-06-16 05:40:47'),
('1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '', 'test1', 10, 11, 11, 'a087508f-a487-4cf7-a2c3-07d593ee8d3c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:53:36', '2025-04-22 00:53:36'),
('1dfe0b21-1968-49de-9d52-9573b06892c0', 'TC_525841', 'TEST', 104, 105, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:39:17', '2025-06-17 01:39:17'),
('1e9adb00-716c-4007-a154-0ba999ec1904', 'TC_125664', 'Test sắp hết hạn', 78, 79, 20, 'd9cc0de1-5ace-4b53-b06a-cfb179cf1c61', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-14 08:09:01', '2025-06-14 08:10:54'),
('23e6c60c-9f64-4cb3-871c-02370771bb95', '', 'test4', 16, 17, 10, '8d9c5380-3634-4ab6-8c96-ddfb1883c4a4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:57:14', '2025-04-22 00:57:14'),
('27f53400-7015-4eb2-a4db-abaa6d5f4f1f', 'TC_136631', 'test', 34, 35, 10, '2010e3a8-e184-47d0-81b1-dc9264e238a8', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-28 06:06:45', '2025-04-28 06:06:45'),
('288a0fcf-a138-43e5-999c-bd150773b1e4', '', 'www', 18, 19, 10, '1b79a8d6-1e0c-41cb-8e8c-6e9f84322494', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 00:57:53', '2025-04-24 03:40:18'),
('2f63866d-53ba-4ac6-b56c-074e1864c027', 'TC_785422', 'gói chức năng (kiểm tra thông báo mail)', 46, 47, 50, '1c75da86-5b32-452d-bb38-fa6ed919bc85', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 06:51:18', '2025-05-29 06:51:18'),
('33fa8ee1-96c6-414b-99e4-cf8e53fee02c', 'TC_416361', 'test13', 32, 33, 10, 'fa5dd47f-d14c-4622-b4d7-3157152d23dc', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-26 02:38:34', '2025-04-26 02:38:34'),
('3b8d96f1-ba83-41e1-9837-26d52535a129', 'TC_919381', 'testkieu1', 46, 47, 10, 'efaba6b2-b92f-44bf-9a95-a0d44388857a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-05-29 06:37:12', '2025-05-29 06:47:28'),
('3bd8416d-1d88-4952-9f49-b077b20048bd', 'TC_739047', 'Gói chức năng ADMIN', 100, 101, 5, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:45:02', '2025-06-16 05:45:02'),
('42258027-6e17-4c44-ba5b-227322583e6f', 'TC_476647', 'gói chức năng (test hết hạn)', 48, 49, 50, 'aa50e5de-defe-41ef-9409-a7683f51d566', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 07:02:27', '2025-05-29 07:02:27'),
('46a774e8-99a3-404e-a1aa-d8445b3cc2e4', 'view_duy', 'view_duy', 4, 5, 10, 'b1d54254-3046-4483-a446-851ccc1d7575', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-19 00:42:15', '2025-04-19 00:42:15'),
('49713563-730c-42ac-aadd-708767257d13', 'TC_602402', 'Linh Test 5', 76, 77, 20, '2c896fff-0a6e-4c02-88c3-2f47169470d8', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-14 07:56:10', '2025-06-14 07:56:50'),
('5c0df41d-fd4a-41ae-bea4-62242e06b2e0', 'TC_723910', 'Gói chức năng cơ bản - Khách hàng Industries', 88, 89, 30, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:42:18', '2025-06-16 05:42:18'),
('5d905b5a-8024-441e-9e2a-912fbe001367', 'TC_721760', 'Gói chức năng - Cấu hình hệ thống', 58, 59, 20, 'cfc0f50d-9386-4798-b623-7808a69375b6', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 08:49:06', '2025-06-10 08:49:06'),
('5e47e5f7-f64b-41ce-a799-5e2777c30f88', 'TC_241952', 'test11', 28, 29, 100, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-26 00:55:27', '2025-04-26 00:55:27'),
('5e9356b9-6962-4687-b02e-c78ff8effba9', 'TC_174864', 'gói chức năng test 10/06', 56, 57, 10, '41c72442-b881-492b-ba7f-b11c07794f18', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 08:38:16', '2025-06-10 08:38:16'),
('61c69812-49de-45de-bbe7-dad811a3a08d', 'TC_999452', 'test10', 32, 33, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:33:16', '2025-04-24 03:38:34'),
('67811d29-e1fd-41c5-b8d4-c1b389f35a70', 'TC_268905', 'test', 52, 53, 123, 'b9327008-6697-4468-aa5e-a270dd482208', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 08:15:01', '2025-06-10 08:15:01'),
('6be7b809-5736-4697-8c00-94f0e4f57fc7', 'TC_290881', 'test1', 26, 27, 10, '9c679899-f9e4-4fef-b0dc-099f44b749d7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 07:57:25', '2025-04-22 07:57:25'),
('7179cb51-63df-4f1b-b4ca-b9475491bf9a', '', 'ddd', 20, 21, 20, '82bfe409-cf38-45f5-bcda-f4db6859cd7a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 01:14:24', '2025-04-22 01:14:24'),
('774fe6d5-34dd-4e99-8e7c-23017d01a11f', 'TC_315639', 'testkieu', 44, 45, 10, '33ac70e5-b1a1-43c7-b856-3197fa0a978f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 06:36:52', '2025-05-29 06:36:52'),
('77658513-c248-46ee-9013-69786eee0264', 'TC_939413', 'Linh test 5', 76, 77, 20, 'db862a76-0ff8-4762-b540-8f3dc6ca376e', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-14 06:43:43', '2025-06-14 07:55:52'),
('7b6c108e-eb25-493d-a62e-411f14e26ea5', 'TC_813050', 'Gói chức năng test hết hạn', 52, 53, 120, '25a9c3ca-4964-4c74-943c-f07d53852574', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-10 07:55:57', '2025-06-10 08:05:26'),
('7cd13cd9-ba82-4c12-b513-8e36478c1fe5', 'TC_218752', 'abc', 22, 23, 10, '8e149595-622f-4dc9-afed-7d61e33d8f98', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 01:25:48', '2025-04-22 01:25:48'),
('7e473757-404a-4ff0-a246-a1340e18e649', 'TC_325407', 'test11', 28, 29, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 04:05:26', '2025-04-24 04:05:33'),
('7ed9c61e-d591-4deb-9af6-7a47d0dd2816', 'TC_659268', 'test', 24, 25, 10, '5a9acc48-90e3-4b26-9f9c-a9ef1f841df1', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 07:57:17', '2025-04-22 07:57:17'),
('81b3eeaf-1e3b-443b-87d1-760d6f61f7b2', 'TC_262100', 'Linh test 5', 76, 77, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 07:57:06', '2025-06-14 07:57:06'),
('826e7157-513f-400e-83d6-b9648c932432', 'TC_857054', 'test vô thời hạn', 28, 115, 500, 'b77eb935-863a-4f9f-bf58-8329ac488615', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-23 06:50:55', '2025-04-23 06:50:55'),
('860bc1dd-520f-4d41-9ddf-f2f5776ef667', 'TC_579761', 'Test trial key', 54, 55, 120, 'fccb31f0-318f-4d62-bd8b-529834be8539', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-10 08:17:39', '2025-06-10 08:29:08'),
('8674d8c1-ccb8-4653-8da8-6fc48e0ceded', 'TC_688444', 'test hết hạn', 78, 115, 20, '20d38b36-c9bd-4d7d-924b-69767fa77d0d', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 08:09:38', '2025-06-14 08:09:38'),
('8a5870d6-2141-4557-969c-c9300751c136', 'TC_894020', 'Linh test 4', 74, 75, 20, '5b672b65-5751-405b-ac6f-951944c74d4d', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 06:42:54', '2025-06-14 06:42:54'),
('8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', 'TC_408759', 'abc', 38, 39, 50, 'bf3cea72-f417-4433-a20b-1ccc8929c358', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 09:16:08', '2025-05-28 09:16:08'),
('924f4154-86ff-4d6d-a160-e6fbbb84dee3', 'TC_769586', 'Gói chức năng test hết hạn', 52, 53, 120, '9599c671-58ee-4b31-8118-ac49607a5dae', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-10 08:05:47', '2025-06-10 08:14:42'),
('92930a6c-ff6b-4643-baad-d11d017a6690', 'TC_658340', 'Gói chức năng nâng cao - Khách hàng THACO INDUSTRIES', 96, 97, 25, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:44:07', '2025-06-16 05:44:07'),
('9457df71-73ab-44cb-aaf2-67210a97ba2b', 'TC_783141', 'Gói chức năng- người dùng', 84, 85, 20, 'd730862f-9380-4865-a013-32b17308075c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:41:19', '2025-06-16 05:41:19'),
('9478e463-297a-4001-80d5-174e5888497a', 'TC_557757', 'test12', 30, 31, 10, '279124c0-8bf6-4d0b-b77d-f4d7b202f403', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-26 01:05:52', '2025-04-26 01:05:52'),
('9bfd0fc7-21df-4f1f-b326-f412f72f261d', 'TC_986743', 'Gói cơ bản 02', 42, 43, 40, 'af337ff6-a61a-4f7f-bc16-70b01a77abb9', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 02:48:24', '2025-05-29 02:48:24'),
('a3055ca3-1b69-41dc-85b0-784b6d7e8988', 'TC_474072', 'Linh Test 1', 68, 69, 20, '8ca09d26-bd19-4402-adba-345a436b025b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 06:19:27', '2025-06-14 06:19:27'),
('a3549215-4f8e-44b1-be0c-8cf7b1749c09', 'TC_610805', 'test_trial', 60, 61, 10, '338a9b27-c3ef-4de5-8b89-dbf5e4df859c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-11 01:10:22', '2025-06-11 01:10:22'),
('a81040c2-07d6-47b3-acb7-d18059e6935b', 'TC_621878', 'ABC', 106, 107, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:41:18', '2025-06-17 01:41:18'),
('ab36d147-9c63-40e6-8ce3-dd7f691e7d88', 'TC_514873', 'test_trial', 66, 67, 10, '49b1e54e-6477-40e7-8c0e-7711c394c911', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-13 06:36:58', '2025-06-13 06:36:58'),
('ad4c32eb-120f-4d88-87c4-b5c1d307129c', 'TC_544131', 'test', 110, 111, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 02:49:37', '2025-06-17 02:49:37'),
('ad763596-eb05-4a41-a19c-e07bf2f5db43', 'TC_679289', 'Gói cơ bản 01', 40, 41, 30, '40788de1-1caa-4bc6-9682-b031980c4be4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 02:46:01', '2025-05-29 02:46:01'),
('b189322a-4ae4-4ce1-8532-e51552bf0a09', 'admin_duy', 'admin_duy', 6, 7, 30, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-19 07:47:44', '2025-04-19 07:47:44'),
('b58d3814-3c74-42dc-81ba-92fb4971ac29', '', 'test3', 12, 13, 0, 'd4a9dec4-0d05-4342-bb32-1766d787abbf', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:56:02', '2025-04-22 00:56:02'),
('b66f81ea-5f7f-4273-ad21-92ebb420ddb3', '', 'test', 8, 9, 10, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:52:12', '2025-04-22 00:52:12'),
('b8b854c1-f6a7-4c83-946d-afb3ce37eca0', 'TC_149777', 'Gói chức năng cơ bản - Khách hàng trường Cao đằng THACO', 90, 91, 17, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:42:50', '2025-06-16 05:42:50'),
('bd9766f9-1f75-4227-a9e0-3de48f052efa', 'TC_143950', 'gói chức năng01', 46, 47, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-05-29 06:48:06', '2025-05-29 06:48:12'),
('c69b0d76-d788-4908-8a1b-0a7e198b6a7f', 'TC_639734', 'test_trial_key', 62, 63, 11, 'a85e4ef7-3361-4593-a35a-b6c8c3ce16bb', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-11 01:11:57', '2025-06-11 01:11:57'),
('c7e35969-2279-420a-88ca-efa5de5abfbb', 'TC_494867', 'test trial key (10/6-10/7)', 54, 55, 120, '5cfefeca-509e-46bb-b930-f1b0f479b894', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 08:29:35', '2025-06-10 08:29:35'),
('d47297af-916b-405a-9e96-7f1118d4a588', '', 'test3', 18, 19, 10, '5993850b-8034-4ba9-96f4-19ae204929da', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-22 00:59:18', '2025-04-22 00:59:18'),
('d73a1a35-db19-4b9f-af04-8fcb926ed3d0', 'TC_905988', 'Gói chức năng cơ bản - Khách hàng THACO', 86, 87, 30, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:41:57', '2025-06-16 05:41:57'),
('dca022b6-44ac-4384-8e05-f1f141a15dcc', 'TC_588229', 'Linh test 3', 72, 73, 20, '3b773074-8e8a-40ac-84f4-7d9eae39a7f0', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 06:42:28', '2025-06-14 06:42:28'),
('de0de5df-0372-4d84-b59b-b5fcbbca058c', 'TC_221675', 'Gói chức năng nâng cao - Khách hàng THACO AUTO', 94, 95, 30, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:43:49', '2025-06-16 05:43:49'),
('e2fcdbe0-a79e-453c-9388-b87606f3d918', 'TC_226520', 'Gói chức năng nâng cao - Khách hàng THACO', 92, 93, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 05:43:11', '2025-06-16 05:43:11'),
('eb6d9850-2b77-47fc-ae2a-0a0ba9842280', 'ADMIN', 'ADMIN', 1, 114, 999999999, '3375f96b-dcc5-492a-ab49-cb3b0af401a1', '', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('edc17c01-480a-4501-9dd6-fd8da999f1e0', 'TC_508253', 'Linh test 2', 70, 71, 20, '', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 06:42:04', '2025-06-14 06:42:04'),
('ee0cac60-57f4-402e-afc0-6badd6898bc9', 'TC_240644', 'test_trial', 64, 65, 11, '91184bae-c5f3-46a5-b7d4-52efdcac2b23', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-11 01:12:44', '2025-06-11 01:12:44'),
('ef66dda4-8ab7-42b1-8d90-aed44fbc713b', 'TC_856555', 'gói chức năng (kiểm tra thông báo mail)', 46, 47, 50, '28d8df88-bddf-4120-8eb9-a59d8fe41ae8', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-05-29 06:49:26', '2025-05-29 06:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles_menu`
--

CREATE TABLE `roles_menu` (
  `id` char(36) NOT NULL,
  `menu_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `list_method` json NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles_menu`
--

INSERT INTO `roles_menu` (`id`, `menu_id`, `role_id`, `list_method`, `is_deleted`, `create_at`, `update_at`) VALUES
('0133c184-fc49-4c61-81fa-a7973737e7e1', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('03436d54-6aaf-4e57-896f-53a4cd69d47d', '72d64a0c-e800-402e-901f-a0f135caa367', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('048e9cc9-fee2-4162-9e4c-7ebf3a04c087', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:49:44', '2025-05-29 06:49:44'),
('05b0429b-6fcd-4883-9186-e1122ce275b0', '536660d4-59fe-40c2-952d-578edc4e3ee6', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-25 00:54:09', '2025-04-25 00:54:09'),
('05de3f41-66aa-4d89-b4f2-bbbe9b9b5b37', '50ecc00f-615e-4da5-9e72-1d36039ada51', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('07264114-90ec-443f-bee0-130cad071dbc', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:10:04', '2025-06-14 08:10:04'),
('0a7c34ca-3ecb-4b04-8ac5-39ae65b577ae', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '1e9adb00-716c-4007-a154-0ba999ec1904', '[\"POST\"]', 0, '2025-06-14 08:10:11', '2025-06-14 08:10:11'),
('0affaafe-9a70-4b24-9eea-d0a9b091582f', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('0c849d11-6339-4d0f-afb4-7ed26686e37c', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '924f4154-86ff-4d6d-a160-e6fbbb84dee3', '[\"POST\"]', 0, '2025-06-10 08:14:33', '2025-06-10 08:14:33'),
('0d5e2191-c7bf-42d1-a314-db89b5464202', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:45:27', '2025-05-28 08:45:27'),
('0de1e746-f854-4add-8698-112da71c3fe4', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('0e92ea7b-f101-45cb-ac19-dc50ffa0091b', '50ecc00f-615e-4da5-9e72-1d36039ada51', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('0f389564-0369-4d6a-b300-3a8b52317665', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('0ffe8813-1024-4f82-a572-604267015f99', '72d64a0c-e800-402e-901f-a0f135caa367', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('1033eb18-5591-42d9-927a-61dc1bdbe6e2', '2aba54f7-71a2-44f9-8917-4d2e53868d11', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('10c3c712-7a69-4a3d-bf26-d3053f3cec25', '50ecc00f-615e-4da5-9e72-1d36039ada51', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('1104ca1c-7ea3-4cef-9063-9e0a468257b4', '46062e61-51a5-4fab-81af-d169c50e060e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:37:00', '2025-05-28 08:37:00'),
('119ee657-e2a4-4ca3-8525-548383fee193', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('11bf81ff-4321-49f6-85a1-0475d468133a', '77edc260-bf6d-4b97-95cf-df90b0f01be9', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('125d5cca-d12b-4e9f-9299-21c7d3e04fce', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('16bb5305-4a2a-401a-b575-839c17ab153a', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('1990eb4b-de8b-408e-9024-d11a40432f8c', '759df5a6-6377-4e16-84ea-896cabcd9698', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:42:36', '2025-05-30 02:42:36'),
('1ad3c9b4-107c-4a05-9602-d4cf4b609ac6', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('1c33ba04-82af-4266-9cab-97e724578f43', 'c60dc41b-e454-4df2-887a-4a8359d45404', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"DELETE\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('1cd378bd-3242-442e-abd6-67d256a55e64', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:10:04', '2025-06-14 08:10:04'),
('1cfe8ade-9ba3-474a-b249-8176f041ff76', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('1e853ced-bfbb-4d10-924f-78c8ca819830', '222df954-2cba-4a66-9d4c-189f3101d335', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 02:06:06', '2025-04-19 02:06:06'),
('1f3ceb64-e300-49e0-9a65-c9f10a1b9a85', 'ea59e39d-8552-4993-8f30-7de9930da03f', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('2362fe29-8698-4720-a480-42fd246c9085', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('2364346e-0a81-4c5f-a5eb-4d64533567a0', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('264d5cfa-b5f7-4d22-8d02-37c146d43a03', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('2715ec35-fc38-4259-9790-c9f241700f1e', '9b8f6794-42dd-488a-b853-78bc1643b84e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 07:33:26', '2025-04-19 07:33:26'),
('27273165-7624-4c19-b8ea-7e62f8c844ce', '2aba54f7-71a2-44f9-8917-4d2e53868d11', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('27274574-7822-4790-95f9-e3b1eac69561', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:17:22', '2025-06-16 07:17:22'),
('273d1b3a-d1db-445a-8efe-054cecce9702', '5585915a-5f7d-44d3-ac22-f25336d82cfc', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:30', '2025-04-28 06:05:30'),
('295229d4-8d89-477f-8285-60513f98977c', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '073d6a20-3971-41da-8527-f3f44118d595', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('2a5672fd-bb60-4855-8400-258186f236ea', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('2a5f5693-53da-4eca-82fa-8dc07f02e7d9', 'dd8fb4f2-1c47-466b-adf6-13dd9cb7e06f', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('2adfc64e-d919-439d-8791-92c20d0fc805', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '1929b8c5-a3a5-420d-afff-6108fc573a2b', '[\"POST\"]', 0, '2025-06-10 08:43:12', '2025-06-10 08:43:12'),
('2b0912c1-2c05-4cae-a379-689d7b9ef33b', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"PUT\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('2d709cda-f6c0-4038-89c3-f1d29a78febe', 'c60dc41b-e454-4df2-887a-4a8359d45404', '826e7157-513f-400e-83d6-b9648c932432', '[\"DELETE\", \"PUT\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('2d9039e0-c7a7-4f6d-9501-c0c1c2c5a1c1', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('2e658063-da3a-4e87-91cc-7f2675812a22', '658daa92-0369-44ad-9a41-0bfccb6e6214', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-03 00:58:35', '2025-06-03 00:58:35'),
('2eafe31c-b09b-42a2-9450-1ab55f9897c3', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-19 00:48:37', '2025-05-19 00:48:37'),
('2ff04655-2216-4ab6-b46a-acd13ac433bf', '3ee662bb-a780-43da-bf57-235422075f31', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:26', '2025-04-28 06:05:26'),
('3073e453-e97a-4178-b80a-054ca2b08b88', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('32542410-7550-4dc5-92ac-0238ce63ed13', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '67811d29-e1fd-41c5-b8d4-c1b389f35a70', '[\"POST\"]', 0, '2025-06-10 08:15:26', '2025-06-10 08:15:26'),
('3291231b-a9e4-4e8c-b714-8f6cc4482cef', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '77658513-c248-46ee-9013-69786eee0264', '[\"POST\"]', 0, '2025-06-14 07:56:34', '2025-06-14 07:56:34'),
('32c3dce2-f325-4314-b3ca-5d07296b2c3c', '46062e61-51a5-4fab-81af-d169c50e060e', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('32edf666-5f80-4a84-9a8a-0ac3edb976cc', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:10:11', '2025-06-14 08:10:11'),
('330ec167-00b2-4894-bf6a-b7d6abdd5dc6', 'dbc455ca-80a7-42fd-bb4f-22459244a734', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('334b3843-2769-4e0c-ad9c-ff9d2465be71', '72d64a0c-e800-402e-901f-a0f135caa367', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('339ebd22-cc9c-4b36-b17f-8a178c83d09a', 'ea59e39d-8552-4993-8f30-7de9930da03f', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"PUT\", \"GET\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('33b86c2b-352b-4ab9-9220-ba1e4b858dde', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '77658513-c248-46ee-9013-69786eee0264', '[\"POST\"]', 0, '2025-06-14 07:55:42', '2025-06-14 07:55:42'),
('340502eb-25e6-4d15-9342-0bfb7350fce4', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('3573215a-4d2b-4bee-8ea8-6e35cb4e48bb', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('3692385c-27ab-4535-94cf-0339d607e46c', '1aedb859-d6bf-4227-81ad-3ab76b8fa0c0', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:39:07', '2025-05-30 02:39:07'),
('369f54a1-300a-4ded-9ab0-b37e71cdc3e6', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('369f54a1-300a-4ded-9ab0-b37e71cdc3e7', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('369f54a1-300a-4ded-9ab0-b37e71cdc3e8', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('369f54a1-300a-4ded-9ab0-b37e71cdc3e9', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('37300b6c-17d0-42d7-ba3b-ea63c8925968', '50ecc00f-615e-4da5-9e72-1d36039ada51', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('383d5469-e124-4f30-bd19-299404d3419f', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('38854998-45f0-4403-9abb-1d76a13e9b10', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"GET\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('39254835-097d-4096-84c5-43d54939f803', 'f4edbb71-155c-4714-af9d-a82ab464ffbd', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:48', '2025-04-28 06:05:48'),
('39498d4d-72e1-4391-bc67-36a90c732d83', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '181ad901-d797-4d9f-b4a3-71a04fb24971', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:47:30', '2025-05-28 08:47:30'),
('394ea13b-1011-47e7-b37f-ee842d2ba867', '68b1770e-b090-4eda-85d1-9ed0c105b322', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('3a2a0aea-acaa-41c3-b3b2-fdeb40df6e6a', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('3c301159-8e8f-431a-9484-485eb5d35172', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('3c937cf5-22ea-46b9-bf0b-fae8377602a1', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '5e9356b9-6962-4687-b02e-c78ff8effba9', '[\"POST\"]', 0, '2025-06-10 08:52:29', '2025-06-10 08:52:29'),
('3d8bec6d-f6fa-422a-9069-e5282d53f16a', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '826e7157-513f-400e-83d6-b9648c932432', '[\"DELETE\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('3faba32c-198f-4294-8b40-fd3b371db670', '72d64a0c-e800-402e-901f-a0f135caa367', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('3fbb197b-21e5-4add-b8d1-f1c03b5f1257', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('40727820-c3e0-4ac3-ab4c-8112ed889152', 'b7c3054d-22d3-4711-8cc2-4f1c31441117', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-14 07:24:12', '2025-05-14 07:24:12'),
('40910d97-acf4-41c8-b154-1df9c738336c', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '826e7157-513f-400e-83d6-b9648c932432', '[\"POST\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('4282571b-285a-4914-9931-7bda15b65ed8', 'ea59e39d-8552-4993-8f30-7de9930da03f', '826e7157-513f-400e-83d6-b9648c932432', '[\"DELETE\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('43040cb1-a6a3-48ea-800d-00802e41d755', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('43a051d7-d292-45a2-b0d2-4f5871c2a352', '72d64a0c-e800-402e-901f-a0f135caa367', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-14 07:39:14', '2025-05-14 07:39:14'),
('451dd63b-f3dd-4348-b0a6-23588f6d0de4', 'f995c0cf-1fda-44e4-93aa-29f3019f6842', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 07:09:19', '2025-05-30 07:09:19'),
('475d1f4e-7788-49fd-a63f-1ef1911d89cd', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '1e9adb00-716c-4007-a154-0ba999ec1904', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('47d87f64-241e-43a3-aa39-2675ff35cb88', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('489fa235-af2f-40da-915d-a241cad070e2', '894fecab-bd0b-4463-9d53-c3fb166b296e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-10 01:37:19', '2025-06-10 01:37:19'),
('48f10dd2-5013-48e9-82b9-dc9f08cc71e3', 'ea59e39d-8552-4993-8f30-7de9930da03f', '7b6c108e-eb25-493d-a62e-411f14e26ea5', '[\"GET\"]', 0, '2025-06-10 08:14:33', '2025-06-10 08:14:33'),
('49980d74-c570-4ace-9700-d38192133ec6', 'ea59e39d-8552-4993-8f30-7de9930da03f', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('4a86f271-2670-40de-a669-c3671c48f22c', '2df656bc-dcd7-4738-ab98-30967aea446c', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:35', '2025-04-28 06:05:35'),
('4b566504-3b90-4aab-a904-47c887d7a138', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-14 06:00:18', '2025-06-14 06:00:18'),
('4dbad50f-1cff-442d-8078-c73b3d8e3b9d', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('4e15c012-b1ce-40c0-9cae-e1f5e0a921a1', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('4ecc03b1-5a68-45e2-8cbd-bdd588454632', 'e39e92d5-7622-4053-88d1-f90229aa3341', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:40:52', '2025-05-30 02:40:52'),
('4f750f9a-57bb-4a68-b8b7-45f766b44c03', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('5147d816-d850-4835-8b33-ddd120b6a0e5', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('51751ad7-6e0d-4e2d-b04e-f4664a270e62', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:10:11', '2025-06-14 08:10:11'),
('51d89f06-cf3c-49c0-a1ac-33745c5280e6', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-25 01:24:03', '2025-04-25 01:24:03'),
('52934ece-b274-4282-95e8-79e9fe5072c4', '226f93ac-233a-47fe-a246-c09775819fc2', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-10 01:26:50', '2025-06-10 01:26:50'),
('536be49e-b09a-4792-ba13-c75994138418', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-14 05:50:22', '2025-06-14 05:50:22'),
('5425787e-7e0b-4378-aa81-9576277e7941', '72d64a0c-e800-402e-901f-a0f135caa367', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('54954464-58df-47f0-88ea-594399467d18', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('55e9aa1c-40ed-429e-b5e1-f39a88c54b2a', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '[\"PUT\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('5754968d-ef0d-4d91-ac71-4c565810669b', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('59204fe3-bd69-41f1-ad5b-f1928db626cf', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('598668a9-f40f-4e35-b8fd-99b918be8033', '2aba54f7-71a2-44f9-8917-4d2e53868d11', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('59df297d-db75-4f35-afa3-b29ab175a9a8', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('5ac5ea4d-9dff-4128-b557-066cbba0fe7e', '27ceb830-a256-4e69-8553-908d90cfd89c', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:42', '2025-04-28 06:05:42'),
('5b029ab4-962d-4c7f-96e5-1e9a6529cf4b', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('5b853fa7-e71f-4d57-ad2a-4dbb62752e4d', '342cad9e-44a1-490f-8495-3253a462cd48', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-10 01:36:46', '2025-06-10 01:36:46'),
('5d264aae-1319-4937-9931-91a52c9055e3', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '017a19d0-c789-4960-acc4-e2856ecdc6c4', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('5d9ccc23-5988-44f6-a4cc-4bb60c7780f4', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('5dc18296-38b0-4405-90c2-eaa9174fa2a7', 'ac28b692-5e99-4b6b-bcc0-7b87896230df', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-26 04:23:23', '2025-04-26 04:23:23'),
('5f29f9f4-3a39-4ec4-b3a6-710479a71a2e', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"DELETE\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('5fed74bc-783b-45fa-9f2b-4cbc5d85c1bf', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:49:44', '2025-05-29 06:49:44'),
('60c92547-a552-46f7-9fc0-7e148a2df6b9', '026b0c57-40a7-4ff5-ba40-31feb9b77b68', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-10 01:24:12', '2025-06-10 01:24:12'),
('619649a1-755b-4f69-8363-7018f4e265d1', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('61aaa63c-54dc-405e-9cbd-481552bf0a00', '68b1770e-b090-4eda-85d1-9ed0c105b322', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('6261358c-c442-4e4d-ba55-ac625c458cf1', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"POST\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('62c47a59-9930-42d5-ad60-279929311bef', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('6445bb0b-3719-4304-89d1-7dcbbab66317', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('6468bd45-6d48-4f60-82ec-f57fae3e2c1d', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('6493aa18-aad7-4c5c-a782-77babbd0fc37', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('6599cd8b-8509-4e11-8fcc-678e5e3add45', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"PUT\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('65a68571-1012-4b39-9715-61cc0dc9461c', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('65f75a9f-35ea-4da6-b5e0-be4087f17846', '50ecc00f-615e-4da5-9e72-1d36039ada51', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:17:22', '2025-06-16 07:17:22'),
('6733b577-caac-49be-bc84-49a371e5322c', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('68b082e7-d3e6-432b-a52b-b99c79513f34', 'd15947b0-cccf-40ce-a640-7fb6f6f85fa3', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 03:01:46', '2025-04-19 03:01:46'),
('68f94deb-9dc5-4479-b9ee-fcba3c2fd450', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:49:44', '2025-05-29 06:49:44'),
('69c00e0e-d91e-44a7-82d3-b0275eaca67d', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:46:11', '2025-05-28 08:46:11'),
('6a3a6806-5c4d-44c2-b2d3-4ceae6f485d4', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('6b724d00-6200-46ce-b3e6-06acf8656672', '72d64a0c-e800-402e-901f-a0f135caa367', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('6b814cae-b098-4a73-9d1d-b366c29cc013', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"GET\", \"PUT\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('6b8f61bb-c438-47fa-aa9e-10b4907025a8', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '826e7157-513f-400e-83d6-b9648c932432', '[\"DELETE\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('6d6ce2ac-a299-4a05-877c-78209d05a2ea', 'ea59e39d-8552-4993-8f30-7de9930da03f', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('6d7be6d0-299c-4443-b0ef-a10667a30ac4', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('6e8a42d5-2ae0-46a8-bf65-1c6c8c284e1c', '47ee0436-6ab4-4f9f-9b21-935b0f3a339d', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 03:03:37', '2025-04-19 03:03:37'),
('6eded6dc-382b-430c-b349-cf3a20a1da58', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"PUT\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('6f265140-94bd-4345-a5b7-7f0895478806', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('6f659588-765a-4008-b9d5-6e56c9230422', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('6fef88d4-9f0e-425f-a79e-da2fd0706c12', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:17:22', '2025-06-16 07:17:22'),
('72d3337d-2cca-47da-a108-7b2ed430b13a', '50ecc00f-615e-4da5-9e72-1d36039ada51', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('737816e7-0494-4ea5-afeb-48e9a7f152e3', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '49713563-730c-42ac-aadd-708767257d13', '[\"POST\"]', 0, '2025-06-14 07:56:34', '2025-06-14 07:56:34'),
('73b0ecf7-7860-49df-935e-1830e9c772b1', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '017a19d0-c789-4960-acc4-e2856ecdc6c4', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('73b92606-fc46-48ed-b69a-f65375fe020f', 'a0623b53-75c7-43f1-94e8-8e2eaef561d8', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 05:33:11', '2025-04-19 05:33:11'),
('7483c7e8-3e95-4e57-86d9-8fdba0f6b21a', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'c7e35969-2279-420a-88ca-efa5de5abfbb', '[\"POST\"]', 0, '2025-06-10 08:51:58', '2025-06-10 08:51:58'),
('755624ad-6437-45ec-81ad-cae8249c806c', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"GET\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('75886bbb-de6e-4875-b45f-d3dbc3552c6a', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'c69b0d76-d788-4908-8a1b-0a7e198b6a7f', '[\"POST\"]', 0, '2025-06-11 03:04:48', '2025-06-11 03:04:48'),
('7615951a-3cba-4a36-b035-66b2566ff637', 'c60dc41b-e454-4df2-887a-4a8359d45404', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '[\"POST\"]', 0, '2025-04-26 00:54:51', '2025-04-26 00:54:51'),
('7694a1a4-a171-4a20-ada9-b087e81ac820', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('77245d8e-d595-4d91-980d-29d173d7d08f', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('77297371-dd5b-4751-83b3-92ede7d8877c', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'b66f81ea-5f7f-4273-ad21-92ebb420ddb3', '[\"GET\"]', 0, '2025-04-26 00:54:51', '2025-04-26 00:54:51'),
('78d8194b-3d0f-43b4-ad8a-3f9caab39947', 'ee44bcea-68c2-4cd1-b43b-83a7c9a56985', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-27 08:24:23', '2025-05-27 08:24:23'),
('79665d95-8483-4014-806b-accaedad592e', '2aba54f7-71a2-44f9-8917-4d2e53868d11', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('796c6c1f-f38f-4d29-badd-ea668921d38c', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:49:44', '2025-05-29 06:49:44'),
('7b1f29cb-bbb5-46fd-8d33-705425896a79', '6a258e8d-872a-400a-b090-115653368af0', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:38:45', '2025-05-28 08:38:45'),
('7c1ddb3e-484a-4ea5-9f08-b4f4be8c5eaa', '68b1770e-b090-4eda-85d1-9ed0c105b322', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('7c8bb462-41c2-4460-af91-b90bf389905c', '77edc260-bf6d-4b97-95cf-df90b0f01be9', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:37:57', '2025-05-28 08:37:57'),
('7ca09a78-0c32-40d9-9829-beca79f660e5', '85b1e883-f63a-437e-8084-2ab832e7a65f', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-03 01:04:59', '2025-06-03 01:04:59'),
('7d9e77d9-5ce1-41a2-9899-f38cf1d9c488', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('7f2263a9-b6bd-46e2-9584-7117d00de0ff', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '[\"GET\", \"POST\"]', 0, '2025-04-19 07:02:40', '2025-04-19 07:02:40'),
('800b16dd-8100-48cc-bb18-1797ceb2fbdf', '72d64a0c-e800-402e-901f-a0f135caa367', '9478e463-297a-4001-80d5-174e5888497a', '[\"PUT\", \"DELETE\", \"POST\", \"GET\"]', 0, '2025-05-30 03:17:01', '2025-05-30 03:17:01'),
('80aafe34-9926-4d3f-b419-94d28f689727', '72d64a0c-e800-402e-901f-a0f135caa367', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('823a6906-7cd7-44b7-92ad-8879103b6ac6', 'c60dc41b-e454-4df2-887a-4a8359d45404', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"DELETE\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('828ab6a4-e561-41f6-b51b-5f3b7b3dd4b2', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '[\"GET\"]', 0, '2025-04-26 08:02:58', '2025-04-26 08:02:58'),
('834b288d-d853-4c12-906e-0b957b211d2d', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('83bded4b-53ca-4dc5-8179-31faac687981', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('83f2122f-d034-4037-be29-d6442a7a1892', '2d9717d1-affd-41d8-aef3-c043299c1971', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-03 01:05:15', '2025-06-03 01:05:15'),
('844bc772-e1db-496d-b7c4-1937cdd3e590', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '073d6a20-3971-41da-8527-f3f44118d595', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('85521139-a020-423a-98c3-6fdcb4f5c808', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('866b92ed-0768-49e6-b48c-cbc5bdec5a2c', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-12 01:33:07', '2025-05-12 01:33:07'),
('86a3da85-83a4-4f0d-bf80-8642a1c52db9', 'ea59e39d-8552-4993-8f30-7de9930da03f', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '[\"POST\"]', 0, '2025-04-26 08:02:58', '2025-04-26 08:02:58'),
('86d81ed3-37cc-4655-9b8f-520176680eda', 'ea59e39d-8552-4993-8f30-7de9930da03f', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"DELETE\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('86e213a1-f2e7-4623-b47f-ec939e9e5525', '50ecc00f-615e-4da5-9e72-1d36039ada51', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('86e9a6e9-24a1-47b1-b700-980a6705ee6f', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('873b0410-5065-4a0c-8740-bee18718852c', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('876a209f-00cf-4927-b1c6-b95876892ba4', 'c2be12fa-c6f1-4df0-8816-ecefadd591af', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 07:10:10', '2025-05-30 07:10:10'),
('881214b2-0cd0-40b1-aecb-6988cfb8afd1', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('8819c6c8-e5da-48a3-bdcb-da6a020d8b12', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '5d905b5a-8024-441e-9e2a-912fbe001367', '[\"POST\"]', 0, '2025-06-10 08:51:58', '2025-06-10 08:51:58'),
('88e0af67-74d8-493c-ba1e-fd8f2663484e', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('899a8ac8-8aaa-4c4e-822e-d0fb7443ceca', 'ea59e39d-8552-4993-8f30-7de9930da03f', '7b6c108e-eb25-493d-a62e-411f14e26ea5', '[\"GET\"]', 0, '2025-06-10 08:05:17', '2025-06-10 08:05:17'),
('8a3e0acf-a355-4fd7-9a9e-c826068bb5d6', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('8a4175cd-be88-40c4-a9e7-e277b9899589', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('8ca35d96-543c-454a-8875-d4de6c453928', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('8d55984e-bbe8-4bb9-a3c7-a7646b0601c0', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"POST\", \"DELETE\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('8e0d9671-9d97-4a38-b4cf-f344a5ddbcd6', '7c97cf69-9bc9-4c4f-8099-7078e728992d', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('8ec7cafe-4450-4c9c-a042-9c08cb0fff7a', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '1e9adb00-716c-4007-a154-0ba999ec1904', '[\"POST\"]', 0, '2025-06-14 08:10:11', '2025-06-14 08:10:11'),
('8f12003d-2663-4546-b539-a1eb63e2fdab', 'c60dc41b-e454-4df2-887a-4a8359d45404', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '[\"PUT\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('8f2c28c3-c22f-458e-9f5b-4ab15303b2d4', '7b811d1d-ef58-46f7-ad92-5136a0845816', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('90214848-fff5-47d2-8646-9c35572183e2', 'ea59e39d-8552-4993-8f30-7de9930da03f', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('90be284b-9dd9-489d-a696-d2ee05277e11', '0045fd99-8fff-4d32-9116-e0ed05c6df10', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:06:14', '2025-04-28 06:06:14'),
('915c2910-00fc-4a3f-b18e-31bb42d1c428', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('9179941f-4ac3-4547-8bf2-28b6f2c8d728', '68b1770e-b090-4eda-85d1-9ed0c105b322', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('91e629f0-f019-46ed-9af3-ba50712dd384', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('921a93bd-6caf-46d8-a196-2ad6d02d4681', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"GET\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('92473ef9-9dff-4b7a-a78f-281640a06627', 'ea59e39d-8552-4993-8f30-7de9930da03f', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"GET\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('92535445-9531-47d6-8c01-ab47b17b046d', 'c60dc41b-e454-4df2-887a-4a8359d45404', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '[\"DELETE\", \"POST\", \"PUT\", \"GET\"]', 0, '2025-04-26 08:02:58', '2025-04-26 08:02:58'),
('92f64181-dae0-4d2a-bfa7-da0522fdff48', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '2f63866d-53ba-4ac6-b56c-074e1864c027', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('9445574a-9d58-484b-9228-dc8d070c9a36', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('944d27b8-2a63-4554-9b11-13020330b841', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('94541259-6b52-4d89-a46d-65eb89d48475', 'a6d81d0c-4f27-4a5c-86a0-1ae748e989e9', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-06 03:27:38', '2025-05-06 03:27:38'),
('94b5de90-2f2d-431d-bcbb-ff50528a0f49', 'c60dc41b-e454-4df2-887a-4a8359d45404', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '[\"POST\"]', 0, '2025-04-26 00:54:36', '2025-04-26 00:54:36'),
('94c600ac-13e7-402b-8a51-ecc9954b79f6', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('956cee48-2816-41ed-822c-288dd1a6b12e', '72d64a0c-e800-402e-901f-a0f135caa367', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('95f84c44-6600-4b0d-88c0-01ce46523948', 'a9d95b07-3c7e-47bc-8433-9563ae5130dc', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 03:00:22', '2025-04-19 03:00:22'),
('9612c7b2-b0b8-47ee-80cd-904c291ca336', 'c5e06c75-db95-43af-b9c1-14b63185314f', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-03 01:04:30', '2025-06-03 01:04:30'),
('961b6d12-6ebf-4882-9f88-904e7b31223c', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '[\"DELETE\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('966a4a17-e81a-42bf-a577-5a8297b8fa27', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '181ad901-d797-4d9f-b4a3-71a04fb24971', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:47:30', '2025-05-28 08:47:30'),
('96871447-92b2-4e0d-8e05-c79a662f49af', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '[\"GET\", \"POST\"]', 0, '2025-04-19 07:02:53', '2025-04-19 07:02:53'),
('9ae0de9c-b3aa-4cb8-9acc-7ecfa2839e01', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('9b603e0d-560a-46f0-b449-4922466df838', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', 'edc17c01-480a-4501-9dd6-fd8da999f1e0', '[\"POST\"]', 0, '2025-06-14 06:42:13', '2025-06-14 06:42:13'),
('9b694c2a-8ba4-4a6f-b8a9-29aa1cefd60e', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('9bf5140e-0ea5-4257-8a5b-e0192071bbab', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('9f4ae66c-80be-4b46-bfe7-f91a0bded963', 'c75b92d2-b721-490c-8130-f3c948cb45a0', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 03:02:04', '2025-04-19 03:02:04'),
('9fd2f621-f31f-4be0-934f-d315b6f590d3', 'e9f5b58e-91ae-4900-8502-6266540ce865', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 07:07:04', '2025-05-30 07:07:04'),
('a04b25ab-f673-46f8-bce4-79c00ad8c370', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"DELETE\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('a0d953ad-e5cc-41f2-a96a-5a2bf8739488', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ee0cac60-57f4-402e-afc0-6badd6898bc9', '[\"POST\"]', 0, '2025-06-11 03:02:56', '2025-06-11 03:02:56'),
('a1670b5f-9b67-41c3-9c4a-084265d2f7c4', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('a1ab8679-13bf-44b6-bde9-90e4d986078e', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('a1cfda6c-2917-46b3-b3b6-985978642a26', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('a2944c93-75f3-4e99-b8f3-36f91d07db34', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('a2b0c701-9d87-4354-aef3-346df63c9cd2', 'c60dc41b-e454-4df2-887a-4a8359d45404', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"DELETE\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('a422b5b1-978c-4b7d-bb30-17f89457e2e1', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:51:40', '2025-05-29 06:51:40'),
('a5529afd-6855-4495-a014-9460e03e4dd2', '2e32f74c-d725-4ec3-b41c-64f784b49360', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-26 04:23:38', '2025-04-26 04:23:38'),
('a5b40886-88fb-457c-ac7f-5535cd16d942', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '77658513-c248-46ee-9013-69786eee0264', '[\"POST\"]', 0, '2025-06-14 07:56:34', '2025-06-14 07:56:34'),
('a5d65187-070f-4a38-9bbb-8f82780233d4', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('a5dbbbab-f7e6-4197-a6ba-0d3e06edd55a', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '9478e463-297a-4001-80d5-174e5888497a', '[\"POST\"]', 0, '2025-04-26 02:38:12', '2025-04-26 02:38:12'),
('a71ee7f4-9f65-4c22-9269-5faea9c70ccc', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('a8d57e3b-3e5e-4b4a-bfcf-dc2e26026ddd', 'c819b6c7-70e5-49ed-90cb-ba97fe833245', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:05:55', '2025-04-28 06:05:55'),
('a9abd4f3-783a-449b-b02b-f5588fcb084d', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('ab767b2a-9082-49d6-aa94-ced5d9694624', '462193b6-83df-4f2f-bb5f-129ee8008c56', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:40:15', '2025-05-30 02:40:15'),
('ab7a265c-5db6-4768-b11c-c36cd8f88115', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ee0cac60-57f4-402e-afc0-6badd6898bc9', '[\"POST\"]', 0, '2025-06-11 03:02:56', '2025-06-11 03:02:56'),
('acb9d179-2cc6-429d-8764-a3838a2c603b', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '77658513-c248-46ee-9013-69786eee0264', '[\"POST\"]', 0, '2025-06-14 07:55:42', '2025-06-14 07:55:42'),
('ae0518f7-cc02-4c9e-bcd0-db2e524b8450', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', 'edc17c01-480a-4501-9dd6-fd8da999f1e0', '[\"POST\"]', 0, '2025-06-14 06:42:13', '2025-06-14 06:42:13'),
('ae28537d-5133-4b94-96b5-f3e94dbd126c', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('af01c55d-355b-4c1e-8215-edd2f4a70e08', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '826e7157-513f-400e-83d6-b9648c932432', '[\"PUT\"]', 0, '2025-04-25 03:37:43', '2025-04-25 03:37:43'),
('af6151db-a642-408b-b5a5-7b545916b0c3', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('b059c7e9-ac7e-4d01-8b50-ce5b9175c554', '72d64a0c-e800-402e-901f-a0f135caa367', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('b1e413f4-ddd5-43f7-9969-c64aff0a8512', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('b247e51e-9864-41c3-a424-fe8563849e4e', 'dbc455ca-80a7-42fd-bb4f-22459244a734', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '[\"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('b2cd9890-4017-45c6-a81b-f951eff8aa4e', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:44:04', '2025-05-28 08:44:04'),
('b2d69dd2-dea7-4b26-ab69-b698eb3432c0', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('b33bac2d-47cb-4e76-a83f-3b1d194624a4', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('b39b4ac5-ec80-4e6f-9527-1c0d3135b823', '2aba54f7-71a2-44f9-8917-4d2e53868d11', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('b5e35ae3-465f-47d9-aa7a-010f90351362', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('b5eaf976-2dea-438c-9a06-10b8d2322500', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('b81e7465-b696-4f02-b3c6-d070570023bc', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('b8df4f2c-1a5e-4e22-a06a-68f704dcd658', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('baf53f86-5307-4456-8e8d-b405ac67d9e2', '6a258e8d-872a-400a-b090-115653368af0', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('bc946282-4364-433d-b299-41cef56e49ba', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-23 00:41:42', '2025-05-23 00:41:42'),
('bdba7b45-527f-4e9a-953f-866996326d0c', 'ea59e39d-8552-4993-8f30-7de9930da03f', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"PUT\", \"GET\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('be74443b-faa0-47d1-957f-ae7914dff360', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-12 01:31:55', '2025-05-12 01:31:55'),
('bf1274af-22d8-4e0c-a607-3407e45ab5d7', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('bf396fe1-9a1a-4d65-86d5-e38f18701348', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('bf7a124b-4a93-4367-83ea-6d7ef3bae47d', '623e84cb-22b7-47a4-803d-a0863e9c5201', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 03:00:53', '2025-04-19 03:00:53'),
('bf90eaf0-76bd-426b-9eae-5cbe27070884', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:18:01', '2025-06-16 07:18:01'),
('bfee6be0-879d-4665-b555-581ab0fa614c', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '[\"POST\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23');
INSERT INTO `roles_menu` (`id`, `menu_id`, `role_id`, `list_method`, `is_deleted`, `create_at`, `update_at`) VALUES
('c04acff9-eb35-4326-9d59-ee3d2e678748', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-04-26 08:02:58', '2025-04-26 08:02:58'),
('c069f1aa-0718-428f-b77c-584d62bfef08', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '181ad901-d797-4d9f-b4a3-71a04fb24971', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:47:30', '2025-05-28 08:47:30'),
('c18ce886-ce75-4417-93d7-593311413523', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '8dc11baf-a3e0-41c9-ab1a-ae87b8852d69', '[\"POST\", \"GET\", \"PUT\", \"DELETE\"]', 0, '2025-05-29 01:45:45', '2025-05-29 01:45:45'),
('c1e55802-fc80-4134-b0cd-6b85d5fcc1c9', '260a2491-3775-40cb-8dee-43032358d8c8', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:41:30', '2025-05-30 02:41:30'),
('c21c1ffb-b1a1-4c41-90b5-06d45eaaf27c', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('c2b1d4d0-a422-48ad-a2a4-c68fad5ab59e', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('c2e6d473-0d19-4c2a-b435-42b0713f581f', 'e160c4ec-bd74-425e-98a8-a68155a657f4', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 02:05:40', '2025-04-19 02:05:40'),
('c3b9f079-0376-4a0a-912a-7dafcf97ec55', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('c486a6cd-a8d9-4ab4-9077-362ea6788873', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:44:41', '2025-05-28 08:44:41'),
('c5efe7b5-c73b-4421-bcf8-abfa5d0bd618', 'c60dc41b-e454-4df2-887a-4a8359d45404', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('c5fcbd85-ae39-44a3-a33e-fd8eb8a6c52b', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('c656854d-5268-4ce3-9f22-6de71f140365', '68b1770e-b090-4eda-85d1-9ed0c105b322', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"GET\", \"PUT\", \"DELETE\", \"POST\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('c68b775a-e4d0-4f25-9296-bdf351236a93', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('c70f3a59-336f-4753-be21-1c40e1390b8d', '48464916-ecd4-4b27-8da7-9e3f9bbe578a', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:06:07', '2025-04-28 06:06:07'),
('c81489a3-6827-475d-b88e-1070d5f10c13', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('c8836564-340c-400d-83f0-c939fd71616c', '68b1770e-b090-4eda-85d1-9ed0c105b322', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('c8fc9ab5-a22a-4fdb-8f8b-8a536acebeee', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:48:51', '2025-05-29 02:48:51'),
('c98a3831-7ec8-4d91-b033-fe538462e942', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"PUT\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('c9e3b1ae-8335-4b6d-b2e4-95a59f3b5684', '72d64a0c-e800-402e-901f-a0f135caa367', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('cba30f3e-5f63-4895-a118-a804348643d0', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('ceb71db2-6ad0-4e3d-ba4d-89f39bc1979c', '2aba54f7-71a2-44f9-8917-4d2e53868d11', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:21', '2025-05-29 02:50:21'),
('cf3763fc-485a-4295-aa09-118fb8fdcfd2', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '[\"DELETE\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('cf5478dc-29fc-4937-856c-610d552de48b', 'c60dc41b-e454-4df2-887a-4a8359d45404', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"DELETE\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('d031f0a6-04cd-4143-85e3-32499886e569', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', '1e9adb00-716c-4007-a154-0ba999ec1904', '[\"POST\"]', 0, '2025-06-14 08:11:20', '2025-06-14 08:11:20'),
('d2c9175e-ee45-46d6-8a6b-696f81406a14', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', 'ef66dda4-8ab7-42b1-8d90-aed44fbc713b', '[\"GET\", \"POST\", \"DELETE\", \"PUT\"]', 0, '2025-05-29 06:49:44', '2025-05-29 06:49:44'),
('d3a1b58f-5750-4ae3-93bb-3ddcfdfb1afb', 'ea59e39d-8552-4993-8f30-7de9930da03f', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('d3cf6cc7-07f7-492b-9e60-1194da8a53a3', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"DELETE\"]', 0, '2025-04-25 03:43:05', '2025-04-25 03:43:05'),
('d45d4ad0-fffe-4651-b0ce-ddba595f78b1', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"POST\", \"DELETE\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('d474f584-bb62-4919-83f1-12e508b14fb4', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'b58d3814-3c74-42dc-81ba-92fb4971ac29', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('d8119070-45ac-4c19-a0aa-8e5729fc63e4', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '924f4154-86ff-4d6d-a160-e6fbbb84dee3', '[\"POST\"]', 0, '2025-06-10 08:15:26', '2025-06-10 08:15:26'),
('d81f477e-4003-4aea-9668-f7055bb2d6bd', 'd8fddbb0-4ce9-4873-8bda-39ecfd288c72', 'a3055ca3-1b69-41dc-85b0-784b6d7e8988', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-14 06:20:08', '2025-06-14 06:20:08'),
('d8632484-1e34-405a-8cc2-a305a159c7d2', '3b7279b8-1dd6-4a52-a6e2-7590e3411504', '42258027-6e17-4c44-ba5b-227322583e6f', '[\"POST\"]', 0, '2025-05-29 07:02:36', '2025-05-29 07:02:36'),
('da29dc46-3c1d-44e6-895c-7fc82e42a82e', 'c60dc41b-e454-4df2-887a-4a8359d45404', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"DELETE\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('da9071ab-eccf-4d18-958b-4bfa3dc06392', '9422908b-e19f-41ec-b963-1107f33aeb70', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-30 02:41:59', '2025-05-30 02:41:59'),
('db01e6b6-1bf7-4be0-909e-012659a258c7', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '5e47e5f7-f64b-41ce-a799-5e2777c30f88', '[\"GET\"]', 0, '2025-04-26 00:59:03', '2025-04-26 00:59:03'),
('db1e322d-82ce-4166-abfb-1bb821133e70', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('db74d4e8-07c6-46c5-8390-ba7b08ad8a96', 'c60dc41b-e454-4df2-887a-4a8359d45404', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('dcfc7a2d-a30b-4539-b5c5-de4d97d61fed', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"POST\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('ddb95a96-9609-4fe7-b349-44a36ce60466', 'ea59e39d-8552-4993-8f30-7de9930da03f', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('de1f7224-3a16-4c7d-9fcc-4fba5dabe9c4', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('de4eda74-30a6-4ca6-aef5-4149dbe19694', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"POST\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('df56192c-f31b-4e43-9d34-7eedd15a0669', 'bda0e83a-b0c9-4dff-81d7-8def1657fcf6', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-28 06:06:23', '2025-04-28 06:06:23'),
('e1cd8be0-b491-497c-9761-d34fc68c530b', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-25 01:24:54', '2025-04-25 01:24:54'),
('e37cc2b2-47bc-48a2-8a2d-b57e75f63a7f', 'ea59e39d-8552-4993-8f30-7de9930da03f', '7b6c108e-eb25-493d-a62e-411f14e26ea5', '[\"GET\"]', 0, '2025-06-10 08:15:26', '2025-06-10 08:15:26'),
('e531e0c4-7567-428d-a755-c8aa720ebcc5', '23f4e870-b199-4e91-b076-ec3fca40ac58', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-06-10 01:40:02', '2025-06-10 01:40:02'),
('e57c8a8b-e90e-45c6-bba2-dfabdaf0854c', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '33fa8ee1-96c6-414b-99e4-cf8e53fee02c', '[\"PUT\", \"POST\", \"DELETE\", \"GET\"]', 0, '2025-04-26 08:02:58', '2025-04-26 08:02:58'),
('e6533221-ff85-44f2-a296-1cf7b6f5d9e0', '7c97cf69-9bc9-4c4f-8099-7078e728992d', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '[\"DELETE\"]', 0, '2025-04-25 06:13:44', '2025-04-25 06:13:44'),
('e6830dbb-710c-49c2-ac87-3ce582f84cd6', 'efc78d7f-6dbb-4957-89d6-03d38be4869c', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"DELETE\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('e7d15e19-4c68-4aaf-801b-3d717d204ea8', 'dbc455ca-80a7-42fd-bb4f-22459244a734', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:50:41', '2025-05-29 02:50:41'),
('e7ee0f66-fadd-4d0d-beda-139e6fcd42cc', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('e9408f39-2bb6-4249-b983-1c6c251a3eb1', '50ecc00f-615e-4da5-9e72-1d36039ada51', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('ea0a0a30-6dde-42e8-a37b-6602594cb8ac', '7b811d1d-ef58-46f7-ad92-5136a0845816', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:40:25', '2025-05-28 08:40:25'),
('ea88e1a4-a821-47fe-8c4b-3ae90f9cf34f', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '[\"PUT\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('ebe43a4c-2d8e-42d2-9952-e43d40bf7869', 'c60dc41b-e454-4df2-887a-4a8359d45404', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:53:03', '2025-04-26 00:53:03'),
('ec717fc9-a9f8-4510-8a41-9c1ef2e45aae', '1b50fa06-24d3-4174-a3c9-891b8e148f64', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 02:57:07', '2025-04-19 02:57:07'),
('ef71a9ff-81aa-439c-b4ab-72c2629855b5', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('efeb6ef1-67e0-4988-b562-d38cb4748920', '1fb79c0f-09c0-496d-9a2d-02fc2523052e', 'a3055ca3-1b69-41dc-85b0-784b6d7e8988', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-14 06:20:08', '2025-06-14 06:20:08'),
('f1403489-934d-41b8-b797-f71867ed5950', 'c60dc41b-e454-4df2-887a-4a8359d45404', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:52:47', '2025-04-26 00:52:47'),
('f3427b9e-f159-45f8-a9e9-b63acd42c9de', '50ecc00f-615e-4da5-9e72-1d36039ada51', '181ad901-d797-4d9f-b4a3-71a04fb24971', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-28 08:47:30', '2025-05-28 08:47:30'),
('f465b077-e911-46aa-ad1d-587588de6d10', 'dd8fb4f2-1c47-466b-adf6-13dd9cb7e06f', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-28 08:39:14', '2025-05-28 08:39:14'),
('f564c3c4-5253-4a8c-bd9c-48a298dd29ee', 'c1334bf6-6917-4033-8ea0-6aaca70701b1', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-04-19 02:06:41', '2025-04-19 02:06:41'),
('f888ba0e-5357-4156-923d-71cab7e7115c', '72d64a0c-e800-402e-901f-a0f135caa367', '9bfd0fc7-21df-4f1f-b326-f412f72f261d', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-05-29 02:50:33', '2025-05-29 02:50:33'),
('f97addda-eb70-4659-b490-5a942fba87c6', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '[\"POST\"]', 0, '2025-04-26 01:05:31', '2025-04-26 01:05:31'),
('fa5d48b3-af99-47f3-be61-78d798d5fb1d', 'ea59e39d-8552-4993-8f30-7de9930da03f', 'd47297af-916b-405a-9e96-7f1118d4a588', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('fb3c4d8a-8378-497b-b141-dc3494b8621a', 'c3c7b0d4-0ace-46c4-8f4e-3e7362cfb1ad', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '[\"GET\"]', 0, '2025-05-29 06:42:15', '2025-05-29 06:42:15'),
('fb4c5f3e-c1eb-497a-8726-7c355821f168', '95d83463-b50b-4e2d-9529-3f4cafcb3fc3', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '[\"GET\", \"PUT\"]', 0, '2025-04-25 03:43:23', '2025-04-25 03:43:23'),
('fb81712c-fea1-429c-bd54-c1ae6da945dc', '7b811d1d-ef58-46f7-ad92-5136a0845816', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '[\"GET\"]', 0, '2025-05-29 02:47:18', '2025-05-29 02:47:18'),
('fb9ef42c-a6de-448b-8109-10cf29ad2599', '3cfd7c20-d35b-4a48-b6c0-17e8377e8a5e', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '[\"POST\", \"DELETE\", \"PUT\", \"GET\"]', 0, '2025-06-16 07:17:22', '2025-06-16 07:17:22'),
('fc779efc-d698-48c1-8e74-3a8c94ec4ceb', 'efc78d7f-6dbb-4957-89d6-03d38be4869e', '23e6c60c-9f64-4cb3-871c-02370771bb95', '[\"POST\"]', 0, '2025-04-26 00:49:24', '2025-04-26 00:49:24'),
('fc8afa7a-d611-408d-9eef-e3e4e54ed604', '3532553d-dcc7-423d-b72d-7abc1d69e813', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '[\"GET\", \"POST\", \"PUT\", \"DELETE\"]', 0, '2025-05-05 02:35:54', '2025-05-05 02:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `role_account`
--

CREATE TABLE `role_account` (
  `id` char(36) NOT NULL,
  `account_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role_account`
--

INSERT INTO `role_account` (`id`, `account_id`, `role_id`, `created_by`, `is_deleted`, `create_at`, `update_at`) VALUES
('00a8d061-a6ab-4500-bfd5-5132210f541e', '00a8d061-a6ab-4500-bfd5-5132210f541e', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-23 06:07:36', '2025-04-25 04:10:58'),
('0134e60c-817e-4381-8ff4-99c1fe283dae', '0134e60c-817e-4381-8ff4-99c1fe283dae', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:24:42', '2025-06-17 09:24:42'),
('025e5f15-a203-4080-a74f-fc07fb8d995c', '025e5f15-a203-4080-a74f-fc07fb8d995c', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:06:42', '2025-06-17 09:06:42'),
('03fa3240-e797-44cb-8515-87ca237c63e5', '03fa3240-e797-44cb-8515-87ca237c63e5', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:09:18', '2025-06-17 09:09:18'),
('04736374-cec6-4c54-acac-f17e7dece80b', '04736374-cec6-4c54-acac-f17e7dece80b', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 00:43:09', '2025-04-24 08:50:03'),
('05a159ba-2d4c-4c7c-88ac-9617bfac1ba8', '05a159ba-2d4c-4c7c-88ac-9617bfac1ba8', '181ad901-d797-4d9f-b4a3-71a04fb24971', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:48:11', '2025-05-28 08:48:11'),
('069e6dd3-e946-4266-8f08-b0aabffa4f95', '069e6dd3-e946-4266-8f08-b0aabffa4f95', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:29:25', '2025-04-22 06:35:22'),
('0a62f357-e006-4384-99f8-68c57bb60c7e', '0a62f357-e006-4384-99f8-68c57bb60c7e', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:18:18', '2025-05-05 09:27:05'),
('0cbce78b-b439-4ef8-96d2-6e3cce544cfd', '0cbce78b-b439-4ef8-96d2-6e3cce544cfd', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:18:36', '2025-04-25 04:21:31'),
('0e63f96f-8135-485d-a246-91f00e140d32', '0e63f96f-8135-485d-a246-91f00e140d32', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:52:43', '2025-06-16 07:52:43'),
('0e9c2893-cc45-43f7-986d-6b109a64c64b', '0e9c2893-cc45-43f7-986d-6b109a64c64b', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:43', '2025-06-17 03:47:43'),
('0ea47c73-453b-4e08-aa44-30805cf7a04a', '0ea47c73-453b-4e08-aa44-30805cf7a04a', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 07:15:26', '2025-06-07 07:15:26'),
('0ef69410-1d17-4613-95e9-8c5dac52763b', '0ef69410-1d17-4613-95e9-8c5dac52763b', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:49:31', '2025-06-17 03:49:31'),
('11e056d3-634e-45c0-b598-306e9793ddbc', '11e056d3-634e-45c0-b598-306e9793ddbc', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:28:21', '2025-05-05 09:25:19'),
('1298d606-3ae2-449e-aebc-64aca57c3047', '1298d606-3ae2-449e-aebc-64aca57c3047', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:46:48', '2025-06-17 03:46:48'),
('13fbd1b8-8a84-40c6-b530-72d16cfe94e4', '13fbd1b8-8a84-40c6-b530-72d16cfe94e4', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:13:18', '2025-04-25 04:13:18'),
('165b8a45-2879-410c-9810-8f5d97cf1f0a', '165b8a45-2879-410c-9810-8f5d97cf1f0a', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:08:14', '2025-06-17 09:08:14'),
('18190936-5b69-49c7-ae39-bfba0565dc2f', '18190936-5b69-49c7-ae39-bfba0565dc2f', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-29 08:32:52', '2025-05-29 08:32:52'),
('1975a786-6f67-445c-8689-1bb16b9fd983', '1975a786-6f67-445c-8689-1bb16b9fd983', 'ad763596-eb05-4a41-a19c-e07bf2f5db43', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:03', '2025-06-17 03:51:03'),
('1ebe5191-0d3a-4cdd-9e1a-12fc9f58aa22', '1ebe5191-0d3a-4cdd-9e1a-12fc9f58aa22', 'a3055ca3-1b69-41dc-85b0-784b6d7e8988', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 08:05:33', '2025-06-14 08:05:33'),
('20a6b4b0-94d7-4acd-932f-2531e0759487', '20a6b4b0-94d7-4acd-932f-2531e0759487', '181ad901-d797-4d9f-b4a3-71a04fb24971', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:58:48', '2025-05-28 08:58:48'),
('214ab878-ccab-405a-84a7-91c00e069723', '214ab878-ccab-405a-84a7-91c00e069723', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-11 01:52:24', '2025-06-11 01:53:32'),
('22edff91-b584-4d35-a39b-459dd83321c3', '22edff91-b584-4d35-a39b-459dd83321c3', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:50:34', '2025-06-17 03:50:34'),
('245a42fd-2d55-4958-b4d3-5c225c8a0466', '245a42fd-2d55-4958-b4d3-5c225c8a0466', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:11:48', '2025-06-17 09:11:48'),
('274e3db5-a5ec-485c-9181-51f620e0310e', '274e3db5-a5ec-485c-9181-51f620e0310e', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:33:02', '2025-06-16 07:33:02'),
('2779ad3c-60b6-4bd3-8386-d8a15f724bb8', '2779ad3c-60b6-4bd3-8386-d8a15f724bb8', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:33:38', '2025-06-17 03:33:38'),
('2837a504-4cc8-4827-b0c4-0fa1e3ccb325', '2837a504-4cc8-4827-b0c4-0fa1e3ccb325', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:04:39', '2025-06-17 09:04:39'),
('2aecc04d-fb1a-4c6a-823d-d6a3d13da9bd', '2aecc04d-fb1a-4c6a-823d-d6a3d13da9bd', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:22:19', '2025-04-24 03:23:04'),
('2b9d7b50-3497-4d58-b0ab-eaf891cca75f', '2b9d7b50-3497-4d58-b0ab-eaf891cca75f', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 09:08:05', '2025-05-28 09:08:05'),
('2df3efb5-c29d-49eb-a2a3-8270d91a9b04', '2df3efb5-c29d-49eb-a2a3-8270d91a9b04', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:43:52', '2025-06-16 07:43:52'),
('2fa63932-e639-4593-8ce0-ee91926f7678', '2fa63932-e639-4593-8ce0-ee91926f7678', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:10:34', '2025-06-17 01:10:34'),
('31ea19da-21b2-4d0d-b41e-1f7c7130a667', '31ea19da-21b2-4d0d-b41e-1f7c7130a667', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:10:17', '2025-06-17 09:10:17'),
('3205701d-3149-4410-9058-c6f26a774045', '3205701d-3149-4410-9058-c6f26a774045', '9478e463-297a-4001-80d5-174e5888497a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-28 02:40:27', '2025-04-28 02:40:27'),
('32bb8141-481b-42fe-a6ff-49fdd44d79ea', '32bb8141-481b-42fe-a6ff-49fdd44d79ea', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:14:21', '2025-04-25 04:14:21'),
('3326ca85-c386-4f73-94c9-b0d4ace0c4dd', '3326ca85-c386-4f73-94c9-b0d4ace0c4dd', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:11:21', '2025-06-17 09:11:21'),
('33876fa1-868e-4a58-a3f5-959a571160c1', '33876fa1-868e-4a58-a3f5-959a571160c1', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:17:20', '2025-05-29 01:08:16'),
('35a80007-c6c7-4df8-96f3-b829eb477d33', '35a80007-c6c7-4df8-96f3-b829eb477d33', '42258027-6e17-4c44-ba5b-227322583e6f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:09:51', '2025-06-17 09:09:51'),
('35b4603d-7cea-4580-8eab-149cce2aad1e', '35b4603d-7cea-4580-8eab-149cce2aad1e', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 05:49:11', '2025-04-25 04:10:58'),
('36030ad7-b8f9-45ee-ae42-2b8bf957b0fa', '36030ad7-b8f9-45ee-ae42-2b8bf957b0fa', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:36:15', '2025-04-24 06:21:50'),
('365974a5-23e1-46f2-a02f-1e8d640015eb', '365974a5-23e1-46f2-a02f-1e8d640015eb', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:21:06', '2025-04-25 04:10:58'),
('369f54a1-300a-4ded-9ab0-b37e71cdc3e9', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 'eb6d9850-2b77-47fc-ae2a-0a0ba9842280', '', 0, '2025-04-18 08:10:35', '2025-04-18 08:10:35'),
('36b9f2ca-f97f-4c7b-a796-f3e40cacf8d1', '36b9f2ca-f97f-4c7b-a796-f3e40cacf8d1', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:31', '2025-06-17 03:48:31'),
('372dc29e-986a-4f16-9a30-c4e2816d56be', '372dc29e-986a-4f16-9a30-c4e2816d56be', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 07:20:39', '2025-04-25 04:10:58'),
('38d16031-b1eb-4710-809d-05cb735fedbe', '38d16031-b1eb-4710-809d-05cb735fedbe', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:21:29', '2025-06-16 07:21:29'),
('3a12f805-ab93-4dd6-819d-e77fd968d211', '3a12f805-ab93-4dd6-819d-e77fd968d211', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:41:43', '2025-06-16 07:41:43'),
('3e14b4a3-6f7e-47b3-aa47-a1202c9e2bac', '3e14b4a3-6f7e-47b3-aa47-a1202c9e2bac', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:58:36', '2025-04-25 04:10:58'),
('3fcf2ce4-6c66-4f22-a8bf-7e3b67983f7d', '3fcf2ce4-6c66-4f22-a8bf-7e3b67983f7d', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 05:40:18', '2025-04-22 05:39:21'),
('42c5640e-998c-4440-bdd8-5934f1f6f639', '42c5640e-998c-4440-bdd8-5934f1f6f639', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:35:07', '2025-04-25 04:10:58'),
('43a7e1ac-8d4b-42ff-ac5b-ef6e83c1abb9', '43a7e1ac-8d4b-42ff-ac5b-ef6e83c1abb9', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:11:42', '2025-04-25 04:19:01'),
('44569dc8-08b7-44f8-8839-55b6beba80da', '44569dc8-08b7-44f8-8839-55b6beba80da', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:35:56', '2025-06-16 07:35:56'),
('45ab8e40-165f-48d9-80ad-80a82eaee2f4', '45ab8e40-165f-48d9-80ad-80a82eaee2f4', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:40:49', '2025-04-25 04:10:58'),
('4643ab25-a78c-47df-828c-f0d6839b3e12', '4643ab25-a78c-47df-828c-f0d6839b3e12', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:32:50', '2025-04-24 08:54:57'),
('46991b48-0a5c-42e5-a609-821353f1fe38', '46991b48-0a5c-42e5-a609-821353f1fe38', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-16 07:20:50', '2025-06-16 07:21:00'),
('4ba6570b-d176-48cc-85a0-c6ec7ce669cd', '4ba6570b-d176-48cc-85a0-c6ec7ce669cd', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:01:01', '2025-04-22 06:36:34'),
('4e1c9d33-411b-4150-9783-b494d56f3168', '4e1c9d33-411b-4150-9783-b494d56f3168', '9478e463-297a-4001-80d5-174e5888497a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:06', '2025-06-17 03:48:06'),
('4f5e1175-1e26-4b6b-bdef-6290a6504dc1', '4f5e1175-1e26-4b6b-bdef-6290a6504dc1', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:23:55', '2025-06-17 09:23:55'),
('50b960e2-a5a6-493c-9f59-cfb91cd58d34', '50b960e2-a5a6-493c-9f59-cfb91cd58d34', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:03:30', '2025-06-17 01:03:30'),
('5aa3732e-a26a-4693-95d6-5623f77c5ecb', '5aa3732e-a26a-4693-95d6-5623f77c5ecb', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:36:38', '2025-06-16 07:36:38'),
('60577134-c2e4-4dfd-a6d3-154026a104c4', '60577134-c2e4-4dfd-a6d3-154026a104c4', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:26:46', '2025-04-26 08:06:25'),
('647df7a7-6fb2-4c6e-aacc-6c34c44ffbcc', '647df7a7-6fb2-4c6e-aacc-6c34c44ffbcc', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:33:52', '2025-06-16 07:33:52'),
('64ab389a-dd92-40cc-a586-5557c56b066e', '64ab389a-dd92-40cc-a586-5557c56b066e', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:18:26', '2025-06-17 09:18:26'),
('6591dab0-1fdb-4b1f-af15-3dd6febcef43', '6591dab0-1fdb-4b1f-af15-3dd6febcef43', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:25:43', '2025-05-05 09:25:19'),
('698a0fb4-b151-4029-80c2-ec848d0afbc7', '698a0fb4-b151-4029-80c2-ec848d0afbc7', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:45:27', '2025-06-16 07:45:27'),
('6b58799e-45dc-4489-abd3-c6c09f4bdfb6', '6b58799e-45dc-4489-abd3-c6c09f4bdfb6', '7cd13cd9-ba82-4c12-b513-8e36478c1fe5', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:26:11', '2025-04-25 04:10:58'),
('6e12c9ad-53c9-4809-b263-4e7b12ae888e', '6e12c9ad-53c9-4809-b263-4e7b12ae888e', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-28 08:41:43', '2025-05-28 08:41:43'),
('6e217271-9d44-45ce-8b7c-1726091eab8e', '6e217271-9d44-45ce-8b7c-1726091eab8e', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:05:12', '2025-06-17 09:05:12'),
('6e372bb9-c21f-4e4d-a6f8-7c07ed9f002d', '6e372bb9-c21f-4e4d-a6f8-7c07ed9f002d', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:23:41', '2025-04-24 02:02:54'),
('70d964ac-901a-4dad-898d-329b777d2405', '70d964ac-901a-4dad-898d-329b777d2405', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:47:03', '2025-06-16 07:47:03'),
('72024815-e681-4791-bc10-6c5624f40740', '72024815-e681-4791-bc10-6c5624f40740', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 03:22:36', '2025-04-24 06:26:40'),
('735be44c-8d88-4fc2-9f28-595275779217', '735be44c-8d88-4fc2-9f28-595275779217', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:13:24', '2025-06-17 09:13:24'),
('78e9d9d1-5732-4df8-bb2a-64644d35972f', '78e9d9d1-5732-4df8-bb2a-64644d35972f', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:44:21', '2025-06-16 07:44:21'),
('7bc69de4-abe5-47b9-9a64-16e19aaa64e4', '7bc69de4-abe5-47b9-9a64-16e19aaa64e4', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:09:56', '2025-04-22 07:21:36'),
('7befb4be-ac7c-4400-9fcc-780e76e81933', '7befb4be-ac7c-4400-9fcc-780e76e81933', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 06:43:57', '2025-06-10 06:43:57'),
('7c18040f-2b12-48c5-ab59-8c01ae056d92', '7c18040f-2b12-48c5-ab59-8c01ae056d92', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:49:42', '2025-06-16 07:49:42'),
('7eb86c7b-7200-437d-b80d-9a801a36e9b2', '7eb86c7b-7200-437d-b80d-9a801a36e9b2', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:21:45', '2025-04-24 03:31:32'),
('866400b4-566c-4ed0-9c57-47747929ba83', '866400b4-566c-4ed0-9c57-47747929ba83', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:33:56', '2025-04-24 03:40:24'),
('899b82fa-56ed-4ab6-b278-164d84906958', '899b82fa-56ed-4ab6-b278-164d84906958', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:22:06', '2025-04-22 07:22:46'),
('89a79beb-4d6e-41fb-8af4-41cc37898601', '89a79beb-4d6e-41fb-8af4-41cc37898601', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:14:47', '2025-04-25 04:14:47'),
('8a93524a-0657-4efb-95d9-8a0b5ebaf9ac', '8a93524a-0657-4efb-95d9-8a0b5ebaf9ac', '2f63866d-53ba-4ac6-b56c-074e1864c027', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:48:57', '2025-06-17 03:48:57'),
('8be526da-266f-459f-81ed-dacb5f003595', '8be526da-266f-459f-81ed-dacb5f003595', '8674d8c1-ccb8-4653-8da8-6fc48e0ceded', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:28', '2025-06-17 03:47:28'),
('8e9aecdf-a051-4f7c-ba86-2d300764424e', '8e9aecdf-a051-4f7c-ba86-2d300764424e', '9478e463-297a-4001-80d5-174e5888497a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:49:51', '2025-06-17 03:49:51'),
('8e9b4ae3-8583-4c9e-ba05-b4c8bf1ba568', '8e9b4ae3-8583-4c9e-ba05-b4c8bf1ba568', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:25:18', '2025-04-26 08:07:01'),
('90329dcb-d3d2-4217-9d7e-c7abbbf2b8d8', '90329dcb-d3d2-4217-9d7e-c7abbbf2b8d8', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:52:02', '2025-06-17 03:52:02'),
('960753ea-1b0b-428b-992c-f77bc27d5d45', '960753ea-1b0b-428b-992c-f77bc27d5d45', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:02:16', '2025-04-24 06:27:04'),
('96dbff7a-df9b-420d-9b95-f33fc24d4ab4', '96dbff7a-df9b-420d-9b95-f33fc24d4ab4', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 03:50:03', '2025-06-16 03:50:03'),
('98874a38-460d-4e7b-a22c-7b24d6ef3b1c', '98874a38-460d-4e7b-a22c-7b24d6ef3b1c', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:35:36', '2025-04-22 06:22:37'),
('9aa619cf-db2b-4662-adc4-28fd79ef2155', '9aa619cf-db2b-4662-adc4-28fd79ef2155', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:46', '2025-06-17 03:51:46'),
('9c6501a0-16e9-498b-9ed6-166e3a13500f', '9c6501a0-16e9-498b-9ed6-166e3a13500f', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:12:23', '2025-06-17 09:12:23'),
('9c674cf3-fdb2-4147-ac66-c3da8ed82dc0', '9c674cf3-fdb2-4147-ac66-c3da8ed82dc0', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:24:40', '2025-04-25 04:24:40'),
('9cf8ede8-8c8e-4628-a590-591e7957375f', '9cf8ede8-8c8e-4628-a590-591e7957375f', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:16:17', '2025-04-25 04:16:17'),
('9ec6622a-9a8f-4f0b-a07d-af23a8682e67', '9ec6622a-9a8f-4f0b-a07d-af23a8682e67', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 06:32:00', '2025-06-07 06:32:00'),
('a0476bbe-0c86-4b6c-b588-6150eacc1ab4', 'a0476bbe-0c86-4b6c-b588-6150eacc1ab4', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:13:47', '2025-04-25 04:13:47'),
('a0ec2050-1702-4b3b-9dcd-8d39fedf9fdd', 'a0ec2050-1702-4b3b-9dcd-8d39fedf9fdd', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-06-11 01:41:30', '2025-06-11 01:53:36'),
('a3aad319-6ce4-4a5d-8834-7d44a1e7f8d3', 'a3aad319-6ce4-4a5d-8834-7d44a1e7f8d3', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:46:06', '2025-04-23 06:19:30'),
('a55d5946-f864-4b57-aa5e-d3e8d4c1d712', 'a55d5946-f864-4b57-aa5e-d3e8d4c1d712', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 04:05:02', '2025-04-24 06:30:31'),
('a6ea1ced-3b49-4ff5-b5f6-667660dc71c8', 'a6ea1ced-3b49-4ff5-b5f6-667660dc71c8', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:10:35', '2025-04-22 07:22:46'),
('aab0b916-7465-4dac-b383-032fda093d58', 'aab0b916-7465-4dac-b383-032fda093d58', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:43:27', '2025-04-24 06:19:25'),
('ad0fd441-5ced-4d99-960e-2cb1d883bcbf', 'ad0fd441-5ced-4d99-960e-2cb1d883bcbf', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:16:41', '2025-05-06 01:26:15'),
('ad705a7d-53a4-4737-83ae-3d73f7b5620f', 'ad705a7d-53a4-4737-83ae-3d73f7b5620f', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:19:46', '2025-06-16 07:19:46'),
('b0220e99-79e0-499e-abce-97789b70a149', 'b0220e99-79e0-499e-abce-97789b70a149', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 04:29:31', '2025-04-25 04:10:58'),
('b2cf5b58-2603-4f57-8831-1454e9558b74', 'b2cf5b58-2603-4f57-8831-1454e9558b74', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:45:16', '2025-04-25 04:10:58'),
('b44e54bc-cc9e-4c78-b5c2-e8569b32a4b7', 'b44e54bc-cc9e-4c78-b5c2-e8569b32a4b7', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:55:36', '2025-04-24 08:58:01'),
('b50f3f56-fcad-4592-b688-b31f3fe3cb0f', 'b50f3f56-fcad-4592-b688-b31f3fe3cb0f', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:20:56', '2025-04-25 04:20:56'),
('b6fc0fd2-dad8-499e-b704-f0d85fc47af4', 'b6fc0fd2-dad8-499e-b704-f0d85fc47af4', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:12:53', '2025-06-17 09:12:53'),
('bae84c78-3af7-4bb5-b7f6-1c56f4d76a8c', 'bae84c78-3af7-4bb5-b7f6-1c56f4d76a8c', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:46:33', '2025-06-16 07:46:33'),
('bb52488a-0c53-47d2-b0a1-ce86ad39f328', 'bb52488a-0c53-47d2-b0a1-ce86ad39f328', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:18:22', '2025-04-22 06:37:27'),
('bd3cfdf3-d23c-4cbc-8b0e-ec7b95a783bc', 'bd3cfdf3-d23c-4cbc-8b0e-ec7b95a783bc', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:21:10', '2025-04-24 03:43:39'),
('bde27c39-6817-4320-b4bd-22f018dc4911', 'bde27c39-6817-4320-b4bd-22f018dc4911', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:39', '2025-05-05 09:26:26'),
('be0e6158-053b-4c89-93b2-ae7a453e96dd', 'be0e6158-053b-4c89-93b2-ae7a453e96dd', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:01:45', '2025-04-22 03:42:54'),
('be4668d2-8c84-4327-88e1-b885ada6d612', 'be4668d2-8c84-4327-88e1-b885ada6d612', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:08:42', '2025-06-17 09:08:42'),
('bfc4c186-2aeb-4d41-9b88-6181908b8a4c', 'bfc4c186-2aeb-4d41-9b88-6181908b8a4c', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:34:35', '2025-04-22 03:35:45'),
('c08266e1-49a5-4926-9076-9bfee4afa8a0', 'c08266e1-49a5-4926-9076-9bfee4afa8a0', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 03:59:13', '2025-06-18 03:59:13'),
('c0c99db9-1f65-4801-b52b-88502a073f41', 'c0c99db9-1f65-4801-b52b-88502a073f41', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 00:50:11', '2025-04-24 08:58:01'),
('c19b546a-0e28-4785-8c50-2e0f55a0f7f7', 'c19b546a-0e28-4785-8c50-2e0f55a0f7f7', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:20:26', '2025-04-24 03:32:12'),
('c3f23273-67be-4500-9204-299d6f8ecafc', 'c3f23273-67be-4500-9204-299d6f8ecafc', 'd47297af-916b-405a-9e96-7f1118d4a588', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:43:15', '2025-04-25 04:10:58'),
('c427c410-8cc2-4a0c-9cbf-58a45ea24ecc', 'c427c410-8cc2-4a0c-9cbf-58a45ea24ecc', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 06:44:53', '2025-04-22 06:47:12'),
('c55a3235-30ac-47dc-ba3a-29773dc99ccf', 'c55a3235-30ac-47dc-ba3a-29773dc99ccf', '1a307a0e-269f-4824-9c7c-1afb1d3ba2d7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-23 07:52:56', '2025-04-24 08:54:57'),
('c6150d5a-9f1d-4417-bb78-d75c11d0fa1a', 'c6150d5a-9f1d-4417-bb78-d75c11d0fa1a', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-18 09:00:47', '2025-04-22 03:57:11'),
('c6b0da46-f6b2-4e77-9786-9ab955295cea', 'c6b0da46-f6b2-4e77-9786-9ab955295cea', '7179cb51-63df-4f1b-b4ca-b9475491bf9a', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-22 07:43:58', '2025-04-24 06:21:04'),
('c84936e0-0936-4d38-8a09-490d1b6b2968', 'c84936e0-0936-4d38-8a09-490d1b6b2968', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:15:52', '2025-04-25 04:15:52'),
('c94f3915-f516-46aa-85d8-74edd6169ac7', 'c94f3915-f516-46aa-85d8-74edd6169ac7', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:51:26', '2025-06-17 03:51:26'),
('d55c17bf-128c-46aa-9e2e-1e7292ec5684', 'd55c17bf-128c-46aa-9e2e-1e7292ec5684', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:26:27', '2025-04-25 04:26:27'),
('d90128e6-afae-4a64-8282-25990f2759ba', 'd90128e6-afae-4a64-8282-25990f2759ba', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:07:13', '2025-06-17 09:07:13'),
('d9741a29-1eb1-4830-ba49-41893494257f', 'd9741a29-1eb1-4830-ba49-41893494257f', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 00:51:44', '2025-06-16 00:51:44'),
('db566cfb-49c3-4140-b3e5-dda8109cbd2f', 'db566cfb-49c3-4140-b3e5-dda8109cbd2f', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:02', '2025-05-05 09:26:26'),
('dcd583f7-f983-48e9-813a-ad074ba549b3', 'dcd583f7-f983-48e9-813a-ad074ba549b3', '2f63866d-53ba-4ac6-b56c-074e1864c027', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 01:10:05', '2025-06-18 01:10:05'),
('dd66b5f0-2f50-4f6a-9208-e7ea73b3d5f2', 'dd66b5f0-2f50-4f6a-9208-e7ea73b3d5f2', '7ed9c61e-d591-4deb-9af6-7a47d0dd2816', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-04-25 04:17:42', '2025-04-25 04:17:42'),
('e21c496d-b705-400a-b5cc-56ecf6917d41', 'e21c496d-b705-400a-b5cc-56ecf6917d41', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:06:15', '2025-06-17 09:06:15'),
('e2fac57b-18c8-494e-9682-f536070f4b3c', 'e2fac57b-18c8-494e-9682-f536070f4b3c', '19c8d03d-c7c3-4d75-9a36-8788d97da71c', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:07:47', '2025-06-17 09:07:47'),
('e4eeaac1-29e5-4a77-bf5f-d11c56f71242', 'e4eeaac1-29e5-4a77-bf5f-d11c56f71242', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-07 07:23:07', '2025-06-07 07:23:07'),
('e522c95e-0b47-4fd3-8d0f-c76b59830868', 'e522c95e-0b47-4fd3-8d0f-c76b59830868', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-10 05:55:35', '2025-06-10 05:55:35'),
('e5cca269-49c2-4b92-93da-d450baf26b67', 'e5cca269-49c2-4b92-93da-d450baf26b67', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 08:59:04', '2025-04-25 04:10:58'),
('e6cd7a36-7fba-44c0-9757-506f6e8fb095', 'e6cd7a36-7fba-44c0-9757-506f6e8fb095', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-24 03:44:05', '2025-04-25 04:10:58'),
('e8d9c909-710a-4543-a042-f41bfbe27197', 'e8d9c909-710a-4543-a042-f41bfbe27197', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-11 02:01:16', '2025-06-11 02:01:16'),
('eab68f56-ec1f-4804-af4a-c0bbaadba1f8', 'eab68f56-ec1f-4804-af4a-c0bbaadba1f8', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:42:11', '2025-06-16 07:42:11'),
('ecd5f5a6-6a3d-4865-a48e-d5b689d19026', 'ecd5f5a6-6a3d-4865-a48e-d5b689d19026', '5d905b5a-8024-441e-9e2a-912fbe001367', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 09:10:48', '2025-06-17 09:10:48'),
('f12e29f5-653e-4d8f-9570-73e7422df3fb', 'f12e29f5-653e-4d8f-9570-73e7422df3fb', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:43:13', '2025-06-16 07:43:13'),
('f25d2ef3-565b-40db-a96c-413b56f1eb79', 'f25d2ef3-565b-40db-a96c-413b56f1eb79', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:49:10', '2025-06-16 07:49:10'),
('f2e9da12-6096-40b0-98d9-333989ef4d34', 'f2e9da12-6096-40b0-98d9-333989ef4d34', '774fe6d5-34dd-4e99-8e7c-23017d01a11f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:50:09', '2025-06-17 03:50:09'),
('f3d18bc2-aea3-4967-a371-449c5df3ed7d', 'f3d18bc2-aea3-4967-a371-449c5df3ed7d', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:33:17', '2025-04-24 07:00:40'),
('f5123d64-ce91-4e52-bf08-c716862c4a51', 'f5123d64-ce91-4e52-bf08-c716862c4a51', '08fea5c9-1e1b-46c2-aab4-f8348bbb4961', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:24:02', '2025-04-24 06:27:04'),
('f5224238-08e1-4d0a-bf34-4e99e1c7ad23', 'f5224238-08e1-4d0a-bf34-4e99e1c7ad23', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 01:06:01', '2025-06-17 01:06:01'),
('f52747c5-3219-4168-9c7f-25c268114328', 'f52747c5-3219-4168-9c7f-25c268114328', '27f53400-7015-4eb2-a4db-abaa6d5f4f1f', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-17 03:47:06', '2025-06-17 03:47:06'),
('f68653a6-12a9-4fee-b8fc-f61e9a707c80', 'f68653a6-12a9-4fee-b8fc-f61e9a707c80', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:27:14', '2025-05-29 09:11:39'),
('f7807f48-20a5-4e40-afc6-65f7b230a3c0', 'f7807f48-20a5-4e40-afc6-65f7b230a3c0', '2f63866d-53ba-4ac6-b56c-074e1864c027', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-18 03:16:28', '2025-06-18 03:16:28'),
('f8bbd8e2-9592-45dc-9bef-ec20e146b3c0', 'f8bbd8e2-9592-45dc-9bef-ec20e146b3c0', '2f63866d-53ba-4ac6-b56c-074e1864c027', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-14 03:49:20', '2025-06-14 03:49:20'),
('f8f1789f-1ab3-425c-896c-2c90b09333de', 'f8f1789f-1ab3-425c-896c-2c90b09333de', 'b189322a-4ae4-4ce1-8532-e51552bf0a09', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:15:17', '2025-04-25 04:18:56'),
('f8f9a8ad-04d4-4893-b353-ec0549a407f1', 'f8f9a8ad-04d4-4893-b353-ec0549a407f1', '826e7157-513f-400e-83d6-b9648c932432', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-05-05 06:13:46', '2025-05-05 06:13:46'),
('fa255ae1-96e0-4264-836a-99e67bf73ad3', 'fa255ae1-96e0-4264-836a-99e67bf73ad3', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 08:32:03', '2025-04-22 06:37:36'),
('fba16514-184d-4e4f-9968-675ce0d42352', 'fba16514-184d-4e4f-9968-675ce0d42352', '9457df71-73ab-44cb-aaf2-67210a97ba2b', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 0, '2025-06-16 07:46:09', '2025-06-16 07:46:09'),
('fbd9adcc-e766-498a-a4da-3a7ebbe9622c', 'fbd9adcc-e766-498a-a4da-3a7ebbe9622c', '6be7b809-5736-4697-8c00-94f0e4f57fc7', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-25 04:12:51', '2025-05-29 03:17:12'),
('fc79be34-0b1d-45a1-a901-2e72c186917e', 'fc79be34-0b1d-45a1-a901-2e72c186917e', '46a774e8-99a3-404e-a1aa-d8445b3cc2e4', '872ab326-b40b-4fb7-b28b-c5f8157fea7c', 1, '2025-04-19 07:21:14', '2025-04-24 06:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` char(36) NOT NULL,
  `number_plate` varchar(255) NOT NULL,
  `time_in` timestamp NOT NULL,
  `time_out` timestamp NOT NULL,
  `spot_number` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` char(36) NOT NULL,
  `code` varchar(255) NOT NULL,
  `number_plate` varchar(255) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `parking_lot_id` char(36) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `code`, `number_plate`, `customer_id`, `parking_lot_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
('1753914c-27ba-477e-bb14-df02fb175b11', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca11', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:33:20', '2025-06-17 01:33:20'),
('1753914c-27ba-477e-bb14-df02fb175b12', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca12', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:34:33', '2025-06-17 01:34:33'),
('1753914c-27ba-477e-bb14-df02fb175b13', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca13', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:35:19', '2025-06-17 01:35:19'),
('1753914c-27ba-477e-bb14-df02fb175b14', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca14', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:36:21', '2025-06-17 01:36:21'),
('1753914c-27ba-477e-bb14-df02fb175b15', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca15', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:37:26', '2025-06-17 01:37:26'),
('1753914c-27ba-477e-bb14-df02fb175b16', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca16', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:38:37', '2025-06-17 01:38:37'),
('1753914c-27ba-477e-bb14-df02fb175b17', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca17', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:40:57', '2025-06-17 01:40:57'),
('1753914c-27ba-477e-bb14-df02fb175b18', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca18', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:41:52', '2025-06-17 01:41:52'),
('1753914c-27ba-477e-bb14-df02fb175b19', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca19', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:42:40', '2025-06-17 01:42:40'),
('1753914c-27ba-477e-bb14-df02fb175b20', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca20', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:43:25', '2025-06-17 01:43:25'),
('1753914c-27ba-477e-bb14-df02fb175b21', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca21', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:44:33', '2025-06-17 01:44:33'),
('1753914c-27ba-477e-bb14-df02fb175b22', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca22', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:45:15', '2025-06-17 01:45:15'),
('1753914c-27ba-477e-bb14-df02fb175b23', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca23', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:46:12', '2025-06-17 01:46:12'),
('1753914c-27ba-477e-bb14-df02fb175b24', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca24', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:46:50', '2025-06-17 01:46:50'),
('1753914c-27ba-477e-bb14-df02fb175b25', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca25', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:52:00', '2025-06-17 01:52:00'),
('1753914c-27ba-477e-bb14-df02fb175b26', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca26', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:52:38', '2025-06-17 01:52:38'),
('1753914c-27ba-477e-bb14-df02fb175b27', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca27', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:53:12', '2025-06-17 01:53:12'),
('1753914c-27ba-477e-bb14-df02fb175b28', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca28', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:53:45', '2025-06-17 01:53:45'),
('1753914c-27ba-477e-bb14-df02fb175b29', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca29', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:54:39', '2025-06-17 01:54:39'),
('1753914c-27ba-477e-bb14-df02fb175b30', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca30', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:55:28', '2025-06-17 01:55:28'),
('1753914c-27ba-477e-bb14-df02fb175b31', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca31', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:56:39', '2025-06-17 01:56:39'),
('1753914c-27ba-477e-bb14-df02fb175b32', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca32', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:57:12', '2025-06-17 01:57:12'),
('1753914c-27ba-477e-bb14-df02fb175b33', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca33', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:57:47', '2025-06-17 01:57:47'),
('1753914c-27ba-477e-bb14-df02fb175b34', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca34', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:58:32', '2025-06-17 01:58:32'),
('1753914c-27ba-477e-bb14-df02fb175b35', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca35', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:59:08', '2025-06-17 01:59:08'),
('1753914c-27ba-477e-bb14-df02fb175b36', 'TC_20250513063432', 'r59222', 'a391b5db-9be5-4850-ab40-42b46ebdb769', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-05-13 06:34:32', '2025-05-13 06:34:32'),
('1753914c-27ba-477e-bb14-df02fb175b37', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca04', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 01:31:37', '2025-06-17 01:31:37'),
('1753914c-27ba-477e-bb14-df02fb175b80', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca80', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:01:39', '2025-06-17 02:01:39'),
('1753914c-27ba-477e-bb14-df02fb175b81', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca81', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:02:24', '2025-06-17 02:02:24'),
('1753914c-27ba-477e-bb14-df02fb175b82', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca82', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:02:59', '2025-06-17 02:02:59'),
('1753914c-27ba-477e-bb14-df02fb175b83', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca83', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:03:53', '2025-06-17 02:03:53'),
('1753914c-27ba-477e-bb14-df02fb175b84', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca84', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:04:37', '2025-06-17 02:04:37'),
('1753914c-27ba-477e-bb14-df02fb175b85', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca85', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:05:15', '2025-06-17 02:05:15'),
('1753914c-27ba-477e-bb14-df02fb175b86', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca86', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:06:02', '2025-06-17 02:06:02'),
('1753914c-27ba-477e-bb14-df02fb175b87', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca87', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:06:36', '2025-06-17 02:06:36'),
('1753914c-27ba-477e-bb14-df02fb175b88', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca88', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:07:42', '2025-06-17 02:07:42'),
('1753914c-27ba-477e-bb14-df02fb175b89', 'TC_20250513063432', 'r59222', '2368128a-5d38-4348-88e3-69291822ca89', '1b0855e2-7d89-4caa-9534-1c7f35bcb246', 0, '2025-06-17 02:08:25', '2025-06-17 02:08:25'),
('30e07aa3-fecb-48f9-8655-66fbcee368bb', 'TC_20250512074552', '92N1-78925', '2368128a-5d38-4348-88e3-69291822ca03', 'a886baf7-4b7e-46b4-a9d9-c7b13a7324b0', 0, '2025-05-12 07:45:52', '2025-05-12 07:45:52'),
('7e450297-a75a-4879-9d3d-34945aa55691', 'TC_20250517060240', '92F111111', 'a391b5db-9be5-4850-ab40-42b46ebdb764', '4b177145-1945-43dd-89fb-e89170eb69b5', 0, '2025-06-17 00:55:27', '2025-06-17 00:55:27'),
('7e450297-a75a-4879-9d3d-34945aa55694', 'TC_20250517060240', '92F22222', 'a391b5db-9be5-4850-ab40-42b46ebdb767', '4b177145-1945-43dd-89fb-e89170eb69b5', 0, '2025-06-17 00:57:35', '2025-06-17 00:57:35'),
('7e450297-a75a-4879-9d3d-34945aa55698', 'TC_20250517060247', '92N173009', 'a391b5db-9be5-4850-ab40-42b46ebdb760', '4b177145-1945-43dd-89fb-e89170eb69b5', 0, '2025-06-13 07:34:55', '2025-06-13 07:34:55'),
('7e450297-a75a-4879-9d3d-34945aa55699', 'TC_20250517060246', '92F137514', '50cbebd8-2046-4117-8175-e0607ea65b2a', '4b177145-1945-43dd-89fb-e89170eb69b5', 0, '2025-05-17 06:02:46', '2025-05-17 06:02:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casbin_rule`
--
ALTER TABLE `casbin_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`);

--
-- Indexes for table `customer_base`
--
ALTER TABLE `customer_base`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_verify`
--
ALTER TABLE `customer_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goose_db_version`
--
ALTER TABLE `goose_db_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keytoken`
--
ALTER TABLE `keytoken`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_id` (`account_id`);

--
-- Indexes for table `keytokencustomer`
--
ALTER TABLE `keytokencustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_license_id` (`role_id`);

--
-- Indexes for table `manage_booking_list`
--
ALTER TABLE `manage_booking_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_menu_parent_Id` (`menu_parent_Id`);

--
-- Indexes for table `parking_floor_management`
--
ALTER TABLE `parking_floor_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_lot`
--
ALTER TABLE `parking_lot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_management`
--
ALTER TABLE `parking_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_spot`
--
ALTER TABLE `parking_spot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indexes for table `roles_menu`
--
ALTER TABLE `roles_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`),
  ADD KEY `idx_menu_id` (`menu_id`);

--
-- Indexes for table `role_account`
--
ALTER TABLE `role_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`),
  ADD KEY `idx_account_id` (`account_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casbin_rule`
--
ALTER TABLE `casbin_rule`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `goose_db_version`
--
ALTER TABLE `goose_db_version`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keytoken`
--
ALTER TABLE `keytoken`
  ADD CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `keytokencustomer`
--
ALTER TABLE `keytokencustomer`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`id`);

--
-- Constraints for table `license`
--
ALTER TABLE `license`
  ADD CONSTRAINT `fk_role_license_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `roles_menu`
--
ALTER TABLE `roles_menu`
  ADD CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `role_account`
--
ALTER TABLE `role_account`
  ADD CONSTRAINT `fk_account_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `fk_role_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
