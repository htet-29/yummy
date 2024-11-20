import '../models/models.dart';

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(
    this.restaurants,
    this.categories,
    this.friendPosts,
  );
}

class MockYummyService {
  Future<ExploreData> _getExploreData() async {
    final restaurants = await _getRestaurants();
    final friendPosts = await _getFriendPosts();
    final categories = await _getCategories();

    return ExploreData(restaurants, categories, friendPosts);
  }

  Future<List<FoodCategory>> _getCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return categories;
  }

  Future<List<Post>> _getFriendPosts() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return posts;
  }

  Future<List<Restaurant>> _getRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return restaurants;
  }
}
