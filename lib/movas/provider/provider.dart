import 'package:flutter/material.dart';
import 'package:movas/provider/provider.dart';
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

List<SingleChildWidget> streamProviders = [];

List<SingleChildWidget> serviceProviders = [];

List<SingleChildWidget> storeProviders = [];
