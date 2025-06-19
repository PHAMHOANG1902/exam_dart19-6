import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sử dụng một Future để lưu trữ kết quả của việc gọi API
  late Future<List<Place>> _placesFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Bắt đầu gọi API ngay khi widget được tạo
    _placesFuture = _apiService.getAllPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: [
            // Phần Header Chào mừng (không đổi)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chào mừng, TASC!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Hãy khám phá những địa điểm tuyệt vời',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('https://placehold.co/100x100/EFEFEF/AAAAAA&text=User'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Phần Tiêu đề "Điểm đến Phổ biến" (không đổi)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Điểm đến Phổ biến',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            // **Khu vực cuộn ngang được cập nhật để dùng FutureBuilder**
            SizedBox(
              height: 250,
              child: FutureBuilder<List<Place>>(
                future: _placesFuture,
                builder: (context, snapshot) {
                  // 1. Khi đang chờ dữ liệu
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // 2. Khi có lỗi xảy ra
                  if (snapshot.hasError) {
                    return Center(child: Text('Lỗi tải dữ liệu: ${snapshot.error}'));
                  }
                  // 3. Khi không có dữ liệu trả về
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Không có địa điểm nào.'));
                  }

                  // 4. Khi đã có dữ liệu, hiển thị danh sách
                  final places = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) {
                      final place = places[index];
                      // Gọi hàm xây dựng card với đối tượng Place
                      return _buildPlaceCard(place: place);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget private để xây dựng giao diện cho mỗi thẻ địa điểm.
  /// Đã được cập nhật để nhận một đối tượng Place.
  Widget _buildPlaceCard({required Place place}) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh địa điểm
            Expanded(
              child: Image.network(
                place.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error_outline, color: Colors.red, size: 40);
                },
              ),
            ),
            // Thông tin tên và vị trí
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey[600], size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          place.location,
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
