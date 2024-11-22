import 'package:flutter/material.dart';
import 'package:yummy/screens/explore_page/widgets/category_section.dart';
import 'package:yummy/screens/explore_page/widgets/post_section.dart';
import 'package:yummy/screens/explore_page/widgets/restaurant_section.dart';
import '../../services/yummy_service.dart';

class ExplorePage extends StatelessWidget {
  final mockService = YummyService();

  ExplorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                RestaurantSection(
                  restaurants: restaurants,
                ),
                PostSection(posts: posts),
                CategorySection(categories: categories),
              ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
