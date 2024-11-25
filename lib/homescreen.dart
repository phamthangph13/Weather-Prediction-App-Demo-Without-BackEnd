import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'BreakingNews.dart';
import 'HomePage.dart';
import 'Authenticator.dart';
import 'Dashboard.dart';
import 'v1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  bool _obscureText = true;

  final List<Map<String, dynamic>> newsItems = [
    {"title": "Bão số 5 đổ bộ vào miền Trung", "type": "Bão"},
    {"title": "Lũ quét ở Tây Bắc gây thiệt hại nặng", "type": "Lũ"},
    {"title": "Hạn hán kéo dài tại ĐBSCL", "type": "Hạn hán"},
    {"title": "Mưa lớn gây ngập lụt tại Hà Nội", "type": "Mưa"},
    {"title": "Cảnh báo sạt lở đất tại miền núi phía Bắc", "type": "Thiên tai"},
    {"title": "Không khí lạnh tăng cường", "type": "Thời tiết"},
    {"title": "Nắng nóng gay gắt tại miền Trung", "type": "Thời tiết"},
    {"title": "Dự báo 10 cơn bão trong năm 2024", "type": "Bão"},
    {"title": "Mưa đá gây thiệt hại mùa màng", "type": "Thiên tai"},
    {"title": "Lốc xoáy tại các tỉnh ven biển", "type": "Thiên tai"},
    {"title": "Cảnh báo triều cường tại TP.HCM", "type": "Thủy triều"},
    {"title": "Rét đậm rét hại tại miền Bắc", "type": "Thời tiết"},
    {"title": "El Nino gây ảnh hưởng nghiêm trọng", "type": "Thời tiết"},
    {"title": "Mưa trái mùa tại Nam Bộ", "type": "Mưa"},
    {"title": "Cảnh báo nguy cơ cháy rừng", "type": "Thiên tai"},
    {"title": "Động đất nhẹ tại Sơn La", "type": "Thiên tai"},
    {"title": "Dông lốc gây tốc mái nhà dân", "type": "Thiên tai"},
    {"title": "Sương muối gây hại cây trồng", "type": "Thời tiết"},
    {"title": "Mực nước sông Mekong xuống thấp", "type": "Hạn hán"},
    {"title": "Bão nhiệt đới hình thành trên Biển Đông", "type": "Bão"},
    {"title": "Lũ lụt tại miền Trung", "type": "Lũ"},
    {"title": "Hạn mặn xâm nhập ĐBSCL", "type": "Hạn hán"},
    {"title": "Ma lớn kéo dài tại Bắc Bộ", "type": "Mưa"},
    {"title": "Cảnh báo lũ quét vùng núi", "type": "Lũ"}
  ];

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  void _navigateToShortTermForecast(BuildContext context, String region) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Dự báo ngắn hạn: $region'),
            backgroundColor: Color(0xFF4169E1),
          ),
          body: Center(
            child: Text('Hiển thị dự báo ngắn hạn cho $region'),
          ),
        ),
      ),
    );
  }

  void _navigateToLongTermForecast(BuildContext context, String region) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Dự báo dài hạn: $region'),
            backgroundColor: Color(0xFF4169E1),
          ),
          body: Center(
            child: Text('Hiển thị dự báo dài hạn cho $region'),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(String title, String subtitle, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(icon, color: Color(0xFF4169E1), size: 40),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF7F8C8D),
          ),
        ),
      ),
    );
  }

  List<SideMenuItem> _menuItems(String role) {
    List<SideMenuItem> items = [
      SideMenuItem(
        title: 'Tin Tức',
        onTap: (index, _) { sideMenu.changePage(index); },
        icon: const Icon(Icons.near_me),
      ),
      SideMenuItem(
        title: 'Trang Chủ',
        onTap: (index, _) { sideMenu.changePage(index); },
        icon: const Icon(Icons.home),
      ),
    ];

    if (role == 'farmer') {
      items.addAll([
        SideMenuItem(
          title: 'Dự Báo Thời Tiết',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Dự Báo Thời Tiết ',
                      style: TextStyle(color: Color(0xFF1E90FF), fontSize: 24, fontWeight: FontWeight.bold)),
                  content: SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFF0F8FF), Color(0xFFE6F3FF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,  
                                  offset: Offset(0, 3), 
                                ),
                              ],
                            ),
                            child: ExpansionTile(
                              leading: Icon(Icons.cloud_outlined, color: Color(0xFF4169E1), size: 32),
                              title: Text('Dự Báo Thời Tiết Ngắn Hạn',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF2C3E50))),
                              subtitle: Text('Chọn khu vực để xem dự báo chi tiết',
                                  style: TextStyle(color: Color(0xFF7F8C8D))),
                              children: [
                                ListTile(
                                  title: Text('Đồng bằng Bắc Bộ'),
                                  subtitle: Text('27-32°C, Có mưa rào và dông vài nơi'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Đồng bằng Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Đông Bắc Bộ'),
                                  subtitle: Text('25-30°C, Nhiều mây, có mưa vừa'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Đông Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Bắc Bộ'),
                                  subtitle: Text('23-28°C, Có mưa rào và dông rải rác'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Tây Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Bắc Trung Bộ'),
                                  subtitle: Text('30-35°C, Nắng nóng, chiều tối có mưa dông'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Bắc Trung Bộ'),
                                ),
                                ListTile(
                                  title: Text('Nam Trung Bộ'),
                                  subtitle: Text('32-37°C, Nắng nóng gay gắt'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Nam Trung Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Nguyên'),
                                  subtitle: Text('25-30°C, Nhiều mây, có mưa vừa đến mưa to'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Tây Nguyên'),
                                ),
                                ListTile(
                                  title: Text('Đông Nam Bộ'),
                                  subtitle: Text('32-35°C, Có mưa rào và dông vài nơi'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Đông Nam Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Nam Bộ'),
                                  subtitle: Text('31-34°C, Có mưa rào và dông rải rác'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Tây Nam Bộ'),
                                ),
                                ListTile(
                                  title: Text('Ven biển Nam Bộ'),
                                  subtitle: Text('29-33°C, Gió mạnh cấp 5-6, giật cấp 7'),
                                  onTap: () => _navigateToShortTermForecast(context, 'Ven biển Nam Bộ'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFF0F8FF), Color(0xFFE6F3FF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ExpansionTile(
                              leading: Icon(Icons.access_time, color: Color(0xFF4169E1), size: 32),
                              title: Text('Dự Báo Thời Tiết Dài Hạn',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF2C3E50))),
                              subtitle: Text('Chọn khu vực để xem dự báo dài hạn',
                                  style: TextStyle(color: Color(0xFF7F8C8D))),
                              children: [
                                ListTile(
                                  title: Text('Đồng bằng Bắc Bộ'),
                                  subtitle: Text('Xu hướng: Nhiệt độ tăng nhẹ, mưa giảm dần'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Đồng bằng Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Đông Bắc Bộ'),
                                  subtitle: Text('Xu hướng: Nhiều mây, mưa rào rải rác'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Đông Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Bắc Bộ'),
                                  subtitle: Text('Xu hướng: Có khả năng xuất hiện không khí lạnh'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Tây Bắc Bộ'),
                                ),
                                ListTile(
                                  title: Text('Bắc Trung Bộ'),
                                  subtitle: Text('Xu hướng: Nắng nóng kéo dài, đề phòng hạn hán'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Bắc Trung Bộ'),
                                ),
                                ListTile(
                                  title: Text('Nam Trung Bộ'),
                                  subtitle: Text('Xu hướng: Nắng nóng gay gắt, ít mưa'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Nam Trung Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Nguyên'),
                                  subtitle: Text('Xu hướng: Mưa nhiều, đề phòng lũ quét'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Tây Nguyên'),
                                ),
                                ListTile(
                                  title: Text('Đông Nam Bộ'),
                                  subtitle: Text('Xu hướng: Mưa dông về chiều, oi nóng'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Đông Nam Bộ'),
                                ),
                                ListTile(
                                  title: Text('Tây Nam Bộ'),
                                  subtitle: Text('Xu hướng: Mưa dông tăng dần, đề phòng ngập úng'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Tây Nam Bộ'),
                                ),
                                ListTile(
                                  title: Text('Ven biển Nam Bộ'),
                                  subtitle: Text('Xu hướng: Gió mạnh, sóng lớn, có thể có bão'),
                                  onTap: () => _navigateToLongTermForecast(context, 'Ven biển Nam Bộ'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Đóng',
                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.wb_sunny),
        ),
        SideMenuItem(
          title: 'Gợi Ý Kế Hoạch Sản Xuất',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Gợi Ý Kế Hoạch Sản Xuất',
                      style: TextStyle(color: Color(0xFF1E90FF))),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.grass, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý kế hoạch gieo trồng'),
                            subtitle: Text('Thông tin về thời vụ và cây trồng phù hợp'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Kế hoạch gieo trồng',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Đông Xuân'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 12-1, Thu hoạch: Tháng 4-5'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Ngô Xuân Hè'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 2-3, Thu hoạch: Tháng 5-6'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Rau Màu Vụ Hè'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 4-5, Thu hoạch: Tháng 6-7'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Hè Thu'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 5-6, Thu hoạch: Tháng 8-9'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Đậu Các Loại'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 6-7, Thu hoạch: Tháng 9-10'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Khoai Lang'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 7-8, Thu hoạch: Tháng 11-12'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Mùa'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 8-9, Thu hoạch: Tháng 12-1'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Rau Vụ Đông'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 9-10, Thu hoạch: Tháng 12-1'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Khoai Tây'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 10-11, Thu hoạch: Tháng 1-2'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Ngô Đông'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 11-12, Thu hoạch: Tháng 2-3'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Cây Ăn Quả'),
                                              subtitle: Text('Thời điểm trồng mới: Tháng 12-1, Thu hoạch: Theo mùa'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.water_drop, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý lịch tưới tiêu'),
                            subtitle: Text('Lịch tưới nước phù hợp theo thời tiết'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Lịch tưới tiêu',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Lúa - Giai đoạn mạ'),
                                              subtitle: Text('Tưới ngập 2-3cm, duy trì 3-4 ngày'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Lúa - Đẻ nhánh'),
                                              subtitle: Text('Tưới ngập 5cm, 7-10 ngày/lần'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Ngô - Giai đoạn nảy mầm'),
                                              subtitle: Text('Tưới đẫm, giữ ẩm 70-80%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Ngô - Ra hoa'),
                                              subtitle: Text('Tưới 10-12 ngày/lần, giữ ẩm cao'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Rau màu - Cây con'),
                                              subtitle: Text('Tưới phun sương, 2-3 lần/ngày'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Rau màu - Thu hoạch'),
                                              subtitle: Text('Tưới 4-5 ngày/lần, tránh úng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Cây ăn quả - Ra hoa'),
                                              subtitle: Text('Tưới 7-10 ngày/lần, giữ ẩm vừa'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Cây ăn quả - Phát triển quả'),
                                              subtitle: Text('Tưới 5-7 ngày/lần, đủ ẩm'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Đậu - Nảy mầm'),
                                              subtitle: Text('Tưới nhẹ, giữ ẩm 60-70%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Đậu - Ra hoa'),
                                              subtitle: Text('Tưới 7-8 ngày/lần, tránh úng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Khoai - Phát triển củ'),
                                              subtitle: Text('Tưới 8-10 ngày/lần, giữ ẩm vừa'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.agriculture, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý thời gian thu hoạch'),
                            subtitle: Text('Dự báo thời điểm thu hoạch tối ưu'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Thời gian thu hoạch',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Đông Xuân'),
                                              subtitle: Text('Thu hoạch khi độ ẩm 20-25%, hạt chắc vàng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Ngô'),
                                              subtitle: Text('Thu khi râu ngô khô, hạt cứng có rãnh đen'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Rau xanh'),
                                              subtitle: Text('Thu hoạch buổi sáng sớm, lá xanh mơn mởn'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Khoai lang'),
                                              subtitle: Text('Thu sau 4-5 tháng, lá vàng úa'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Đậu xanh'),
                                              subtitle: Text('Thu khi vỏ quả chuyển nâu, hạt chắc'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Lạc'),
                                              subtitle: Text('Thu khi vỏ quả có gân rõ, hạt đầy'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Cà chua'),
                                              subtitle: Text('Thu khi quả chuyển đỏ 60-70%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Dưa hấu'),
                                              subtitle: Text('Thu khi cuống quả khô, vỏ cứng bóng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Bắp cải'),
                                              subtitle: Text('Thu khi bắp chắc, tròn đều'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Ớt'),
                                              subtitle: Text('Thu khi quả chuyển màu đặc trưng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Khoai tây'),
                                              subtitle: Text('Thu sau 90-120 ngày, thân lá vàng'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Đóng',
                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.agriculture),
        ),
        SideMenuItem(
          title: 'Trang Cá Nhân',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.person),
        ),
      ]);
    } else if (role == 'admin') {
      items.addAll([
        SideMenuItem(
          title: 'Thu Thập Dữ Liệu Thời Tiết',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Thu Thập Dữ Liệu Thời Tiết',
                      style: TextStyle(color: Color(0xFF1E90FF))),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.connect_without_contact, color: Color(0xFF4169E1)),
                          title: Text('Kết Nối Với Trạm Thời Tiết Địa Phương'),
                          onTap: () {
                            // Xử lý kết nối
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.satellite_alt, color: Color(0xFF4169E1)),
                          title: Text('Lấy Dữ Liệu Từ Vệ Tinh Khí Tượng'),
                          trailing: Icon(Icons.download, color: Color(0xFF4169E1)),
                          onTap: () {
                            // Xử lý tải dữ liệu vệ tinh
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.data_usage, color: Color(0xFF4169E1)),
                          title: Text('Tổng Hợp Dữ Liệu Thời Tiết'),
                          trailing: Icon(Icons.download, color: Color(0xFF4169E1)),
                          onTap: () {
                            // Xử lý tải dữ liệu tổng hợp
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.cloud),
        ),
        SideMenuItem(
          title: 'Phân Tích Và Dự Báo Thời Tiết',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Phân Tích Và Dự Báo Thời Tiết',
                      style: TextStyle(color: Color(0xFF1E90FF))),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.analytics, color: Color(0xFF4169E1)),
                          title: Text('Xử lý dữ liệu thời tiết'),
                          subtitle: Text('Phân tích xu hướng, mô hình thời tiết từ dữ liệu thu thập'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Phân Tích Dữ Liệu',
                                      style: TextStyle(color: Color(0xFF1E90FF))),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.data_thresholding, color: Color(0xFF4169E1)),
                                            title: Text('Phân Tích Nhiệt Độ'),
                                            subtitle: Text('Biến động nhiệt độ theo thời gian, dự báo xu hướng'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.water_drop, color: Color(0xFF4169E1)),
                                            title: Text('Phân Tích Lượng Mưa'),
                                            subtitle: Text('Thống kê lượng mưa, dự báo nguy cơ ngập lụt'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.air, color: Color(0xFF4169E1)),
                                            title: Text('Phân Tích Gió'),
                                            subtitle: Text('Hướng gió, tốc độ gió và ảnh hưởng'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('Đóng',
                                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.timeline, color: Color(0xFF4169E1)),
                          title: Text('Dự báo thời tiết ngắn hạn'),
                          subtitle: Text('Dự báo chi tiết trong 24-72 giờ tới'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Dự Báo Ngắn Hạn',
                                      style: TextStyle(color: Color(0xFF1E90FF))),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.today, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo 24 Giờ'),
                                            subtitle: Text('Chi tiết thời tiết từng giờ trong ngày'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo 48 Giờ'),
                                            subtitle: Text('Dự báo thời tiết 2 ngày tới'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.calendar_month, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo 72 Giờ'),
                                            subtitle: Text('Xu hướng thời tiết 3 ngày tới'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('Đóng',
                                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: Icon(Icons.auto_graph, color: Color(0xFF4169E1)),
                          title: Text('Dự báo thời tiết dài hạn'),
                          subtitle: Text('Dự báo xu hướng thời tiết trong tháng tới'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Dự Báo Dài Hạn',
                                      style: TextStyle(color: Color(0xFF1E90FF))),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.calendar_view_week, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo Tuần'),
                                            subtitle: Text('Xu hướng thời tiết 7 ngày tới'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.calendar_view_month, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo Tháng'),
                                            subtitle: Text('Xu hướng thời tiết 30 ngày tới'),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F8FF),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Color(0xFF4169E1)),
                                          ),
                                          child: ListTile(
                                            leading: Icon(Icons.calendar_today_outlined, color: Color(0xFF4169E1)),
                                            title: Text('Dự Báo Mùa'),
                                            subtitle: Text('Xu hướng thời tiết theo mùa'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text('Đóng',
                                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          tileColor: Color(0xFFF0F8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Đóng',
                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.analytics),
        ),
        SideMenuItem(
          title: 'Gợi Ý Kế Hoạch Sản Xuất',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Gợi Ý Kế Hoạch Sản Xuất',
                      style: TextStyle(color: Color(0xFF1E90FF))),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.grass, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý kế hoạch gieo trồng'),
                            subtitle: Text('Thông tin về thời vụ và cây trồng phù hợp'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Kế hoạch gieo trồng',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Đông Xuân'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 12-1, Thu hoạch: Tháng 4-5'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Ngô Xuân Hè'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 2-3, Thu hoạch: Tháng 5-6'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Rau Màu Vụ Hè'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 4-5, Thu hoạch: Tháng 6-7'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Hè Thu'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 5-6, Thu hoạch: Tháng 8-9'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Đậu Các Loại'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 6-7, Thu hoạch: Tháng 9-10'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Khoai Lang'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 7-8, Thu hoạch: Tháng 11-12'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Mùa'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 8-9, Thu hoạch: Tháng 12-1'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Rau Vụ Đông'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 9-10, Thu hoạch: Tháng 12-1'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Khoai Tây'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 10-11, Thu hoạch: Tháng 1-2'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Ngô Đông'),
                                              subtitle: Text('Thời điểm gieo trồng: Tháng 11-12, Thu hoạch: Tháng 2-3'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.eco, color: Color(0xFF4169E1)),
                                              title: Text('Cây Ăn Quả'),
                                              subtitle: Text('Thời điểm trồng mới: Tháng 12-1, Thu hoạch: Theo mùa'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.water_drop, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý lịch tưới tiêu'),
                            subtitle: Text('Lịch tưới nước phù hợp theo thời tiết'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Lịch tưới tiêu',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Lúa - Giai đoạn mạ'),
                                              subtitle: Text('Tưới ngập 2-3cm, duy trì 3-4 ngày'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Lúa - Đẻ nhánh'),
                                              subtitle: Text('Tưới ngập 5cm, 7-10 ngày/lần'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Ngô - Giai đoạn nảy mầm'),
                                              subtitle: Text('Tưới đẫm, giữ ẩm 70-80%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Ngô - Ra hoa'),
                                              subtitle: Text('Tưới 10-12 ngày/lần, giữ ẩm cao'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Rau màu - Cây con'),
                                              subtitle: Text('Tưới phun sương, 2-3 lần/ngày'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Rau màu - Thu hoạch'),
                                              subtitle: Text('Tưới 4-5 ngày/lần, tránh úng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Cây ăn quả - Ra hoa'),
                                              subtitle: Text('Tưới 7-10 ngày/lần, giữ ẩm vừa'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Cây ăn quả - Phát triển quả'),
                                              subtitle: Text('Tưới 5-7 ngày/lần, đủ ẩm'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Đậu - Nảy mầm'),
                                              subtitle: Text('Tưới nhẹ, giữ ẩm 60-70%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Đậu - Ra hoa'),
                                              subtitle: Text('Tưới 7-8 ngày/lần, tránh úng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.schedule, color: Color(0xFF4169E1)),
                                              title: Text('Khoai - Phát triển củ'),
                                              subtitle: Text('Tưới 8-10 ngày/lần, giữ ẩm vừa'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.agriculture, color: Color(0xFF4169E1)),
                            title: Text('Gợi ý thời gian thu hoạch'),
                            subtitle: Text('Dự báo thời điểm thu hoạch tối ưu'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Thời gian thu hoạch',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Lúa Đông Xuân'),
                                              subtitle: Text('Thu hoạch khi độ ẩm 20-25%, hạt chắc vàng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Ngô'),
                                              subtitle: Text('Thu khi râu ngô khô, hạt cứng có rãnh đen'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Rau xanh'),
                                              subtitle: Text('Thu hoạch buổi sáng sớm, lá xanh mơn mởn'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Khoai lang'),
                                              subtitle: Text('Thu sau 4-5 tháng, lá vàng úa'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Đậu xanh'),
                                              subtitle: Text('Thu khi vỏ quả chuyển nâu, hạt chắc'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Lạc'),
                                              subtitle: Text('Thu khi vỏ quả có gân rõ, hạt đầy'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Cà chua'),
                                              subtitle: Text('Thu khi quả chuyển đỏ 60-70%'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Dưa hấu'),
                                              subtitle: Text('Thu khi cuống quả khô, vỏ cứng bóng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Bắp cải'),
                                              subtitle: Text('Thu khi bắp chắc, tròn đều'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Ớt'),
                                              subtitle: Text('Thu khi quả chuyển màu đặc trưng'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.calendar_today, color: Color(0xFF4169E1)),
                                              title: Text('Khoai tây'),
                                              subtitle: Text('Thu sau 90-120 ngày, thân lá vàng'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Đóng',
                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.agriculture),
        ),
        SideMenuItem(
          title: 'Cảnh Báo Thời Tiết Bất Thường',
          onTap: (index, _) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Cảnh Báo Thời Tiết Bất Thường',
                      style: TextStyle(color: Color(0xFF1E90FF))),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.sms, color: Color(0xFF4169E1)),
                            title: Text('Gửi cảnh báo qua SMS cho người dân'),
                            subtitle: Text('Thông báo khẩn cấp về thời tiết nguy hiểm'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Cảnh báo SMS',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.warning_amber, color: Colors.red),
                                              title: Text('Cảnh báo bão cấp 12'),
                                              subtitle: Text('Khu vực ven biển miền Trung'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.warning_amber, color: Colors.orange),
                                              title: Text('Cảnh báo lũ quét'),
                                              subtitle: Text('Khu vực miền núi phía Bắc'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.warning_amber, color: Colors.yellow[800]),
                                              title: Text('Cảnh báo nắng nóng'),
                                              subtitle: Text('Nhiệt độ trên 39°C tại miền Trung'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.water_drop, color: Color(0xFF4169E1)),
                            title: Text('Danh sách các khu vực hạn hán'),
                            subtitle: Text('Cập nhật tình hình hạn hán các vùng'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Khu vực hạn hán',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.water_drop, color: Colors.red),
                                              title: Text('Ninh Thuận - Bình Thuận'),
                                              subtitle: Text('Hạn hán nghiêm trọng, thiếu nước sinh hoạt'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.water_drop, color: Colors.orange),
                                              title: Text('Đồng bằng sông Cửu Long'),
                                              subtitle: Text('Xâm nhập mặn, thiếu nước ngọt'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xFF4169E1)),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.warning, color: Color(0xFF4169E1)),
                            title: Text('Danh sách các khu vực thiên tai'),
                            subtitle: Text('Cập nhật tình hình mưa lũ, bão'),
                            onTap: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Khu vực thiên tai',
                                        style: TextStyle(color: Color(0xFF1E90FF))),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.warning, color: Colors.red),
                                              title: Text('Quảng Nam - Quảng Ngãi'),
                                              subtitle: Text('Mưa lớn, nguy cơ lũ quét và sạt lở đất'),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF0F8FF),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(color: Color(0xFF4169E1)),
                                            ),
                                            child: ListTile(
                                              leading: Icon(Icons.warning, color: Colors.orange),
                                              title: Text('Khánh Hòa - Phú Yên'),
                                              subtitle: Text('Bão số 9 đang tiến vào bờ'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Đóng',
                                            style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Đóng',
                          style: TextStyle(color: Color(0xFF4169E1), fontSize: 16)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.warning),
        ),
        SideMenuItem(
          title: 'Trang Cá Nhân',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.person),
        ),
      ]);
    } else if (role == 'guest') {
      items.add(
        SideMenuItem(
          title: 'Đăng Nhập',
          onTap: (index, _) {
            Navigator.pushNamed(context, '/login');
          },
          icon: const Icon(Icons.login),
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final String role = ModalRoute.of(context)?.settings.arguments as String? ?? 'guest';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            title: Column(
              children: [
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Text(
                    'Weather Predict',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E90FF),
                    ),
                  ),
                ),
              ],
            ),
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              backgroundColor: Color(0xFFF0F8FF),
              selectedColor: Color(0xFF4169E1),
              unselectedIconColor: Color(0xFF778899),
              unselectedTitleTextStyle: TextStyle(
                color: Color(0xFF696969),
                fontSize: 16,
              ),
              selectedTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              selectedIconColor: Colors.white,
              hoverColor: Color(0xFF87CEEB).withOpacity(0.3),
            ),
            items: _menuItems(role),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                BreakingNews(newsItems: newsItems),
                HomePage(),
                Dashboard(role: role),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
