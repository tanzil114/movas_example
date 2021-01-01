import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

abstract class PostsService {
  PostsService(this.appHttpService, this.feedItemsResponse$);

  final AppHttpService appHttpService;
  final PublishSubject<FeedItemsResponse> feedItemsResponse$;

  Future<void> getPosts();

  void emptyItems() {
    feedItemsResponse$.add(FeedItemsResponse.empty());
  }
}
