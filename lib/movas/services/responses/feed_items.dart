class FeedItemsResponse {
  FeedItemsResponse({this.items});

  final List<FeedItem> items;
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
}
