import 'package:flutter/material.dart';
import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/services/app_config/app_config_service.dart';
import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:movas_example/movas/stores/app_config_store.dart';
import 'package:movas_example/movas/stores/feed_items_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';

class MyStoreProvider<T extends BaseStore, U> extends MultiProvider {
  final Widget child;
  final T Function(BuildContext) storeBuilder;

  MyStoreProvider({
    this.child,
    @required this.storeBuilder,
  })  : assert(U != null),
        assert(T != null),
        super(
          child: child,
          providers: [
            Provider<T>(
                lazy: false,
                create: storeBuilder,
                dispose: (context, store) => store.dispose()),
            StreamProvider<U>(
                lazy: false,
                create: (context) =>
                    StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>)
          ],
        );
}

List<SingleChildWidget> providers = [
  ...streamProviders,
  ...serviceProviders,
  ...storeProviders,
];

List<SingleChildWidget> streamProviders = [
  Provider<PublishSubject<FeedItemsResponse>>(
    lazy: false,
    dispose: (_, stream) => stream.close(),
    create: (context) => PublishSubject(sync: true),
  ),
  Provider<PublishSubject<PostsService>>(
    lazy: false,
    dispose: (_, stream) => stream.close(),
    create: (context) => PublishSubject(sync: true),
  ),
];

List<SingleChildWidget> serviceProviders = [
  Provider<AppHttpService>(
    create: (context) => AppHttpService(context),
  ),
  Provider<AppConfigService>(
    create: (context) => AppConfigService(
      StaticProvider.of(context),
      StaticProvider.of(context),
      StaticProvider.of(context),
    ),
  ),
];

List<SingleChildWidget> storeProviders = [
  MyStoreProvider<FeedItemsStore, FeedItemsO>(
    storeBuilder: (context) => FeedItemsStore(
      StaticProvider.of(context),
    ),
  ),
  MyStoreProvider<AppConfigStore, AppConfigO>(
    storeBuilder: (context) => AppConfigStore(
      StaticProvider.of(context),
      StaticProvider.of(context),
    ),
  ),
];
