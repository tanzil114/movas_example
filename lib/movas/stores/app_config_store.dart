import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';
import 'package:movas_example/movas/services/posts/mock_posts_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class AppConfigStore extends Store<AppConfigO> {
  final PublishSubject<FeedItemsResponse> feedItemsResponse$;
  final PublishSubject<PostsService> appConfigService$;

  AppConfigStore(this.feedItemsResponse$, this.appConfigService$) {
    add(AppConfigO(
      MockPostsService(feedItemsResponse$),
    ));
    listen(appConfigService$,
        (appConfigService) => add(AppConfigO(appConfigService)));
  }
}
