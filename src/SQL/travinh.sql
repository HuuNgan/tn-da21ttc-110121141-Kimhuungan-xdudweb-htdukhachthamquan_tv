-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 23, 2025 lúc 08:51 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `travinh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `amthuc`
--

CREATE TABLE `amthuc` (
  `id` int(11) NOT NULL,
  `tenMonAn` varchar(255) NOT NULL,
  `diaDiemAnUong` text DEFAULT NULL,
  `giaTrungBinh` decimal(10,2) DEFAULT NULL,
  `xa` varchar(100) NOT NULL,
  `tennhahang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `amthuc`
--

INSERT INTO `amthuc` (`id`, `tenMonAn`, `diaDiemAnUong`, `giaTrungBinh`, `xa`, `tennhahang`) VALUES
(35, 'Cá kho tộ', 'Gần trung tâm TP Trà Vinh, cách Khách sạn Thanh Trà 500m', 120.00, 'Phường 1', 'Nhà hàng Lúa Nếp'),
(36, 'Gà ác tiềm thuốc bắc', 'Số 01 Phạm Thái Bường, Phường 3, TP. Trà Vinh', 120.00, 'Phường 1', 'Nhà hàng Thanh Trà'),
(37, 'Ba chỉ bò Mỹ nướng sốt Bulgogi', 'Khu phố ẩm thực – Đường Trần Phú nối dài, Phường 2, TP. Trà Vinh', 219.00, 'xã Long Đức', 'Soowon BBQ Trà Vinh'),
(38, 'Buffet Món Ăn Tự Chọn', 'Khu Phố Ẩm Thực, Đường Trần Phú, Khóm 8, TP. Trà Vinh', 120.00, 'xã Đôn Châu', 'Buffet Anh Bốn'),
(39, 'Buffet Tự Chọn Món', 'Khu Phố Ẩm Thực, Đường Trần Phú, Khóm 8, TP. Trà Vinh\r\n\r\n', 120.00, 'xã Tân Hiệp', 'Buffet Anh Bốn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgiaamthuc`
--

CREATE TABLE `danhgiaamthuc` (
  `id` int(11) NOT NULL,
  `amThuc_id` int(11) DEFAULT NULL,
  `nguoiDanhGia` varchar(255) NOT NULL,
  `diemDanhGia` int(11) DEFAULT NULL CHECK (`diemDanhGia` between 1 and 5),
  `binhLuan` text DEFAULT NULL,
  `ngayDanhGia` date DEFAULT curdate(),
  `phan_hoi` text DEFAULT NULL,
  `thoi_gian_phan_hoi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgiaamthuc`
--

INSERT INTO `danhgiaamthuc` (`id`, `amThuc_id`, `nguoiDanhGia`, `diemDanhGia`, `binhLuan`, `ngayDanhGia`, `phan_hoi`, `thoi_gian_phan_hoi`) VALUES
(37, 37, 'Ngân', 5, 'Ngon ', '2025-05-26', 'Cảm ơn', '2025-06-04 08:54:35'),
(38, 38, 'Ngân', 5, 'Ngon Sạch sẽ', '2025-05-26', 'Cảm ơn', '2025-06-04 08:54:39'),
(39, 39, 'Ngân', 5, 'Ngon', '2025-05-26', 'Cảm ơn', '2025-06-04 08:54:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgiadiemden`
--

CREATE TABLE `danhgiadiemden` (
  `id` int(11) NOT NULL,
  `diem_den_id` int(11) DEFAULT NULL,
  `nguoiDanhGia` varchar(255) NOT NULL,
  `diemDanhGia` float DEFAULT NULL CHECK (`diemDanhGia` between 1 and 5),
  `binhLuan` text DEFAULT NULL,
  `ngayDanhGia` timestamp NOT NULL DEFAULT current_timestamp(),
  `phan_hoi` text DEFAULT NULL,
  `thoi_gian_phan_hoi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgiadiemden`
--

INSERT INTO `danhgiadiemden` (`id`, `diem_den_id`, `nguoiDanhGia`, `diemDanhGia`, `binhLuan`, `ngayDanhGia`, `phan_hoi`, `thoi_gian_phan_hoi`) VALUES
(2, 14, 'Diểm My', 4, 'Đẹp ', '2025-03-21 17:00:00', 'Cảm ơn', '2025-06-04 08:55:57'),
(3, 23, 'Diểm My', 5, 'Hay', '2025-03-21 17:00:00', 'Cảm ơn', '2025-06-04 08:56:00'),
(5, 16, 'Ngân', 1, 'Â', '2025-07-08 02:28:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia_datxe`
--

CREATE TABLE `danhgia_datxe` (
  `maDanhGia` int(11) NOT NULL,
  `maDatXe` int(11) DEFAULT NULL,
  `tenNguoiDung` varchar(100) NOT NULL,
  `diemDanhGia` int(11) DEFAULT NULL CHECK (`diemDanhGia` between 1 and 5),
  `binhLuan` text DEFAULT NULL,
  `thoiGian` datetime DEFAULT current_timestamp(),
  `phan_hoi` text DEFAULT NULL,
  `thoi_gian_phan_hoi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia_datxe`
--

INSERT INTO `danhgia_datxe` (`maDanhGia`, `maDatXe`, `tenNguoiDung`, `diemDanhGia`, `binhLuan`, `thoiGian`, `phan_hoi`, `thoi_gian_phan_hoi`) VALUES
(1, 2, 'Kim Hữu Ngân', 5, 'An Toàn ', '2025-04-27 18:57:05', 'Cảm ơn', '2025-06-04 08:44:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_gia_khach_san`
--

CREATE TABLE `danh_gia_khach_san` (
  `id` int(11) NOT NULL,
  `id_phong` int(11) NOT NULL,
  `id_khachsan` int(11) NOT NULL,
  `ten_nguoi_danhgia` varchar(255) NOT NULL,
  `diem_so` tinyint(4) DEFAULT NULL CHECK (`diem_so` between 1 and 5),
  `binh_luan` text DEFAULT NULL,
  `ngay_danh_gia` timestamp NOT NULL DEFAULT current_timestamp(),
  `phan_hoi` text DEFAULT NULL,
  `thoi_gian_phan_hoi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_gia_khach_san`
--

INSERT INTO `danh_gia_khach_san` (`id`, `id_phong`, `id_khachsan`, `ten_nguoi_danhgia`, `diem_so`, `binh_luan`, `ngay_danh_gia`, `phan_hoi`, `thoi_gian_phan_hoi`) VALUES
(3, 17, 7, 'Hữu ngân', 5, 'Sạch sẽ', '2025-06-04 13:19:38', 'Cảm ơn', '2025-06-04 08:54:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datxe`
--

CREATE TABLE `datxe` (
  `id` int(11) NOT NULL,
  `dichvu` varchar(100) NOT NULL,
  `loaixe` varchar(100) NOT NULL,
  `giaxe` decimal(10,2) NOT NULL,
  `trangThai` enum('Chưa xác nhận','Đã xác nhận','Hủy') NOT NULL DEFAULT 'Chưa xác nhận',
  `mota` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `datxe`
--

INSERT INTO `datxe` (`id`, `dichvu`, `loaixe`, `giaxe`, `trangThai`, `mota`) VALUES
(2, '1 chiều', 'Xe 4 chỗ', 120.00, 'Chưa xác nhận', 'Xe 4 chỗ là lựa chọn lý tưởng cho các cặp đôi, gia đình nhỏ hoặc những chuyến công tác cần sự yên tĩnh. \r\nKhông gian sạch sẽ, điều hòa mát mẻ, ghế ngồi thoải mái – giúp bạn tận hưởng trọn vẹn hành trình như đang ngồi trong chính chiếc xe của mình.'),
(3, '1 chiều', 'Xe 7 chỗ', 120.00, 'Chưa xác nhận', 'Xe 7 chỗ mang lại sự thoải mái cho nhóm gia đình hoặc bạn bè. \r\nKhông gian rộng rãi, nội thất hiện đại, điều hòa hoạt động tốt giúp mọi người dễ chịu trong suốt chuyến đi. Xe được kiểm tra kỹ trước khi khởi hành, đảm bảo an toàn tuyệt đối.'),
(4, '1 chiều', 'Xe 16 chỗ', 120.00, 'Chưa xác nhận', 'Với thiết kế thoải mái và khoang ngồi rộng rãi, xe 16 chỗ phù hợp cho các nhóm nhỏ. \r\nGhế có thể ngả nhẹ, xe trang bị điều hòa mạnh và hệ thống giảm xóc tốt – giúp hành khách không bị mệt mỏi dù đi đường dài.'),
(5, '1 chiều', 'Xe 29 chỗ', 120.00, 'Chưa xác nhận', 'Xe 29 chỗ phù hợp cho các tour du lịch, dã ngoại hay đưa đón theo đoàn. \r\nXe được bảo dưỡng định kỳ, khoang hành lý rộng, chỗ ngồi sạch sẽ và thoáng mát. Tài xế giàu kinh nghiệm sẽ đồng hành và đảm bảo chuyến đi an toàn, nhẹ nhàng.'),
(6, '1 chiều', 'Xe 45 chỗ', 120.00, 'Chưa xác nhận', 'Đây là dòng xe cao cấp, có đủ tiện nghi như máy lạnh, ghế ngả, tivi, wifi... mang đến trải nghiệm thoải mái ngay cả khi đi xa. \r\nHệ thống xe được kiểm tra định kỳ, tài xế chuyên nghiệp, luôn đặt sự an toàn và thoải mái của hành khách lên hàng đầu.'),
(7, '2 chiều xe ở lại phục vụ', 'Xe 4 chỗ', 240.00, 'Chưa xác nhận', '🚗 Xe 4 chỗ – Riêng tư & tiện lợi\r\nXe 4 chỗ là lựa chọn lý tưởng cho các cặp đôi, gia đình nhỏ hoặc những chuyến công tác cần sự yên tĩnh. Không gian sạch sẽ, điều hòa mát mẻ, ghế ngồi thoải mái – giúp bạn tận hưởng trọn vẹn hành trình như đang ngồi trong chính chiếc xe của mình.\r\n\r\n'),
(8, '2 chiều xe ở lại phục vụ', 'Xe 7 chỗ', 240.00, 'Chưa xác nhận', '🚙 Xe 7 chỗ – Rộng rãi & êm ái\r\n\"Xe 7 chỗ mang lại sự thoải mái cho nhóm gia đình hoặc bạn bè. \r\nKhông gian rộng rãi, nội thất hiện đại, điều hòa hoạt động tốt giúp mọi người dễ chịu trong suốt chuyến đi. Xe được kiểm tra kỹ trước khi khởi hành, đảm bảo an toàn tuyệt đối.\"\r\n\r\n'),
(9, '2 chiều xe ở lại phục vụ', 'Xe 16 chỗ', 240.00, 'Chưa xác nhận', '🚌 Xe 16 chỗ – Linh hoạt & đầy đủ tiện nghi\r\n\"Với thiết kế thoải mái và khoang ngồi rộng rãi, xe 16 chỗ phù hợp cho các nhóm nhỏ. \r\nGhế có thể ngả nhẹ, xe trang bị điều hòa mạnh và hệ thống giảm xóc tốt – giúp hành khách không bị mệt mỏi dù đi đường dài.\"'),
(10, '2 chiều xe ở lại phục vụ', 'Xe 29 chỗ', 240.00, 'Chưa xác nhận', 'Xe 29 chỗ – Tiện nghi & thoải mái cho nhóm đông\r\n\"Xe 29 chỗ phù hợp cho các tour du lịch, dã ngoại hay đưa đón theo đoàn. Xe được bảo dưỡng định kỳ, khoang hành lý rộng, chỗ ngồi sạch sẽ và thoáng mát. Tài xế giàu kinh nghiệm sẽ đồng hành và đảm bảo chuyến đi an toàn, nhẹ nhàng.\"'),
(11, '2 chiều xe ở lại phục vụ', 'Xe 45 chỗ', 240.00, 'Chưa xác nhận', '🚌 Xe 45 chỗ – Rộng rãi & hiện đại, phù hợp cho mọi hành trình\r\n\"Đây là dòng xe cao cấp, có đủ tiện nghi như máy lạnh, ghế ngả, tivi, wifi... mang đến trải nghiệm thoải mái ngay cả khi đi xa. Hệ thống xe được kiểm tra định kỳ, tài xế chuyên nghiệp, luôn đặt sự an toàn và thoải mái của hành khách lên hàng đầu.\"');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datxe_khachhang`
--

CREATE TABLE `datxe_khachhang` (
  `id` int(11) NOT NULL,
  `maDatXe` int(11) DEFAULT NULL,
  `hoten` varchar(255) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `diachi` text DEFAULT NULL,
  `ngaytao` datetime DEFAULT current_timestamp(),
  `diemdon` varchar(255) DEFAULT NULL,
  `diemtra` varchar(255) DEFAULT NULL,
  `ngaydi` date DEFAULT NULL,
  `ngayve` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `datxe_khachhang`
--

INSERT INTO `datxe_khachhang` (`id`, `maDatXe`, `hoten`, `sdt`, `email`, `diachi`, `ngaytao`, `diemdon`, `diemtra`, `ngaydi`, `ngayve`, `user_id`) VALUES
(14, 2, 'Kim Hữu Ngân', '0865670149', 'kimhuungan2003@gmail.com', 'trà vinh', '2025-05-30 14:41:55', 'Trà Vinh', 'Trà Vinh', '2025-05-30', '2025-05-30', 24),
(15, 2, 'Kim Hữu Ngân', '0865670149', 'kimhuungan2003@gmail.com', 'trà vinh', '2025-05-30 14:42:59', 'Trà Vinh', 'Trà Vinh', '2025-05-30', '2025-05-30', 24),
(16, 2, 'Kim Hữu Ngân', '0865670149', 'kimhuungan2003@gmail.com', 'trà vinh', '2025-06-10 19:45:23', 'Trà Vinh', 'Trà Vinh', '2025-06-10', '2025-06-11', 24),
(17, 2, 'Kim Hữu Ngân', '0865670149', 'kimhuungan2003@gmail.com', 'trà vinh', '2025-06-10 19:48:19', 'Trà Vinh', 'Trà Vinh', '2025-06-10', '2025-06-10', 24),
(18, 2, 'Kim Hữu Ngân', '0865670149', 'kimhuungan2003@gmail.com', 'trà vinh', '2025-07-08 09:38:32', 'Bà Rịa - Vũng Tàu', 'Trà Vinh ', '2025-07-08', '2025-07-08', 24);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dat_phong_khach_san`
--

CREATE TABLE `dat_phong_khach_san` (
  `id` int(11) NOT NULL,
  `ten_nguoi_dat` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `ngay_nhan` date NOT NULL,
  `ngay_tra` date NOT NULL CHECK (`ngay_tra` > `ngay_nhan`),
  `id_phong` int(11) NOT NULL,
  `id_khachsan` int(11) NOT NULL,
  `loai_phong` enum('Tiêu chuẩn','Cao cấp','Suite') NOT NULL,
  `so_luong_nguoi` int(11) DEFAULT NULL CHECK (`so_luong_nguoi` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dat_phong_khach_san`
--

INSERT INTO `dat_phong_khach_san` (`id`, `ten_nguoi_dat`, `email`, `sdt`, `ngay_nhan`, `ngay_tra`, `id_phong`, `id_khachsan`, `loai_phong`, `so_luong_nguoi`) VALUES
(21, 'Test Test', 'huungan11122@gmail.com', '123456789', '2025-05-30', '2025-05-31', 16, 6, 'Cao cấp', 1),
(22, 'Test Test', 'huungan11122@gmail.com', '123456789', '2025-06-04', '2025-06-05', 17, 7, 'Cao cấp', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemden`
--

CREATE TABLE `diemden` (
  `id` int(11) NOT NULL,
  `tenDiaDiem` varchar(255) NOT NULL,
  `gioMoCua` time DEFAULT NULL,
  `gioDongCua` time DEFAULT NULL,
  `giaVe` decimal(10,2) DEFAULT NULL,
  `cachDi` text DEFAULT NULL,
  `hinhAnh` varchar(255) DEFAULT NULL,
  `thong_tin_lich_su` text DEFAULT NULL,
  `su_kien` text DEFAULT NULL,
  `danh_gia` float DEFAULT NULL CHECK (`danh_gia` >= 0 and `danh_gia` <= 5),
  `dia_diem` varchar(255) NOT NULL,
  `nam_thanh_lap` varchar(255) DEFAULT NULL,
  `do_dung_chuan_bi` text DEFAULT NULL,
  `loaiDiaDiem` enum('Chùa','Du lịch') NOT NULL,
  `xa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diemden`
--

INSERT INTO `diemden` (`id`, `tenDiaDiem`, `gioMoCua`, `gioDongCua`, `giaVe`, `cachDi`, `hinhAnh`, `thong_tin_lich_su`, `su_kien`, `danh_gia`, `dia_diem`, `nam_thanh_lap`, `do_dung_chuan_bi`, `loaiDiaDiem`, `xa`) VALUES
(14, 'Chùa Bodhiculàmani (Chùa Ấp Sóc)', '06:00:00', '18:00:00', 0.00, 'Xe máy hoặc ô tô cá nhân.', NULL, 'Là một trong những ngôi chùa Khmer tiêu biểu tại miền Nam Việt Nam.\r\nĐược xem là trung tâm sinh hoạt tôn giáo, văn hóa của cộng đồng người Khmer.\r\nTrải qua nhiều giai đoạn lịch sử, chùa vẫn giữ được nét kiến trúc truyền thống với những họa tiết đặc sắc.', 'Lễ Chôl Chnăm Thmây (Tết cổ truyền Khmer):\r\n\r\nDiễn ra vào giữa tháng 4 dương lịch hằng năm.\r\nNgười dân Khmer đến chùa làm lễ cầu phúc, nghe giảng kinh và tham gia các hoạt động truyền thống.\r\nLễ Đôn-ta (Lễ cúng ông bà tổ tiên):\r\n\r\nThường diễn ra vào cuối tháng 9 hoặc đầu tháng 10 dương lịch.\r\nĐây là dịp để con cháu tưởng nhớ tổ tiên, làm lễ cầu siêu và phát tâm thiện nguyện.\r\nLễ Ok Om Bok (Lễ cúng trăng):\r\n\r\nTổ chức vào rằm tháng 10 âm lịch, là dịp để người Khmer tạ ơn thần mặt trăng và cầu mong mùa màng bội thu.\r\nCác hoạt động Phật giáo:\r\n\r\nNgoài các lễ hội lớn, chùa còn tổ chức các khóa tu, lễ dâng y Kathina vào tháng 10-11 âm lịch sau mùa an cư kiết hạ của chư Tăng.', 5, 'Ấp Vĩnh Hội, xã Long Đức, thành phố Trà Vinh, tỉnh Trà Vinh.', '1970', 'Trang phục: Ăn mặc lịch sự, kín đáo, tránh trang phục ngắn hoặc hở hang để tôn trọng không gian tôn nghiêm của chùa.​\r\n\r\nGiày dép: Nên mang giày dép dễ tháo ra khi vào bên trong chùa, vì theo quy định, du khách cần bỏ giày dép bên ngoài trước khi vào khu vực thờ cúng.​\r\n\r\nVật dụng cá nhân: Mang theo nước uống, nón hoặc ô để che nắng, đặc biệt khi tham quan vào mùa hè.​\r\n\r\nLưu ý: Giữ gìn vệ sinh chung, không gây ồn ào và tuân thủ các quy định của chùa.', 'Chùa', 'xã Long Đức'),
(16, 'Chùa Ông Mẹt, tên chính thức là chùa Bodhisálaràja', '06:00:00', '18:00:00', 0.00, 'Chùa Ông Mẹt nằm ở trung tâm thành phố Trà Vinh, trên đường Lê Lợi, phường 1. Du khách có thể dễ dàng di chuyển đến chùa bằng các phương tiện như xe máy, ô tô hoặc xe buýt nội thành. Vị trí thuận lợi của chùa giúp du khách dễ dàng kết nối với các tuyến đường chính và tham quan các địa điểm du lịch lân cận.', NULL, 'Chùa Ông Mẹt được ghi nhận là một trong những ngôi chùa cổ nhất trong khu vực, được thành lập vào năm 642. Chùa mang đậm nét kiến trúc truyền thống của người Khmer, với các tầng mái chồng lên nhau, tạo nên một không gian rộng lớn và thanh tịnh. Nơi đây còn có những bức tranh tường được vẽ tay, với màu sắc rực rỡ và tinh tế, thể hiện nghệ thuật và tâm linh của người dân địa phương', 'Chùa Ông Mẹt là trung tâm Phật giáo Khmer của tỉnh và được chọn đặt Văn phòng Trị sự Phật giáo Khmer hệ phái Mahanikay. Nơi đây thường xuyên tổ chức các lễ hội truyền thống của người Khmer, như lễ hội Ok Om Bok, lễ hội Chol Chnam Thmay (Tết cổ truyền của người Khmer) và nhiều hoạt động văn hóa, tôn giáo khác. Du khách có thể tham gia và trải nghiệm những nét văn hóa độc đáo trong các dịp lễ này.​', 5, 'Số 50/1 đường Lê Lợi, Phường 1, Thành phố Trà Vinh, Tỉnh Trà Vinh, Việt Nam.', 'Chùa Ông Mẹt (Bodhisálaràja) được thành lập vào khoảng năm 642.', 'Trang phục: Ăn mặc lịch sự, kín đáo, tránh trang phục ngắn hoặc hở hang để tôn trọng không gian tôn nghiêm của chùa.​\r\n\r\nGiày dép: Nên mang giày dép dễ tháo ra khi vào bên trong chùa, vì theo quy định, du khách cần bỏ giày dép bên ngoài trước khi vào khu vực thờ cúng.​\r\n\r\nVật dụng cá nhân: Mang theo nước uống, nón hoặc ô để che nắng, đặc biệt khi tham quan vào mùa hè.​\r\n\r\nLưu ý: Giữ gìn vệ sinh chung, không gây ồn ào và tuân thủ các quy định của chùa.', 'Chùa', 'Phường 1'),
(17, 'Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma', '06:00:00', '18:00:00', 0.00, 'oto hoặc moto', NULL, 'Chùa Phnô Om Pung (Sirivansaràma), còn gọi là chùa Long Trường, được xây dựng vào năm 1868.\nĐây là một trong những ngôi chùa tiêu biểu của người Khmer ở Trà Vinh, mang đậm kiến trúc truyền thống Khmer Nam Bộ.\nChùa không chỉ là nơi sinh hoạt tôn giáo mà còn là trung tâm văn hóa của cộng đồng người Khmer tại địa phương.\nTrong thời kỳ kháng chiến chống Pháp và Mỹ, chùa từng là nơi hội họp, tổ chức tuyên truyền cách mạng.\nChùa được Ủy ban nhân dân tỉnh Trà Vinh công nhận là di tích lịch sử cấp tỉnh vào ngày 15/3/2016.', 'Tháng 8/1945: Lực lượng Thanh niên Tiền phong cùng hơn 30 vị sư của chùa đã tham gia biểu tình với vũ khí thô sơ để thị uy trước chính quyền thực dân.\r\nKháng chiến chống Pháp: Chùa là nơi nuôi giấu cán bộ cách mạng, tổ chức hội họp bí mật.\r\nSau năm 1975: Chùa tiếp tục là trung tâm sinh hoạt văn hóa, giáo dục truyền thống cho người Khmer.\r\nHàng năm: Chùa tổ chức các lễ hội truyền thống quan trọng của người Khmer như Chôl Chnăm Thmây (Tết Khmer), Ok Om Bok (Lễ cúng trăng), và Dâng Y Kathina (Lễ dâng y cho sư sãi).', 5, 'Từ thành phố Trà Vinh, bạn có thể di chuyển theo quốc lộ 54 hướng về Trà Cú. Khi đến ngã ba Trạm (Phước Hưng), rẽ trái vào hương lộ 25 để đến chùa.', '1868', 'Khi đến thăm chùa, bạn nên chuẩn bị trang phục lịch sự, kín đáo, phù hợp với không gian tôn nghiêm. Nếu có dự định tham gia các lễ hội hoặc hoạt động tôn giáo, bạn có thể mang theo lễ vật như hoa, nến hoặc nhang để thể hiện sự tôn kính.\r\n\r\nĐến thăm chùa Phnô Om Pung, bạn sẽ có cơ hội tìm hiểu về kiến trúc độc đáo của người Khmer, cũng như lịch sử đấu tranh cách mạng của địa phương. Đây là điểm đến thú vị cho những ai quan tâm đến văn hóa và lịch sử Việt Nam.', 'Chùa', 'xã Tân Hiệp'),
(18, 'Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma', '06:00:00', '18:00:00', 0.00, 'oto hoặc moto', NULL, 'Chùa Phnô Om Pung (Sirivansaràma), còn gọi là chùa Long Trường, được xây dựng vào năm 1868.\r\nĐây là một trong những ngôi chùa tiêu biểu của người Khmer ở Trà Vinh, mang đậm kiến trúc truyền thống Khmer Nam Bộ.\r\nChùa không chỉ là nơi sinh hoạt tôn giáo mà còn là trung tâm văn hóa của cộng đồng người Khmer tại địa phương.\r\nTrong thời kỳ kháng chiến chống Pháp và Mỹ, chùa từng là nơi hội họp, tổ chức tuyên truyền cách mạng.\r\nChùa được Ủy ban nhân dân tỉnh Trà Vinh công nhận là di tích lịch sử cấp tỉnh vào ngày 15/3/2016.', 'Tháng 8/1945: Lực lượng Thanh niên Tiền phong cùng hơn 30 vị sư của chùa đã tham gia biểu tình với vũ khí thô sơ để thị uy trước chính quyền thực dân.\r\nKháng chiến chống Pháp: Chùa là nơi nuôi giấu cán bộ cách mạng, tổ chức hội họp bí mật.\r\nSau năm 1975: Chùa tiếp tục là trung tâm sinh hoạt văn hóa, giáo dục truyền thống cho người Khmer.\r\nHàng năm: Chùa tổ chức các lễ hội truyền thống quan trọng của người Khmer như Chôl Chnăm Thmây (Tết Khmer), Ok Om Bok (Lễ cúng trăng), và Dâng Y Kathina (Lễ dâng y cho sư sãi).', 5, 'Từ thành phố Trà Vinh, bạn có thể di chuyển theo quốc lộ 54 hướng về Trà Cú. Khi đến ngã ba Trạm (Phước Hưng), rẽ trái vào hương lộ 25 để đến chùa.', '1868', 'Khi đến thăm chùa, bạn nên chuẩn bị trang phục lịch sự, kín đáo, phù hợp với không gian tôn nghiêm. Nếu có dự định tham gia các lễ hội hoặc hoạt động tôn giáo, bạn có thể mang theo lễ vật như hoa, nến hoặc nhang để thể hiện sự tôn kính.\r\n\r\nĐến thăm chùa Phnô Om Pung, bạn sẽ có cơ hội tìm hiểu về kiến trúc độc đáo của người Khmer, cũng như lịch sử đấu tranh cách mạng của địa phương. Đây là điểm đến thú vị cho những ai quan tâm đến văn hóa và lịch sử Việt Nam.', 'Chùa', 'xã Tân Hiệp'),
(19, 'Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma', '06:00:00', '18:00:00', 0.00, 'oto hoặc moto', NULL, 'Chùa Phnô Om Pung (Sirivansaràma), còn gọi là chùa Long Trường, được xây dựng vào năm 1868.\r\nĐây là một trong những ngôi chùa tiêu biểu của người Khmer ở Trà Vinh, mang đậm kiến trúc truyền thống Khmer Nam Bộ.\r\nChùa không chỉ là nơi sinh hoạt tôn giáo mà còn là trung tâm văn hóa của cộng đồng người Khmer tại địa phương.\r\nTrong thời kỳ kháng chiến chống Pháp và Mỹ, chùa từng là nơi hội họp, tổ chức tuyên truyền cách mạng.\r\nChùa được Ủy ban nhân dân tỉnh Trà Vinh công nhận là di tích lịch sử cấp tỉnh vào ngày 15/3/2016.', 'Tháng 8/1945: Lực lượng Thanh niên Tiền phong cùng hơn 30 vị sư của chùa đã tham gia biểu tình với vũ khí thô sơ để thị uy trước chính quyền thực dân.\r\nKháng chiến chống Pháp: Chùa là nơi nuôi giấu cán bộ cách mạng, tổ chức hội họp bí mật.\r\nSau năm 1975: Chùa tiếp tục là trung tâm sinh hoạt văn hóa, giáo dục truyền thống cho người Khmer.\r\nHàng năm: Chùa tổ chức các lễ hội truyền thống quan trọng của người Khmer như Chôl Chnăm Thmây (Tết Khmer), Ok Om Bok (Lễ cúng trăng), và Dâng Y Kathina (Lễ dâng y cho sư sãi).', 5, 'Từ thành phố Trà Vinh, bạn có thể di chuyển theo quốc lộ 54 hướng về Trà Cú. Khi đến ngã ba Trạm (Phước Hưng), rẽ trái vào hương lộ 25 để đến chùa.', '1868 ', 'Khi đến thăm chùa, bạn nên chuẩn bị trang phục lịch sự, kín đáo, phù hợp với không gian tôn nghiêm. Nếu có dự định tham gia các lễ hội hoặc hoạt động tôn giáo, bạn có thể mang theo lễ vật như hoa, nến hoặc nhang để thể hiện sự tôn kính.\r\n\r\nĐến thăm chùa Phnô Om Pung, bạn sẽ có cơ hội tìm hiểu về kiến trúc độc đáo của người Khmer, cũng như lịch sử đấu tranh cách mạng của địa phương. Đây là điểm đến thú vị cho những ai quan tâm đến văn hóa và lịch sử Việt Nam.', 'Chùa', 'xã Tân Hiệp'),
(20, 'Chùa Bào Môn, còn gọi là chùa Đom Bon Bak', '06:00:00', '18:00:00', 0.00, 'Từ thành phố Trà Vinh, bạn có thể di chuyển theo hướng quốc lộ 53 về phía nam, sau đó rẽ vào đường tỉnh lộ 915B để đến xã Đôn Châu, huyện Trà Cú. Chùa Bào Môn nằm tại ấp Bào Môn của xã này.', NULL, 'Chùa Bào Môn không chỉ là nơi tu hành mà còn là địa điểm có nhiều thành tích cách mạng. Trong hai cuộc kháng chiến chống Pháp và Mỹ, chùa đã được sử dụng làm nơi nuôi chứa cán bộ cách mạng và tổ chức các hoạt động yêu nước. Sư cả Kim Nhiêu Kem cùng các nhà sư tại chùa đã tham gia tích cực vào phong trào đấu tranh, lập ra Ban Tăng sự yêu nước tỉnh, tổ chức biểu tình chống bắt lính và đòi giảm tô giảm thuế. ', 'Chùa Bào Môn thường xuyên tổ chức các lễ hội truyền thống của Phật giáo Nam Tông Khmer, thu hút đông đảo phật tử và du khách tham gia. Các sự kiện này không chỉ mang ý nghĩa tôn giáo mà còn là dịp để bảo tồn và phát huy văn hóa truyền thống của đồng bào Khmer.', 5, 'Chùa Bào Môn nằm trong khu vực có vị trí chiến lược, giáp ranh giữa ba huyện Trà Cú, Cầu Ngang và Duyên Hải. Khuôn viên chùa rộng rãi, thanh tịnh, với kiến trúc đặc trưng của chùa Khmer Nam Bộ, bao gồm chánh điện, sala và các tượng Phật được chạm khắc tin', 'Hiện tại, không có thông tin cụ thể về năm thành lập của chùa Bào Môn trong các nguồn đã tham khảo.', 'Trang phục: Nên mặc trang phục giản dị, thanh lịch, tránh quần áo ngắn, hở hang hoặc màu sắc quá sặc sỡ. Trang phục cần thể hiện sự tôn trọng và phù hợp với không gian linh thiêng của chùa. ​\r\nTHƯ VIỆN NHÀ ĐẤT\r\n\r\nLễ vật: Có thể chuẩn bị hương, hoa, quả, trà, nến để dâng cúng. Nếu chùa có ban thờ Mẫu, Tứ Phủ thì có thể dâng thêm lễ mặn như xôi, gà, giò, chả. ​\r\nHoaBinhTourist\r\n+1\r\nVietNamNet News\r\n+1\r\n\r\nCác vật dụng khác: Nếu dự định ở lại qua đêm tại chùa trong các dịp lễ hội, nên mang theo chiếu, nệm, đồ vệ sinh cá nhân, thuốc chống côn trùng, thức ăn và nước uống.', 'Chùa', 'xã Đôn Châu'),
(22, 'Đền thờ Chủ tịch Hồ Chí Minh (hay Đền thờ Bác Hồ)', '06:00:00', '18:00:00', 0.00, 'Từ trung tâm Trà Vinh:\r\nĐi theo đường 30/4 về hướng Bắc\r\nTiếp tục đi thẳng khoảng 4 km đến xã Long Đức\r\nĐến ấp Vĩnh Hội sẽ thấy khu vực Đền thờ Bác Hồ\r\nPhương tiện di chuyển:\r\nXe máy, ô tô, taxi hoặc xe buýt địa phương', NULL, 'Sau khi Chủ tịch Hồ Chí Minh qua đời (ngày 2/9/1969), nhân dân xã Long Đức đã lập bàn thờ Bác để tưởng nhớ.\r\nTháng 3/1970, Thị ủy Trà Vinh quyết định xây dựng Đền thờ Bác Hồ tại ấp Vĩnh Hội.\r\nViệc xây dựng diễn ra bí mật vào ban đêm, trong điều kiện chiến tranh khốc liệt.\r\nĐền được xây dựng với diện tích ban đầu 16m², sau này được mở rộng thành khuôn viên 5,3 ha.\r\nHiện nay, Đền thờ không chỉ là nơi tưởng nhớ Bác mà còn là địa điểm du lịch văn hóa, giáo dục truyền thống yêu nước.', 'Ngày 19/5: Lễ kỷ niệm sinh nhật Bác Hồ, tổ chức lễ dâng hương, diễn văn nghệ, hội thảo lịch sử.\r\nNgày 2/9: Quốc khánh Việt Nam, tổ chức nhiều hoạt động tưởng niệm.\r\nCác trường học, đoàn thể thường xuyên tổ chức tham quan, học tập lịch sử tại đây.', 5, 'Vị trí: Ấp Vĩnh Hội, xã Long Đức, thành phố Trà Vinh, tỉnh Trà Vinh', 'Khởi công: Tháng 3/1970 Hoàn thành: Năm 1971 Trùng tu, mở rộng: Qua nhiều giai đoạn sau năm 1975', 'Trang phục: Trang nhã, lịch sự (nên mặc áo dài tay hoặc trang phục kín đáo).\r\nGiày dép: Nên đi giày thể thao hoặc dép có quai để tiện di chuyển.\r\nNước uống: Mang theo chai nước nhỏ để giữ nước khi đi tham quan.\r\nMáy ảnh/điện thoại: Để chụp ảnh kỷ niệm (lưu ý tôn trọng không gian thiêng liêng).\r\nĐồ cúng: Nếu muốn dâng hương, có thể chuẩn bị hoa tươi, nến, nhang.\r\nTúi đựng rác: Giữ gìn vệ sinh môi trường khi tham quan.', 'Du lịch', 'xã Long Đức'),
(23, 'Ao Bà Om (còn gọi là Ao Vuông)​', '06:00:00', '18:00:00', 0.00, 'Vị trí: Ao Bà Om nằm tại khóm 4, phường 8, thành phố Trà Vinh, cách trung tâm thành phố khoảng 5 km về phía Tây Nam.​\r\nDealtoday\r\n+4\r\nBáo Pháp luật Việt Nam điện tử\r\n+4\r\nBản Quản Lý Di Tích Trà Vinh\r\n+4\r\n\r\nPhương tiện di chuyển:\r\n\r\nÔ tô: Từ trung tâm thành phố Trà Vinh, bạn có thể đi taxi hoặc xe ô tô cá nhân theo hướng Tây Nam khoảng 5 km để đến Ao Bà Om.​\r\n63Stravel\r\n+1\r\nMIA.vn\r\n+1\r\n\r\nXe máy: Nếu bạn thích khám phá và tận hưởng không khí trong lành, việc di chuyển bằng xe máy là lựa chọn lý tưởng. Bạn có thể đi theo lộ trình đường Võ Văn Kiệt - Quốc lộ 53 để đến Ao Bà Om.', NULL, 'Ao Bà Om gắn liền với truyền thuyết về sự thông minh và lòng kiên trì của phụ nữ Khmer. Theo truyền thuyết, để quyết định việc ai sẽ đào ao cung cấp nước cho làng, nam giới và nữ giới trong làng đã thi nhau đào ao. Phụ nữ với sự khéo léo đã dùng mưu kế để hoàn thành ao trước, từ đó ao được đặt tên là Ao Bà Om, tôn vinh sự thông minh của phụ nữ Khmer.', 'Hàng năm, vào dịp lễ hội Ok Om Bok (Lễ Cúng Trăng) của người Khmer, Ao Bà Om là nơi diễn ra nhiều hoạt động văn hóa truyền thống như thả đèn nước, múa dân gian và các trò chơi dân gian, thu hút đông đảo du khách tham gia.', 5, 'Chùa Âng: Gần Ao Bà Om có chùa Âng (Angkorajaborey), là ngôi chùa Khmer cổ nhất Trà Vinh, được xây dựng vào năm 990, với lối kiến trúc độc đáo và hài hòa với cảnh sắc thiên nhiên xung quanh.​ Wikipedia, bách khoa toàn thư mở  Bảo tàng Văn hóa dân tộc Khme', '990', 'Trang phục: Nên mặc trang phục thoải mái, giày dép dễ di chuyển để thuận tiện cho việc tham quan và khám phá khu vực xung quanh ao.​\r\n\r\nĐồ dùng cá nhân: Mang theo nón, kính mát, kem chống nắng để bảo vệ khỏi ánh nắng mặt trời.​\r\n\r\nNước uống và đồ ăn nhẹ: Để duy trì năng lượng trong suốt chuyến tham quan, bạn nên mang theo nước uống và một số đồ ăn nhẹ.​\r\nSOHA GROUP\r\n\r\nMáy ảnh hoặc điện thoại: Để ghi lại những khoảnh khắc đẹp và kỷ niệm tại Ao Bà Om.', '', 'xã Nguyệt Hóa'),
(24, 'Chùa Âng (tên Khmer: Angkorajaborey)', '06:00:00', '18:00:00', 0.00, 'Từ TP.HCM đến Trà Vinh:\r\n\r\nKhoảng cách: 125 km​\r\nLao Động\r\n+2\r\nMIA.vn\r\n+2\r\nLữ Hành Việt Nam\r\n\r\nPhương tiện: Xe khách hoặc xe cá nhân \r\n\r\nTừ trung tâm Trà Vinh đến chùa Âng:\r\n\r\nKhoảng cách: 5 km về hướng Tây Nam​\r\nTrà Vinh\r\n\r\nPhương tiện: Xe máy, ô tô hoặc taxi​\r\n\r\nĐường đi: Theo Quốc lộ 53 đến phường 8, chùa nằm gần Ao Bà Om và Bảo tàng Văn hóa dân tộc Khmer', NULL, 'Chùa Âng được xây dựng vào năm 990, là một trong những ngôi chùa cổ nhất tại Trà Vinh. ​\r\nthanhnien.vn\r\n\r\nKiến trúc chùa mang đậm phong cách Khmer, với khuôn viên rộng khoảng 4 ha, bao quanh bởi hào nước và cây cổ thụ. ​\r\nDU LỊCH TRÀ VINH\r\n+1\r\nDu Lịch Việt\r\n+1\r\n\r\nChùa đã được Bộ Văn hóa Thể thao và Du lịch công nhận là Di tích lịch sử văn hóa cấp quốc gia vào ngày 25/8/1994.', 'Chùa Âng là nơi diễn ra nhiều lễ hội truyền thống của người Khmer như:​\r\nDu Lịch Việt\r\n\r\nLễ hội Ok Om Bok (Lễ Cúng Trăng)​\r\n\r\nLễ hội Chôl Chnăm Thmây (Tết năm mới của người Khmer)​\r\n\r\nLễ hội Sene Đôlta (Lễ cúng ông bà)', 5, 'Chùa Âng tọa lạc tại khóm 4, phường 8, thành phố Trà Vinh, tỉnh Trà Vinh, Việt Nam.', '990', 'Trang phục: Lịch sự, kín đáo, phù hợp với không gian tôn nghiêm.​\r\n\r\nGiày dép: Thoải mái, dễ di chuyển.​\r\nDU LỊCH TRÀ VINH\r\n\r\nVật dụng cá nhân: Nón, ô (dù), nước uống.​\r\n\r\nMáy ảnh/Điện thoại: Để ghi lại khoảnh khắc đẹp.​\r\n\r\nLưu ý: Giữ gìn vệ sinh, tôn trọng quy định của chùa.', 'Chùa', 'Phường 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanhamthuc`
--

CREATE TABLE `hinhanhamthuc` (
  `id` int(11) NOT NULL,
  `amThuc_id` int(11) DEFAULT NULL,
  `hinhAnh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanhamthuc`
--

INSERT INTO `hinhanhamthuc` (`id`, `amThuc_id`, `hinhAnh`) VALUES
(218, 35, '../../../../uploadsamthuc/download (1).jpg'),
(219, 35, '../../../../uploadsamthuc/download (2).jpg'),
(220, 35, '../../../../uploadsamthuc/download (3).jpg'),
(221, 35, '../../../../uploadsamthuc/download (4).jpg'),
(222, 35, '../../../../uploadsamthuc/download.jpg'),
(223, 36, '../../../../uploadsamthuc/download (1).jpg'),
(224, 36, '../../../../uploadsamthuc/download (4).jpg'),
(225, 36, '../../../../uploadsamthuc/download (5).jpg'),
(226, 36, '../../../../uploadsamthuc/download (6).jpg'),
(227, 36, '../../../../uploadsamthuc/download (7).jpg'),
(228, 36, '../../../../uploadsamthuc/download (8).jpg'),
(229, 37, '../../../../uploadsamthuc/download (1).jpg'),
(230, 37, '../../../../uploadsamthuc/download (2).jpg'),
(231, 37, '../../../../uploadsamthuc/download (3).jpg'),
(232, 37, '../../../../uploadsamthuc/download.jpg'),
(233, 38, '../../../../uploadsamthuc/download (6).jpg'),
(234, 38, '../../../../uploadsamthuc/download (7).jpg'),
(235, 38, '../../../../uploadsamthuc/download (8).jpg'),
(236, 38, '../../../../uploadsamthuc/download (9).jpg'),
(237, 38, '../../../../uploadsamthuc/download (10).jpg'),
(238, 38, '../../../../uploadsamthuc/download (11).jpg'),
(239, 38, '../../../../uploadsamthuc/download (12).jpg'),
(240, 39, '../../../../uploadsamthuc/download (8).jpg'),
(241, 39, '../../../../uploadsamthuc/download (9).jpg'),
(242, 39, '../../../../uploadsamthuc/download (10).jpg'),
(243, 39, '../../../../uploadsamthuc/download (11).jpg'),
(244, 39, '../../../../uploadsamthuc/download (12).jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanhdiemden`
--

CREATE TABLE `hinhanhdiemden` (
  `id` int(11) NOT NULL,
  `diem_den_id` int(11) DEFAULT NULL,
  `hinhAnh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanhdiemden`
--

INSERT INTO `hinhanhdiemden` (`id`, `diem_den_id`, `hinhAnh`) VALUES
(12, 14, '../../../../uploads/1742534545_soc1.jpg'),
(13, 14, '../../../../uploads/1742534545_soc2.jpg'),
(14, 14, '../../../../uploads/1742534545_soc3.jpg'),
(15, 14, '../../../../uploads/1742534545_soc4.jpg'),
(16, 16, '../../../../uploads/1742540200_ongmec1.jpg'),
(17, 16, '../../../../uploads/1742540200_ongmec2.jpg'),
(18, 16, '../../../../uploads/1742540200_ongmec3.jpg'),
(19, 16, '../../../../uploads/1742540200_ongmec4.jpg'),
(20, 16, '../../../../uploads/1742540200_ongmec6.jpg'),
(21, 19, '../../../../uploads/1742540663_OMPUNG1.jpg'),
(22, 19, '../../../../uploads/1742540663_OMPUNG2.jpg'),
(23, 19, '../../../../uploads/1742540663_OMPUNG3.jpg'),
(24, 19, '../../../../uploads/1742540663_OMPUNG4.jpg'),
(25, 20, '../../../../uploads/1742541577_baomon1.jpg'),
(26, 20, '../../../../uploads/1742541577_baomon2.jpg'),
(27, 20, '../../../../uploads/1742541577_baomon3.jpg'),
(28, 20, '../../../../uploads/1742541577_baomon4.jpg'),
(33, 22, '../../../../uploads/1742541992_thobac1.jpg'),
(34, 22, '../../../../uploads/1742541992_thobac2.jpg'),
(35, 22, '../../../../uploads/1742541992_thobac3.jpg'),
(36, 22, '../../../../uploads/1742541992_thobac4.jpg'),
(37, 22, '../../../../uploads/1742541992_thobac5.jpg'),
(38, 23, '../../../../uploads/1742542126_ao1.jpg'),
(39, 23, '../../../../uploads/1742542126_ao2.jpg'),
(40, 23, '../../../../uploads/1742542126_ao3.jpg'),
(41, 23, '../../../../uploads/1742542126_ao4.jpg'),
(54, 24, '../../../../uploads/a1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh_datxe`
--

CREATE TABLE `hinhanh_datxe` (
  `maHinh` int(11) NOT NULL,
  `maDatXe` int(11) DEFAULT NULL,
  `tenHinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanh_datxe`
--

INSERT INTO `hinhanh_datxe` (`maHinh`, `maDatXe`, `tenHinh`) VALUES
(2, 2, '6801f6ee5f830.jpg'),
(3, 3, '6801f728a5a28.jpg'),
(4, 4, '6801f746ea5e6.jpg'),
(5, 5, '6801f75e0ab5c.jpg'),
(6, 6, '6801f77f7a7a8.jpg'),
(7, 7, '6801f99c33809.jpg'),
(8, 8, '6801fc997b875.jpg'),
(9, 9, '6801fcc70b321.jpg'),
(10, 10, '6801fd0075387.jpg'),
(11, 11, '6801fd1f743d9.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinh_anh_khach_san`
--

CREATE TABLE `hinh_anh_khach_san` (
  `id` int(11) NOT NULL,
  `id_phong` int(11) NOT NULL,
  `url_hinh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hinh_anh_khach_san`
--

INSERT INTO `hinh_anh_khach_san` (`id`, `id_phong`, `url_hinh`) VALUES
(59, 16, '1747229751_a3 (1).jpg'),
(60, 16, '1747229751_a3.jpg'),
(61, 16, '1747229751_a7.jpg'),
(62, 16, '1747229751_Deluxe-2.jpg'),
(63, 16, '1747229751_Deluxe-Double-2.jpg'),
(64, 16, '1747229751_Executive-Suite-3.jpg'),
(65, 16, '1747229751_Family-Suite-1.jpg'),
(66, 17, '1747230761_a2 (1).jpg'),
(67, 17, '1747230761_a2.jpg'),
(68, 17, '1747230761_a6.jpg'),
(69, 17, '1747230761_Deluxe-1.jpg'),
(70, 17, '1747230761_Deluxe-Double-1.jpg'),
(71, 17, '1747230761_Executive-Suite-1.jpg'),
(72, 18, '1747261614_a1.jpg'),
(73, 18, '1747261614_a8.jpg'),
(74, 18, '1747261614_Deluxe-3.jpg'),
(75, 18, '1747261614_Deluxe-Twin-1.jpg'),
(76, 18, '1747261614_Executive-Suite-2.jpg'),
(77, 18, '1747261614_Executive-Suite-6.jpg'),
(78, 18, '1747261614_Premium-Deluxe-Double-1.jpg'),
(79, 19, '1747261705_a1 (1).jpg'),
(80, 19, '1747261705_a5.jpg'),
(81, 19, '1747261705_a9.jpg'),
(82, 19, '1747261705_Deluxe-4.jpg'),
(83, 19, '1747261705_Deluxe-Twin-2.jpg'),
(84, 19, '1747261705_Executive-Suite-4.jpg'),
(85, 20, '1748220148_download (1).jpg'),
(86, 20, '1748220148_download (2).jpg'),
(87, 20, '1748220148_download (3).jpg'),
(88, 20, '1748220148_download (4).jpg'),
(89, 20, '1748220148_download (5).jpg'),
(90, 20, '1748220148_download.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `huongdanvien`
--

CREATE TABLE `huongdanvien` (
  `id` int(11) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `khu_vuc` varchar(100) DEFAULT NULL,
  `kinh_nghiem` varchar(255) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('Nam','Nữ','Khác') DEFAULT NULL,
  `trang_thai` enum('Đang hoạt động','Không hoạt động') DEFAULT 'Đang hoạt động',
  `anh` varchar(255) DEFAULT NULL,
  `gia` varchar(100) DEFAULT NULL,
  `diemden_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `huongdanvien`
--

INSERT INTO `huongdanvien` (`id`, `ten`, `so_dien_thoai`, `email`, `khu_vuc`, `kinh_nghiem`, `ngay_sinh`, `gioi_tinh`, `trang_thai`, `anh`, `gia`, `diemden_id`) VALUES
(14, 'Nguyễn Văn Hưng', '0987654321', 'hungnguyen@gmail.com', 'Trà Vinh', '8 năm trong lĩnh vực du lịch nội địa và quốc tế', '1990-08-15', 'Nam', 'Đang hoạt động', 'images.jpg', '150.000', 24),
(15, 'Trần Thị Mai', '0912345678', 'maitran@gmail.com', 'TP. Hồ Chí Minh', '5 năm', '1992-02-20', 'Nữ', 'Đang hoạt động', 'hdv-nhu-quynh.webp', '150.000', 23),
(16, 'Lê Minh Tuấn', '0963124567', 'tuanle@gmail.com', 'Trà Vinh', '6 năm', '1988-06-01', 'Nam', 'Đang hoạt động', 'ta_0.png', '150.000', 22),
(17, 'Phạm Ngọc Hạnh', '0934567890', 'hanhpham@gmail.com', 'Trà Vinh', '4 năm', '1994-12-12', 'Nữ', 'Đang hoạt động', 'hdv-nhu-ngoc.webp', '150.000', 20),
(19, 'Lê Thị Diểm My ', '1234567890', 'diemmy@gmail.com', 'Trà Vinh', '4 năm', '2003-07-04', 'Nữ', 'Đang hoạt động', 'z6524372707573_bac26aa1272aa32112e7aedadeb814b7.jpg', '200.000', 17),
(20, 'Kim Hữu Ngân', '1234567890', 'huungan@gmail.com', 'Trà Vinh', '', '2003-03-31', 'Nam', 'Đang hoạt động', 'z5532283767696_074_d31bdc2275a682f8765cb917d6543c9d.jpg', '200.000', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachsan`
--

CREATE TABLE `khachsan` (
  `id` int(11) NOT NULL,
  `ten_khachsan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachsan`
--

INSERT INTO `khachsan` (`id`, `ten_khachsan`) VALUES
(6, 'Khách sạn Duy Phương'),
(7, 'Khách sạn Cửu Long'),
(8, 'Khách sạn Thanh Trà'),
(9, 'The Rose Hotel Trà Vinh'),
(10, 'Khách sạn Hoàn Mỹ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichtrinh`
--

CREATE TABLE `lichtrinh` (
  `id` int(11) NOT NULL,
  `tenLichTrinh` varchar(255) NOT NULL,
  `moTa` text DEFAULT NULL,
  `tenDiaDiem` text DEFAULT NULL,
  `diemDen_ids` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lichtrinh`
--

INSERT INTO `lichtrinh` (`id`, `tenLichTrinh`, `moTa`, `tenDiaDiem`, `diemDen_ids`) VALUES
(1, 'Lịch Trình Chùa Trà Vinh', 'Bảo đảm tịnh tâm', 'Chùa Bodhiculàmani (Chùa Ấp Sóc), Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma, Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma, Đền thờ Chủ tịch Hồ Chí Minh (hay Đền thờ Bác Hồ)', '14,16,17,18,19,22'),
(2, 'Lịch trình mới', 'scsc', 'Chùa Bodhiculàmani (Chùa Ấp Sóc), Chùa Ông Mẹt, tên chính thức là chùa Bodhisálaràja, Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma', '14,16,17'),
(3, 'Lịch trình mới', 'dvsdvsv', 'Chùa Bodhiculàmani (Chùa Ấp Sóc)', '14'),
(5, 'Chùa Trà Vinh', 'Rất vui va rất đẹp', 'Chùa Bodhiculàmani (Chùa Ấp Sóc), Chùa Ông Mẹt, tên chính thức là chùa Bodhisálaràja, Chùa Phnô Om Pung, còn được gọi là chùa Long Trường hoặc Sirivansaràma', '14,16,17'),
(6, 'Du Lịch', 'Rất Vui', 'Chùa Bào Môn, còn gọi là chùa Đom Bon Bak, Đền thờ Chủ tịch Hồ Chí Minh (hay Đền thờ Bác Hồ)', '20,22'),
(7, 'dsvsdvsv', 'vsdvsdv', 'Chùa Bodhiculàmani (Chùa Ấp Sóc)', '14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienThoai` varchar(20) DEFAULT NULL,
  `noiDung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id`, `ten`, `email`, `sodienThoai`, `noiDung`) VALUES
(27, 'kim Hữu Ngân', 'huungan11122@gmail.com', NULL, 'Tôi muốn tham gia làm hướng dân viên về du lịch'),
(28, 'kim Hữu Ngân', 'huungan11122@gmail.com', NULL, 'Tôi muốn tham gia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong_khach_san`
--

CREATE TABLE `phong_khach_san` (
  `id` int(11) NOT NULL,
  `id_khachsan` int(11) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `tien_ich` text DEFAULT NULL,
  `gia` decimal(10,2) NOT NULL,
  `trang_thai` enum('Trống','Đã đặt') DEFAULT 'Trống',
  `so_luong` int(11) NOT NULL DEFAULT 1 CHECK (`so_luong` >= 1),
  `loai_phong` enum('Tiêu chuẩn','Cao cấp','Suite') NOT NULL,
  `xa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phong_khach_san`
--

INSERT INTO `phong_khach_san` (`id`, `id_khachsan`, `mo_ta`, `tien_ich`, `gia`, `trang_thai`, `so_luong`, `loai_phong`, `xa`) VALUES
(16, 6, 'Phòng khách sạn được thiết kế hiện đại, sang trọng và tiện nghi, mang lại cảm giác thoải mái như ở nhà. Với không gian thoáng đãng, nội thất hài hòa và ánh sáng tự nhiên, phòng là nơi lý tưởng để nghỉ ngơi và thư giãn sau một ngày dài khám phá hoặc làm việc.', '🛏️ Giường ngủ êm ái (Queen/King size hoặc 2 giường đơn)\r\n\r\n🌬️ Điều hòa nhiệt độ\r\n\r\n📺 Tivi màn hình phẳng với truyền hình cáp\r\n\r\n📶 Wi-Fi miễn phí tốc độ cao\r\n\r\n☕ Máy pha trà/cà phê\r\n\r\n🧊 Tủ lạnh mini\r\n\r\n🚿 Phòng tắm riêng với vòi sen/nước nóng lạnh\r\n\r\n🧴 Đồ dùng vệ sinh cá nhân miễn phí (khăn, sữa tắm, dầu gội, bàn chải...)\r\n\r\n🔒 Két an toàn\r\n\r\n🪞 Gương toàn thân / gương trang điểm\r\n\r\n🧳 Tủ quần áo / móc treo đồ\r\n\r\n☎️ Điện thoại bàn\r\n\r\n🪑 Bàn làm việc / Bàn trang điểm\r\n\r\n🧼 Dịch vụ dọn phòng hàng ngày\r\n', 120.00, 'Đã đặt', 4, 'Cao cấp', 'xã Long Đức'),
(17, 7, 'Phòng khách sạn được thiết kế hiện đại, sang trọng và tiện nghi, mang lại cảm giác thoải mái như ở nhà. Với không gian thoáng đãng, nội thất hài hòa và ánh sáng tự nhiên, phòng là nơi lý tưởng để nghỉ ngơi và thư giãn sau một ngày dài khám phá hoặc làm việc.', '🛏️ Giường ngủ êm ái (Queen/King size hoặc 2 giường đơn)\r\n\r\n🌬️ Điều hòa nhiệt độ\r\n\r\n📺 Tivi màn hình phẳng với truyền hình cáp\r\n\r\n📶 Wi-Fi miễn phí tốc độ cao\r\n\r\n☕ Máy pha trà/cà phê\r\n\r\n🧊 Tủ lạnh mini\r\n\r\n🚿 Phòng tắm riêng với vòi sen/nước nóng lạnh\r\n\r\n🧴 Đồ dùng vệ sinh cá nhân miễn phí (khăn, sữa tắm, dầu gội, bàn chải...)\r\n\r\n🔒 Két an toàn\r\n\r\n🪞 Gương toàn thân / gương trang điểm\r\n\r\n🧳 Tủ quần áo / móc treo đồ\r\n\r\n☎️ Điện thoại bàn\r\n\r\n🪑 Bàn làm việc / Bàn trang điểm\r\n\r\n🧼 Dịch vụ dọn phòng hàng ngày\r\n', 120.00, 'Đã đặt', 4, 'Cao cấp', 'xã Long Đức'),
(18, 8, 'Phòng khách sạn được thiết kế hiện đại, sang trọng và tiện nghi, mang lại cảm giác thoải mái như ở nhà. Với không gian thoáng đãng, nội thất hài hòa và ánh sáng tự nhiên, phòng là nơi lý tưởng để nghỉ ngơi và thư giãn sau một ngày dài khám phá hoặc làm việc.', '🛏️ Giường ngủ êm ái (Queen/King size hoặc 2 giường đơn)\r\n\r\n🌬️ Điều hòa nhiệt độ\r\n\r\n📺 Tivi màn hình phẳng với truyền hình cáp\r\n\r\n📶 Wi-Fi miễn phí tốc độ cao\r\n\r\n☕ Máy pha trà/cà phê\r\n\r\n🧊 Tủ lạnh mini\r\n\r\n🚿 Phòng tắm riêng với vòi sen/nước nóng lạnh\r\n\r\n🧴 Đồ dùng vệ sinh cá nhân miễn phí (khăn, sữa tắm, dầu gội, bàn chải...)\r\n\r\n🔒 Két an toàn\r\n\r\n🪞 Gương toàn thân / gương trang điểm\r\n\r\n🧳 Tủ quần áo / móc treo đồ\r\n\r\n☎️ Điện thoại bàn\r\n\r\n🪑 Bàn làm việc / Bàn trang điểm\r\n\r\n🧼 Dịch vụ dọn phòng hàng ngày\r\n', 120.00, 'Trống', 4, 'Cao cấp', 'Phường 1'),
(19, 9, 'Phòng khách sạn được thiết kế hiện đại, sang trọng và tiện nghi, mang lại cảm giác thoải mái như ở nhà. Với không gian thoáng đãng, nội thất hài hòa và ánh sáng tự nhiên, phòng là nơi lý tưởng để nghỉ ngơi và thư giãn sau một ngày dài khám phá hoặc làm việc.', '🛏️ Giường ngủ êm ái (Queen/King size hoặc 2 giường đơn)\r\n\r\n🌬️ Điều hòa nhiệt độ\r\n\r\n📺 Tivi màn hình phẳng với truyền hình cáp\r\n\r\n📶 Wi-Fi miễn phí tốc độ cao\r\n\r\n☕ Máy pha trà/cà phê\r\n\r\n🧊 Tủ lạnh mini\r\n\r\n🚿 Phòng tắm riêng với vòi sen/nước nóng lạnh\r\n\r\n🧴 Đồ dùng vệ sinh cá nhân miễn phí (khăn, sữa tắm, dầu gội, bàn chải...)\r\n\r\n🔒 Két an toàn\r\n\r\n🪞 Gương toàn thân / gương trang điểm\r\n\r\n🧳 Tủ quần áo / móc treo đồ\r\n\r\n☎️ Điện thoại bàn\r\n\r\n🪑 Bàn làm việc / Bàn trang điểm\r\n\r\n🧼 Dịch vụ dọn phòng hàng ngày\r\n', 120.00, 'Trống', 4, 'Cao cấp', 'xã Tân Hiệp'),
(20, 10, 'Phòng khách sạn được thiết kế hiện đại, sang trọng và tiện nghi, mang lại cảm giác thoải mái như ở nhà. Với không gian thoáng đãng, nội thất hài hòa và ánh sáng tự nhiên, phòng là nơi lý tưởng để nghỉ ngơi và thư giãn sau một ngày dài khám phá hoặc làm việc.', '🛏️ Giường ngủ êm ái (Queen/King size hoặc 2 giường đơn)\r\n\r\n🌬️ Điều hòa nhiệt độ\r\n\r\n📺 Tivi màn hình phẳng với truyền hình cáp\r\n\r\n📶 Wi-Fi miễn phí tốc độ cao\r\n\r\n☕ Máy pha trà/cà phê\r\n\r\n🧊 Tủ lạnh mini\r\n\r\n🚿 Phòng tắm riêng với vòi sen/nước nóng lạnh\r\n\r\n🧴 Đồ dùng vệ sinh cá nhân miễn phí (khăn, sữa tắm, dầu gội, bàn chải...)\r\n\r\n🔒 Két an toàn\r\n\r\n🪞 Gương toàn thân / gương trang điểm\r\n\r\n🧳 Tủ quần áo / móc treo đồ\r\n\r\n☎️ Điện thoại bàn\r\n\r\n🪑 Bàn làm việc / Bàn trang điểm\r\n\r\n🧼 Dịch vụ dọn phòng hàng ngày', 120.00, 'Trống', 4, 'Cao cấp', 'xã Đôn Châu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinh_thanh`
--

CREATE TABLE `tinh_thanh` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tinh_thanh`
--

INSERT INTO `tinh_thanh` (`id`, `name`) VALUES
(1, 'Trà Vinh'),
(2, 'An Giang'),
(3, 'Bà Rịa - Vũng Tàu'),
(4, 'Bắc Giang'),
(5, 'Bắc Kạn'),
(6, 'Bạc Liêu'),
(7, 'Bắc Ninh'),
(8, 'Bến Tre'),
(9, 'Bình Định'),
(10, 'Bình Dương'),
(11, 'Bình Phước'),
(12, 'Bình Thuận'),
(13, 'Cà Mau'),
(14, 'Cần Thơ'),
(15, 'Cao Bằng'),
(16, 'Đà Nẵng'),
(17, 'Đắk Lắk'),
(18, 'Đắk Nông'),
(19, 'Điện Biên'),
(20, 'Đồng Nai'),
(21, 'Đồng Tháp'),
(22, 'Gia Lai'),
(23, 'Hà Giang'),
(24, 'Hà Nam'),
(25, 'Hà Nội'),
(26, 'Hà Tĩnh'),
(27, 'Hải Dương'),
(28, 'Hải Phòng'),
(29, 'Hậu Giang'),
(30, 'Hòa Bình'),
(31, 'Hưng Yên'),
(32, 'Khánh Hòa'),
(33, 'Kiên Giang'),
(34, 'Kon Tum'),
(35, 'Lai Châu'),
(36, 'Lâm Đồng'),
(37, 'Lạng Sơn'),
(38, 'Lào Cai'),
(39, 'Long An'),
(40, 'Nam Định'),
(41, 'Nghệ An'),
(42, 'Ninh Bình'),
(43, 'Ninh Thuận'),
(44, 'Phú Thọ'),
(45, 'Phú Yên'),
(46, 'Quảng Bình'),
(47, 'Quảng Nam'),
(48, 'Quảng Ngãi'),
(49, 'Quảng Ninh'),
(50, 'Quảng Trị'),
(51, 'Sóc Trăng'),
(52, 'Sơn La'),
(53, 'Tây Ninh'),
(54, 'Thái Bình'),
(55, 'Thái Nguyên'),
(56, 'Thanh Hóa'),
(57, 'Thừa Thiên Huế'),
(58, 'Tiền Giang'),
(59, 'TP Hồ Chí Minh'),
(60, 'Tuyên Quang'),
(61, 'Vĩnh Long'),
(62, 'Vĩnh Phúc'),
(63, 'Yên Bái');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('admin','user','nhanvien_ks','nhanvien_at') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(100) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `role`, `created_at`, `reset_token`, `is_online`) VALUES
(1, 'Quản Trị Admin', 'kimhuungan2003@gmail.com', '$2y$10$HPM31DYvr068/SVjNHsTMeRBDTYVr6og1FIPEz9Y6kD6VfFOc6fiW', '123456789', 'admin', '2025-03-24 07:26:09', NULL, 0),
(24, 'Test Test', 'huungan11122@gmail.com', '$2y$10$ZkBPoTd1zmkhJvTlheTZQuOTnA6dsfoPf25t6OUaAhuscWdDYwbAK', '123456789', 'user', '2025-04-16 12:19:12', NULL, 1),
(26, 'Hữu Ngân', 'huungan@gmail.com', '$2y$10$gM27H42CWNOZdLzevxpx2uaTz3EYY5XikxFNHK1E5MwDMKCScxkJS', '123456789', 'nhanvien_at', '2025-05-28 11:53:10', '93f5a33f9eabe049a584cf540f5f21cd', 0),
(27, 'Diểm My', 'diemmy@gmail.com', '$2y$10$D7UOSQ8xxE6MwP/9G9lxKuF0T/6uKoNAQKLiInSV42X4RIg7YIrOe', '123456789', 'nhanvien_ks', '2025-05-28 12:47:40', '5499b29af59cee22442dd1212c7fd37a', 0),
(28, 'kim kim', 'kim@gmail.com', '$2b$10$WvEMqU8c4lH25RelidRMb.jhCNkeOfu/FE.5PjzkpSwHdbT9fgv5a', '111111111', 'user', '2025-05-30 06:30:32', NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `amthuc`
--
ALTER TABLE `amthuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhgiaamthuc`
--
ALTER TABLE `danhgiaamthuc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amThuc_id` (`amThuc_id`);

--
-- Chỉ mục cho bảng `danhgiadiemden`
--
ALTER TABLE `danhgiadiemden`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nguoiDanhGia` (`nguoiDanhGia`,`diem_den_id`),
  ADD KEY `diem_den_id` (`diem_den_id`);

--
-- Chỉ mục cho bảng `danhgia_datxe`
--
ALTER TABLE `danhgia_datxe`
  ADD PRIMARY KEY (`maDanhGia`),
  ADD KEY `maDatXe` (`maDatXe`);

--
-- Chỉ mục cho bảng `danh_gia_khach_san`
--
ALTER TABLE `danh_gia_khach_san`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_phong` (`id_phong`),
  ADD KEY `id_khachsan` (`id_khachsan`);

--
-- Chỉ mục cho bảng `datxe`
--
ALTER TABLE `datxe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `datxe_khachhang`
--
ALTER TABLE `datxe_khachhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maDatXe` (`maDatXe`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `dat_phong_khach_san`
--
ALTER TABLE `dat_phong_khach_san`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_phong` (`id_phong`),
  ADD KEY `id_khachsan` (`id_khachsan`);

--
-- Chỉ mục cho bảng `diemden`
--
ALTER TABLE `diemden`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hinhanhamthuc`
--
ALTER TABLE `hinhanhamthuc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amThuc_id` (`amThuc_id`);

--
-- Chỉ mục cho bảng `hinhanhdiemden`
--
ALTER TABLE `hinhanhdiemden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diem_den_id` (`diem_den_id`);

--
-- Chỉ mục cho bảng `hinhanh_datxe`
--
ALTER TABLE `hinhanh_datxe`
  ADD PRIMARY KEY (`maHinh`),
  ADD KEY `maDatXe` (`maDatXe`);

--
-- Chỉ mục cho bảng `hinh_anh_khach_san`
--
ALTER TABLE `hinh_anh_khach_san`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_phong` (`id_phong`);

--
-- Chỉ mục cho bảng `huongdanvien`
--
ALTER TABLE `huongdanvien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_diemden` (`diemden_id`);

--
-- Chỉ mục cho bảng `khachsan`
--
ALTER TABLE `khachsan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichtrinh`
--
ALTER TABLE `lichtrinh`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phong_khach_san`
--
ALTER TABLE `phong_khach_san`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_khachsan` (`id_khachsan`);

--
-- Chỉ mục cho bảng `tinh_thanh`
--
ALTER TABLE `tinh_thanh`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `amthuc`
--
ALTER TABLE `amthuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `danhgiaamthuc`
--
ALTER TABLE `danhgiaamthuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `danhgiadiemden`
--
ALTER TABLE `danhgiadiemden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `danhgia_datxe`
--
ALTER TABLE `danhgia_datxe`
  MODIFY `maDanhGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `danh_gia_khach_san`
--
ALTER TABLE `danh_gia_khach_san`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `datxe`
--
ALTER TABLE `datxe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `datxe_khachhang`
--
ALTER TABLE `datxe_khachhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `dat_phong_khach_san`
--
ALTER TABLE `dat_phong_khach_san`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `diemden`
--
ALTER TABLE `diemden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `hinhanhamthuc`
--
ALTER TABLE `hinhanhamthuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT cho bảng `hinhanhdiemden`
--
ALTER TABLE `hinhanhdiemden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `hinhanh_datxe`
--
ALTER TABLE `hinhanh_datxe`
  MODIFY `maHinh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `hinh_anh_khach_san`
--
ALTER TABLE `hinh_anh_khach_san`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT cho bảng `huongdanvien`
--
ALTER TABLE `huongdanvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `khachsan`
--
ALTER TABLE `khachsan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `lichtrinh`
--
ALTER TABLE `lichtrinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `phong_khach_san`
--
ALTER TABLE `phong_khach_san`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tinh_thanh`
--
ALTER TABLE `tinh_thanh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `danhgiaamthuc`
--
ALTER TABLE `danhgiaamthuc`
  ADD CONSTRAINT `danhgiaamthuc_ibfk_1` FOREIGN KEY (`amThuc_id`) REFERENCES `amthuc` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danhgiadiemden`
--
ALTER TABLE `danhgiadiemden`
  ADD CONSTRAINT `danhgiadiemden_ibfk_1` FOREIGN KEY (`diem_den_id`) REFERENCES `diemden` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danhgia_datxe`
--
ALTER TABLE `danhgia_datxe`
  ADD CONSTRAINT `danhgia_datxe_ibfk_1` FOREIGN KEY (`maDatXe`) REFERENCES `datxe` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `danh_gia_khach_san`
--
ALTER TABLE `danh_gia_khach_san`
  ADD CONSTRAINT `danh_gia_khach_san_ibfk_1` FOREIGN KEY (`id_phong`) REFERENCES `phong_khach_san` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `danh_gia_khach_san_ibfk_2` FOREIGN KEY (`id_khachsan`) REFERENCES `khachsan` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `datxe_khachhang`
--
ALTER TABLE `datxe_khachhang`
  ADD CONSTRAINT `datxe_khachhang_ibfk_1` FOREIGN KEY (`maDatXe`) REFERENCES `datxe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `datxe_khachhang_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `dat_phong_khach_san`
--
ALTER TABLE `dat_phong_khach_san`
  ADD CONSTRAINT `dat_phong_khach_san_ibfk_1` FOREIGN KEY (`id_phong`) REFERENCES `phong_khach_san` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dat_phong_khach_san_ibfk_2` FOREIGN KEY (`id_khachsan`) REFERENCES `khachsan` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinhanhamthuc`
--
ALTER TABLE `hinhanhamthuc`
  ADD CONSTRAINT `hinhanhamthuc_ibfk_1` FOREIGN KEY (`amThuc_id`) REFERENCES `amthuc` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinhanhdiemden`
--
ALTER TABLE `hinhanhdiemden`
  ADD CONSTRAINT `hinhanhdiemden_ibfk_1` FOREIGN KEY (`diem_den_id`) REFERENCES `diemden` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinhanh_datxe`
--
ALTER TABLE `hinhanh_datxe`
  ADD CONSTRAINT `hinhanh_datxe_ibfk_1` FOREIGN KEY (`maDatXe`) REFERENCES `datxe` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hinh_anh_khach_san`
--
ALTER TABLE `hinh_anh_khach_san`
  ADD CONSTRAINT `hinh_anh_khach_san_ibfk_1` FOREIGN KEY (`id_phong`) REFERENCES `phong_khach_san` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `huongdanvien`
--
ALTER TABLE `huongdanvien`
  ADD CONSTRAINT `fk_diemden` FOREIGN KEY (`diemden_id`) REFERENCES `diemden` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `phong_khach_san`
--
ALTER TABLE `phong_khach_san`
  ADD CONSTRAINT `phong_khach_san_ibfk_1` FOREIGN KEY (`id_khachsan`) REFERENCES `khachsan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
