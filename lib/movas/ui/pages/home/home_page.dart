import 'package:flutter/material.dart';
import 'package:movas_example/movas/actions/feed_items_action.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/ui/widgets/custom_loading_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool useProdService = true;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeedItemsA.of(context).getPosts(useProdService: useProdService);
    });
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Page')),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        useProdService = !useProdService;
                      });
                    },
                    child: Text(useProdService
                        ? 'Use Mock Service'
                        : 'Use Prod Service')),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Consumer<FeedItemsO>(
                      builder: (context, feedItemsO, _) => feedItemsO?.items ==
                              null
                          ? CustomLoadingIndicator()
                          : ListView.builder(
                              itemBuilder: (context, index) => ListTile(
                                  title: Text(feedItemsO.items[index].title)),
                              itemCount: feedItemsO.items.length,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
