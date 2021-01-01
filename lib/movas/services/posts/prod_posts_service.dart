import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class ProdPostsService extends PostsService {
  ProdPostsService(AppHttpService appHttpService,
      PublishSubject<FeedItemsResponse> feedItemsResponse$)
      : super(appHttpService, feedItemsResponse$);

  @override
  Future<void> getPosts() async {
    emptyItems();
    final response = await appHttpService.getPosts();
    final feedItemsResponse = FeedItemsResponse.fromList(response.data);
    feedItemsResponse$.add(feedItemsResponse);
  }
}
