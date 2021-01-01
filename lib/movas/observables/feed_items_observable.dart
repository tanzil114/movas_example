import 'package:movas_example/movas/services/responses/feed_items.dart';

class FeedItemsO {
  FeedItemsO({this.items});

  final List<FeedItemO> items;

  factory FeedItemsO.fromResponse(FeedItemsResponse response) {
    return FeedItemsO(
        items: response.items
            .map((feedItem) => FeedItemO(
                  id: feedItem.id,
                  userId: feedItem.userId,
                  title: feedItem.title,
                  body: feedItem.body,
                ))
            .toList());
  }
}

class FeedItemO {
  FeedItemO({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;
}
