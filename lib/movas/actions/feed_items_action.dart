import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/services/posts/mock_posts_service.dart';
import 'package:movas_example/movas/services/posts/prod_posts_service.dart';

class FeedItemsA {
  FeedItemsA(this.prodPostsService, this.mockPostsService);

  final ProdPostsService prodPostsService;
  final MockPostsService mockPostsService;

  Future<void> getPosts({useProdService: true}) {
    if (useProdService) return prodPostsService.getPosts();
    return mockPostsService.getPosts();
  }

  factory FeedItemsA.of(context) => FeedItemsA(
        StaticProvider.of(context),
        StaticProvider.of(context),
      );
}
