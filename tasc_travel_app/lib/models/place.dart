class Place {
  final int id;
  final String name;
  final String location;
  final String imageUrl;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  // Factory constructor để tạo một đối tượng Place từ JSON.
  // Giúp chuyển đổi dữ liệu từ API thành đối tượng Dart.
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imageUrl: json['imageUrl'],
    );
  }
}