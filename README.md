# Men Hair Booking — Báo cáo tiến độ lần 2

**Đề tài:** Xây dựng hệ thống quản lý và đặt lịch dịch vụ làm đẹp nam tích hợp thanh toán trực tuyến.

**Mã sinh viên:** 26211232351

**GVHD:** ThS. Trần Thị Thanh Lan

**Cập nhật tiến độ:** 13/11/2026

**Mốc kiểm tra lần 2:** 17:00 ngày 14/11/2026, giờ Việt Nam.

Ứng dụng Flutter cho khách hàng, nhân viên và quản trị viên, sử dụng Firebase
Authentication/Cloud Firestore thật và backend Cloudflare Worker online.
Bản này là bản demo đồ án; VNPAY dùng môi trường Sandbox, không thu tiền thật.

## Tiến độ theo bốn mốc của khoa

| Lần | Mốc kiểm tra | Nội dung và trạng thái |
| --- | --- | --- |
| 1 | 31/10/2026 — 17:00 | Đã nộp nền tảng Flutter/Firebase; tài khoản khách, xác minh email, hồ sơ, danh mục dịch vụ, mẫu tóc và thông tin salon. Giữ nguyên hai commit cũ, bản source tại `7cc8f1b`. |
| 2 | 14/11/2026 — 17:00 | Cập nhật bản hiện tại: đặt lịch, quản trị, nhân viên, phân ca, phục vụ, ghi nhận thanh toán, thống kê, bản đồ, đánh giá thật và trợ lý AI. VNPAY Sandbox đang chờ hỗ trợ lỗi 71. |
| 3 | 28/11/2026 — 17:00 | Dự kiến kiểm thử nhiều vai trò trên Firebase thật, xử lý tích hợp VNPAY, kiểm thử và hoàn thiện APK Android. |
| 4 | 05/12/2026 — 17:00 | Dự kiến sửa lỗi cuối, kiểm thử hồi quy, chốt APK, hướng dẫn sử dụng và kịch bản bàn giao/demo. |

## Nội dung đã hoàn thiện trong lần 2

### Khách hàng

- Đăng ký, đăng nhập, xác minh email, quên mật khẩu và cập nhật hồ sơ.
- Xem dịch vụ, giá/thời lượng, nhân viên, mẫu tóc và thông tin các chi nhánh.
- Đặt lịch theo chi nhánh, dịch vụ, thợ và giờ còn trống; backend kiểm tra ca,
  thời lượng và lịch hẹn khác để chặn trùng giờ.
- Chọn thanh toán tại salon hoặc mở cổng VNPAY Sandbox; theo dõi, hủy lịch theo điều kiện.
- Voucher, tích lũy, thông báo, đánh giá và chat hỗ trợ với admin.
- Xem chi nhánh trên bản đồ và mở Google Maps để chỉ đường.
- Trợ lý AI tư vấn dịch vụ, chuyên môn nhân viên và giờ trống từ dữ liệu Firebase;
  không tự đặt lịch hoặc tự xác nhận có chỗ khi chưa tra cứu.

### Nhân viên

- Admin tạo tài khoản email gắn với đúng hồ sơ và chi nhánh; chặn email đã sử dụng.
- Đăng nhập vào tab Lịch làm; xem lịch hẹn được giao và đổi mật khẩu.
- Bắt đầu phục vụ sớm trong cùng ngày khi khách đã đến, đang trong ca và không
  chồng lịch khác; không phục vụ hai khách đồng thời. Lưu riêng giờ bắt đầu thực tế.
- Xác nhận hoàn thành dịch vụ. **Với lịch thanh toán tại quầy, xác nhận hoàn thành
  cũng xác nhận đã nhận đủ tiền**, tự ghi nhận thanh toán và cập nhật thống kê.
  Giữ nguyên khoản đã thanh toán online; thao tác lặp không tạo thêm khoản thu.
- Lọc lịch theo hôm nay, 7 ngày, 30 ngày, một ngày và khoảng ngày.
- Thống kê cá nhân theo ngày hẹn giờ Việt Nam, tách giá trị dịch vụ và số đã thanh toán.

### Quản trị viên

- Quản lý lịch hẹn, dịch vụ, nhân viên, mẫu tóc, hotline, voucher, tích lũy,
  thông báo, tin nhắn và báo cáo.
- Quản lý tài khoản nhân viên theo ba chi nhánh; phân ca tháng, OFF và đổi ca,
  bao gồm đổi giữa hai nhân viên trong cùng ngày, có kiểm tra xung đột/lịch khách.
- Xem dashboard theo hôm nay, 7 ngày, 30 ngày, ngày tùy chọn, khoảng ngày hoặc tất cả.
  Dashboard hiện lọc theo **ngày tạo lịch**; màn hình có chú thích để phân biệt với
  thống kê nhân viên lọc theo **ngày hẹn**.
- Xem biên nhận tự ghi khi hoàn thành; vẫn ghi nhận thu tiền cho lịch cũ đã hoàn thành
  nhưng chưa thanh toán sau khi đối chiếu đã nhận tiền.
- Điểm và số lượt đánh giá tính từ đánh giá hợp lệ gắn với lịch hoàn thành;
  admin không nhập tay số liệu này.

## Vấn đề đang chờ hỗ trợ: VNPAY Sandbox

**Trạng thái tại lần nộp 2: chưa xác nhận thanh toán thành công qua cổng Sandbox hiện tại.**

- Đã tích hợp tạo URL thanh toán, ký HMAC-SHA512, Return URL và IPN.
- Đã đối chiếu URL backend thực tế: `vnp_TmnCode` trùng mã trong email VNPAY cấp.
- Khi mở cổng thanh toán, VNPAY trả **lỗi 71: “Website này chưa được phê duyệt”**.
- Đang chờ VNPAY hỗ trợ kiểm tra trạng thái terminal/website. Chưa có bằng chứng
  mã đã hết hạn, và không tự thay sang mã website khác.
- Chưa ghi nhận lỗi này là đã sửa; kết quả unit test không thay thế một giao dịch
  Sandbox thành công. Không tự đánh dấu `paid` cho giao dịch online đang lỗi.
- Luồng thanh toán tại salon và tự ghi nhận khi hoàn thành vẫn dùng được cho demo.

Cấu hình và hướng dẫn xử lý: [VNPAY_SETUP.md](VNPAY_SETUP.md).

## Công nghệ và cấu trúc source

- Flutter/Dart, Material 3; entrypoint chính: `lib/main.dart`.
- Firebase Authentication, Cloud Firestore; cấu hình/rules trong source.
- Cloudflare Worker online: `cloudflare_worker/`, dùng lại các handler nghiệp vụ tại
  `functions/src/` qua adapter REST. Firebase giữ Spark, không cần triển khai Functions lên Blaze.
- Cloudflare Workers AI cho trợ lý salon; giữ gói Free, hết hạn mức thì báo thử lại,
  không tự chuyển sang dịch vụ trả phí.
- `test/`, `functions/test/`, `cloudflare_worker/test/`: kiểm thử Flutter, Firebase và Worker.
- `docs/`: kiến trúc, triển khai, quy trình nghiệp vụ và bằng chứng kiểm thử theo thời điểm.

## Cách chạy và kiểm thử

Cần Flutter SDK, Node.js; để chạy Firebase Emulator cần thêm Firebase CLI và Java 21 trở lên.
Node 22 được dùng cho bộ Emulator. Firebase/Cloudflare online cần Internet và cấu hình hợp lệ.

```powershell
flutter pub get
flutter analyze --no-pub
flutter test --no-pub
flutter run -d chrome
```

`lib/main_preview.dart` là giao diện preview cục bộ, không dùng để chứng minh luồng Firebase thật.
Tài khoản admin/nhân viên phải được cấp quyền; không kèm mật khẩu Firebase thật trong repo.

```powershell
# Cài dependencies Worker và Functions cho kiểm thử
npm --prefix cloudflare_worker ci
npm --prefix functions install

# Kiểm thử Worker không cần giao dịch VNPAY thật
node --test cloudflare_worker/test/firestore-rest.test.js cloudflare_worker/test/payment.test.js cloudflare_worker/test/scheduling-security.test.js

# Bộ Firebase giả lập tách biệt dữ liệu thật, gồm Auth/Rules/giao dịch và REST adapter
./tools/start-local-emulators.ps1 -RunTests

# Đóng gói Android sau khi đã cài Android SDK và cấu hình build
flutter build apk --release
```

Secrets VNPAY và Firebase service account đặt ở Cloudflare Secrets, không đưa vào Git,
Flutter hoặc APK. Các file Firebase client config không phải khóa quản trị.
Không chạy các script rollout/seed/cleanup lên dữ liệu thật khi chỉ cần xem giao diện.

Hướng dẫn chi tiết:

- [Chạy demo và Firebase Emulator](docs/DEMO_RUNBOOK.md)
- [Firebase Spark và backend online cho Android](docs/SPARK_ANDROID.md)
- [Kiến trúc hệ thống](docs/ARCHITECTURE.md)
- [Trợ lý salon AI](docs/SALON_AI.md)
- [Bắt đầu phục vụ sớm](docs/EARLY_SERVICE.md)
- [Tự ghi nhận thanh toán khi hoàn thành](docs/COMPLETION_PAYMENT.md)

## Kiểm thử và giới hạn của bản nộp

- Bộ Firebase/Rules/REST đã chạy đạt **97/97** ngày 13/11/2026 trước bản nộp;
  bao gồm phân quyền, chống trùng lịch/ca, retry, phục vụ sớm và chống thu trùng.
- Rà soát trước khi nộp lần 2: Flutter **83 bài đạt, 1 bài online bỏ qua có chủ đích**;
  Worker unit/security **19/19 đạt**. Hai bài đọc báo cáo Firebase demo được cập nhật
  để kiểm tra đúng luồng tự ghi nhận thanh toán khi hoàn thành, không thu trùng lần nữa.
- Kiểm thử Flutter gọi AI online là **opt-in**, mặc định bỏ qua để không tạo tài khoản
  hoặc dùng hạn mức AI thật trong mỗi lần chạy test.
- Không khẳng định đã kiểm thử toàn bộ luồng trên điện thoại Android thật.
  Kiểm thử cài APK, trải nghiệm nhiều thiết bị và giao dịch VNPAY sau hỗ trợ còn ở giai đoạn tiếp theo.
- Chưa có chức năng tự hoàn tiền VNPAY. Các tài liệu kiểm thử cũ trong `docs/`
  mô tả phiên bản tại thời điểm ghi; trạng thái hiện tại đọc tại README này.

## Lịch sử bản nộp

Commit lần 2 nối trực tiếp sau `7cc8f1b` trên nhánh `main` của repo trường,
không xóa hoặc sửa hai commit lần 1. Source được tổng hợp từ bản phát triển
`9f7307c` ở repo cá nhân, kèm cập nhật bài đối chiếu báo cáo demo cho cơ chế
tự ghi nhận thanh toán khi hoàn thành và README tiến độ này.
