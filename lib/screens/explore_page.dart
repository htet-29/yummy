import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          final categories = snapshot.data?.categories ?? [];

          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RestaurantSection(restaurants: restaurants),
              Container(
                height: 300,
                color: Colors.orange,
              ),
              Container(
                height: 600,
                color: Colors.red,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
