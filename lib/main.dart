/*import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Color.fromARGB(255, 158, 109, 36),
              ],
            ),
          ),
          child: const Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    ),
  );
}*/
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(SafelyTravelApp());
}

class SafelyTravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Danh sách các hình nền
  final List<String> images = [
    'assets/homeimages/1.jpg',
    'assets/homeimages/2.jpg',
    'assets/homeimages/3.jpg',
  ];

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái cho tiêu đề
          children: [
            Text(
              'Safely Travel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Colors.orange, // Màu đầu tiên
                      Color.fromARGB(255, 65, 40, 3), // Màu thứ hai
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),
            const SizedBox(height: 4), // Khoảng cách giữa hai dòng
            Text(
              'Mỗi chuyến xe là mỗi...',
              style: TextStyle(
                fontSize: 16, // Kích thước chữ nhỏ hơn
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Colors.orange, // Màu đầu tiên
                      Color.fromARGB(255, 65, 40, 3), // Màu thứ hai
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),
          ],
        ),
        centerTitle: false, // Đặt trung tâm tiêu đề thành false
        titleSpacing: 16.0, // Thêm khoảng cách cho tiêu đề
        actions: [
          IconButton(
            icon: const Icon(Icons.message, color: Colors.orange),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.orange),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/z5904908073308_0c9be4c00932f75cb11653afd8f45cb2.jpg'),
            radius: 20,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Sử dụng PageView để hiển thị nhiều hình ảnh nền
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover, // Đảm bảo hình ảnh bao phủ toàn bộ
              );
            },
          ),
          
          // Thêm SmoothPageIndicator
          Positioned(
            bottom: 40, // Điều chỉnh vị trí của indicator
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: images.length,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.orange,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 4,
                ),
              ),
            ),
          ),

          // Văn bản hiển thị trên hình ảnh trong hộp màu xám nhạt
          Positioned(
            bottom: 100, // Điều chỉnh vị trí của văn bản
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16.0), // Thêm padding cho văn bản
              decoration: BoxDecoration(
                color: Colors.grey[300], // Màu nền xám nhạt
                borderRadius: BorderRadius.circular(10), // Bo góc
              ),
              child: const Text(
                'Chào mừng bạn đến với Safely Travel, nơi bắt đầu mọi hành trình!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 135, 95, 34), // Màu chữ để dễ nhìn trên nền
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
  
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


