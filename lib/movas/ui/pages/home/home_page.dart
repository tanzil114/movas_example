import 'package:flutter/material.dart';
import 'package:movas_example/movas/actions/feed_items_action.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/ui/widgets/custom_loading_indicator.dart';
import 'package:movas_example/movas/ui/widgets/post_tile.dart';
import 'package:movas_example/movas/ui/widgets/service_switch.dart';
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
        title: Center(child: Text('Posts')),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ServiceSwitch(
                    useProdService: useProdService,
                    onChanged: (newVal) {
                      setState(() {
                        useProdService = newVal;
                      });
                    }),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<FeedItemsO>(
                        builder: (context, feedItemsO, _) => feedItemsO
                                    ?.items ==
                                null
                            ? CustomLoadingIndicator()
                            : ListView.separated(
                                itemBuilder: (context, index) =>
                                    PostTile(item: feedItemsO?.items[index]),
                                separatorBuilder: (context, index) => Divider(),
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
      ),
    );
  }
}
