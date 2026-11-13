# Men Hair Booking — Tiến độ lần 2

**Đề tài:** Xây dựng hệ thống quản lý và đặt lịch dịch vụ làm đẹp nam tích hợp thanh toán trực tuyến.

**MSSV:** 26211232351 · **GVHD:** ThS. Trần Thị Thanh Lan

**Cập nhật:** 13/11/2026 · **Hạn kiểm tra lần 2:** 14/11/2026, 17:00.

## Tiến độ

| Lần | Mốc kiểm tra | Nội dung |
| --- | --- | --- |
| 1 | 31/10/2026 — 17:00 | Đã nộp: tài khoản, xác minh email, hồ sơ, dịch vụ, mẫu tóc và thông tin salon. |
| 2 | 14/11/2026 — 17:00 | Đã cập nhật: đặt lịch, quản trị, nhân viên, phân ca, thống kê, đánh giá, bản đồ và trợ lý AI. |
| 3 | 28/11/2026 — 17:00 | Dự kiến: kiểm thử tích hợp, xử lý VNPAY và hoàn thiện APK Android. |
| 4 | 05/12/2026 — 17:00 | Dự kiến: sửa lỗi cuối, chốt bản demo và tài liệu bàn giao. |

## Chức năng đã hoàn thiện

| Vai trò | Chức năng chính |
| --- | --- |
| Khách hàng | Quản lý tài khoản; xem dịch vụ, mẫu tóc, nhân viên; đặt/hủy và theo dõi lịch; voucher, đánh giá, chat hỗ trợ; bản đồ chỉ đường và AI tư vấn. |
| Nhân viên | Xem ca và lịch được giao; bắt đầu phục vụ, hoàn thành dịch vụ; đổi mật khẩu; lọc ngày và xem thống kê cá nhân. |
| Quản trị viên | Quản lý danh mục, tài khoản nhân viên, lịch hẹn, phân/đổi ca, voucher, thông báo, tin nhắn và dashboard thống kê. |

Hệ thống kiểm tra trùng ca/lịch hẹn, cho phép phục vụ sớm khi đủ điều kiện và tính đánh giá từ khách hàng thật.
Với lịch thanh toán tại quầy, **xác nhận hoàn thành đồng thời xác nhận đã nhận đủ tiền** và cập nhật thống kê.

## VNPAY Sandbox — đang chờ hỗ trợ

Đã tích hợp VNPAY Sandbox và kiểm tra TmnCode gửi đúng mã được cấp. Hiện cổng thanh toán báo
**lỗi 71: “Website này chưa được phê duyệt”**, đang chờ VNPAY hỗ trợ kiểm tra terminal.
Chưa xác nhận giao dịch Sandbox thành công trở lại. Luồng thanh toán tại salon vẫn dùng được cho demo.

## Công nghệ và cách chạy

Flutter/Dart · Firebase Authentication/Firestore · Cloudflare Workers và Workers AI.

```sh
flutter pub get
flutter run -d chrome
```

Cần cấu hình Firebase/Cloudflare hợp lệ và tài khoản được cấp quyền cho vai trò admin/nhân viên.
Không đưa mật khẩu, Hash Secret hoặc khóa quản trị Firebase vào repo.

## Kiểm thử và tài liệu

Kết quả rà soát ngày 13/11/2026: **83 kiểm thử Flutter đạt** (1 bài online bỏ qua có chủ đích),
**97 kiểm thử Firebase/Rules/REST đạt**, **19 kiểm thử Worker đạt**.
Kiểm thử APK trên thiết bị thật và VNPAY sau hỗ trợ sẽ tiếp tục ở giai đoạn sau.

- [Hướng dẫn chạy và kiểm thử](docs/DEMO_RUNBOOK.md)
- [Backend online và Android](docs/SPARK_ANDROID.md)
- [Cấu hình VNPAY](VNPAY_SETUP.md) · [Trợ lý AI](docs/SALON_AI.md) · [Kiến trúc](docs/ARCHITECTURE.md)

Lịch sử nộp lần 1 và lần 2 được giữ nguyên trên nhánh `main`.
