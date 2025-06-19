import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place.dart';

class ApiService {
  // URL của API backend.
  // QUAN TRỌNG:
  // - Dùng 'http://10.0.2.2:8080' nếu bạn chạy ứng dụng trên máy ảo Android.
  // - Dùng 'http://localhost:8080' nếu bạn chạy ứng dụng trên máy ảo iOS.
  // - Thay bằng ĐỊA CHỈ IP của máy tính (ví dụ: 'http://192.168.1.5:8080') nếu chạy trên thiết bị thật.
  static const String _baseUrl = 'http://127.0.0.1:8080/api/v1/places';

  /// Hàm gọi API để lấy tất cả các địa điểm.
  /// Trả về một Future chứa danh sách các đối tượng Place.
  Future<List<Place>> getAllPlace() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Nếu server trả về 200 OK, thì parse JSON.
        // Cần decode UTF8 để hiển thị tiếng Việt đúng.
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        return data.map((json) => Place.fromJson(json)).toList();
      } else {
        // Nếu server không trả về 200 OK, thì ném ra một exception.
        throw Exception('Lỗi khi tải dữ liệu từ API. Mã trạng thái: ${response.statusCode}');
      }
    } catch (e) {
      // Bắt lỗi kết nối hoặc các lỗi khác.
      throw Exception('Không thể kết nối tới server: $e');
    }
  }
}