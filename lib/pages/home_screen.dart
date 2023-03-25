import 'package:flutter/material.dart';
import 'package:news/model/dummy_news.dart';
import 'package:news/widgets/item_card.dart';

import '../model/news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: dummyNews.length,
            itemBuilder: (context, index) {
              final News news = dummyNews[index];
              return ItemCard(news: news);
            }),
      ),
    );
  }
}
