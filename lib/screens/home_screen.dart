import 'package:flutter/material.dart';
import 'package:toonflix_2nd/models/webtoon_model.dart';
import 'package:toonflix_2nd/services/api_service.dart';
import 'package:toonflix_2nd/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const primaryColor = Colors.teal;

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
        title: const Text(
          "Today's TooNs",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        itemBuilder: (context, index) {
          print(index);
          var webtoon = snapshot.data![index];
          return Webtoon(
            title: webtoon.title,
            thumb: webtoon.thumb,
            id: webtoon.id,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 24,
            ));
  }
}
