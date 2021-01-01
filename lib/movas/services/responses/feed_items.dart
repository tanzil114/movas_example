class FeedItemsResponse {
  FeedItemsResponse({this.items});

  final List<FeedItem> items;

  factory FeedItemsResponse.fromList(data) => FeedItemsResponse(
      items: (data as List).map((item) => FeedItem.fromMap(item)).toList());
}

class FeedItem {
  FeedItem({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  factory FeedItem.fromMap(map) => FeedItem(
        id: map["id"],
        userId: map["userId"],
        title: map["title"],
        body: map["body"],
      );
}
