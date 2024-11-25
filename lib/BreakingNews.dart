import 'package:flutter/material.dart';

class BreakingNews extends StatelessWidget {
  final List<Map<String, dynamic>> newsItems;

  const BreakingNews({Key? key, required this.newsItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            leading: Icon(
              _getIconForType(newsItems[index]["type"]),
              color: _getColorForType(newsItems[index]["type"]),
              size: 32,
            ),
            title: Text(
              newsItems[index]["title"],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              newsItems[index]["type"],
              style: TextStyle(
                color: _getColorForType(newsItems[index]["type"]),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle news item tap
            },
          ),
        );
      },
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case "Bão":
        return Icons.cyclone;
      case "Lũ":
        return Icons.water;
      case "Hạn hán":
        return Icons.wb_sunny;
      case "Mưa":
        return Icons.beach_access;
      case "Thiên tai":
        return Icons.warning;
      case "Thời tiết":
        return Icons.cloud;
      case "Thủy triều":
        return Icons.waves;
      default:
        return Icons.article;
    }
  }

  Color _getColorForType(String type) {
    switch (type) {
      case "Bão":
        return Colors.red;
      case "Lũ":
        return Colors.blue;
      case "Hạn hán":
        return Colors.orange;
      case "Mưa":
        return Colors.lightBlue;
      case "Thiên tai":
        return Colors.deepOrange;
      case "Thời tiết":
        return Colors.green;
      case "Thủy triều":
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }
}
