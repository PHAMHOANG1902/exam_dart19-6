import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASC Travel App',
      // Cài đặt theme chung cho ứng dụng
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Sử dụng font 'Inter' cho toàn bộ ứng dụng.
        // Bạn cần thêm font này vào file pubspec.yaml và thư mục assets.
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.grey[50], // Màu nền chung
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}