import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const primaryColor = Colors.teal;
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
        title: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                //두 이미지 사이 이동 애니메이션
                tag: id,
                child: Container(
                  width: 240,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          offset: const Offset(0, 2),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ]),
                  child: Image.network(thumb),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
