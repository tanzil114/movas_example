import 'package:movas_example/data/dummy_feed_items.dart';
import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class MockPostsService extends PostsService {
  MockPostsService(AppHttpService appHttpService,
      PublishSubject<FeedItemsResponse> feedItemsResponse$)
      : super(appHttpService, feedItemsResponse$);

  @override
  Future<void> getPosts() {
    final feedItemsResponse = FeedItemsResponse.fromList(dummyFeedItems);
    feedItemsResponse$.add(feedItemsResponse);
    return null;
  }
}
