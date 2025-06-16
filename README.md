# tn-da21ttc-110121141-kimhuungan-xdudweb-htdukhachthamquan_tv
# GIỚI THIỆU ĐỒ ÁN
Tên đề tài: Xây dựng ứng dụng web hỗ trợ du khách đến tham quan tỉnh Trà Vinh
# 1. Mục tiêu của đề tài
Mục tiêu chính của đề tài là thiết kế và xây dựng một ứng dụng web giúp du khách dễ dàng tìm hiểu, lên kế hoạch và trải nghiệm du lịch tại tỉnh Trà Vinh.
Hệ thống cung cấp các chức năng chính sau:
Giới thiệu các địa điểm du lịch nổi bật tại Trà Vinh (văn hóa, du lịch sinh thái, ẩm thực, khách sạn, phương tiện).
Gợi ý lịch trình tham quan theo chủ đề.
Cung cấp thông tin về du lịch, khách sạn, ẩm thực, phương tiện di chuyển.
Hỗ trợ người dùng tìm kiếm theo các địa điểm.
Giao diện thân thiện.
# 2. Kiến trúc hệ thống
Ứng dụng được xây dựng theo kiến trúc Client - Server, gồm 3 lớp cơ bản:
Frontend (Giao diện người dùng):
Sử dụng HTML, CSS, Bootstrap để tạo giao diện hiện đại, responsive, dễ sử dụng.
Backend (Xử lý logic & dữ liệu):
Viết bằng PHP, chịu trách nhiệm xử lý dữ liệu nhập vào, truy vấn và giao tiếp với cơ sở dữ liệu.
Database (Lưu trữ dữ liệu):
Dùng MySQL để lưu thông tin về các địa điểm du lịch, lịch trình, khách sạn, ẩm thực, tài khoản người dùng và nhiều bảng dữ liệu khác
# 3. Các phần mềm và công cụ cần thiết
Để triển khai và chạy ứng dụng, cần cài đặt các phần mềm sau:
XAMPP -> Chạy Apache, MySQL, PHP (localhost)
VS Code -> Soạn thảo và quản lý mã nguồn
phpMyAdmin -> Quản lý cơ sở dữ liệu MySQL
# 4. Hướng dẫn chạy chương trình
Bước 1: Cài đặt và khởi động XAMPP
Bật Apache và MySQL từ XAMPP Control Panel.
Bước 2: Tạo cơ sở dữ liệu
Truy cập: http://localhost/phpmyadmin
Tạo CSDL tên: travinh
Import file .sql.
Bước 3: Copy mã nguồn
Đặt toàn bộ thư mục dự án vào: C:\xampp\htdocs\ten_thu_muc_du_an
Bước 4: Cấu hình kết nối cơ sở dữ liệu
Mở file connect.php chỉnh sửa:
Bước 5: Chạy ứng dụng
Mở trình duyệt, truy cập:
http://localhost/ten_thu_muc_du_an/index.php


