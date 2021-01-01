import 'package:movas_example/movas/services/responses/feed_items.dart';

import 'feed_item_observable.dart';

class FeedItemsO {
  FeedItemsO({this.items});

  final List<FeedItemO> items;

  factory FeedItemsO.fromResponse(FeedItemsResponse response) {
    return FeedItemsO(
        items: response.items
            ?.map((feedItem) => FeedItemO(
                  id: feedItem.id,
                  userId: feedItem.userId,
                  title: feedItem.title,
                  body: feedItem.body,
                ))
            ?.toList());
  }
}
