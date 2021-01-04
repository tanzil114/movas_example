import 'package:movas_example/movas/services/posts/mock_posts_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/posts/prod_posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

import '../app_http_service.dart';

class AppConfigService {
  final AppHttpService appHttpService;
  final PublishSubject<FeedItemsResponse> feedItemsResponse$;
  final PublishSubject<PostsService> appConfigService$;

  AppConfigService(
      this.appHttpService, this.feedItemsResponse$, this.appConfigService$);

  void addProdPostsService() {
    appConfigService$.add(ProdPostsService(appHttpService, feedItemsResponse$));
  }

  void addMockPostsService() {
    appConfigService$.add(MockPostsService(feedItemsResponse$));
  }
}
