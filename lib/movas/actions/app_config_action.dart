import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';
import 'package:movas_example/movas/services/app_config/app_config_service.dart';
import 'package:movas_example/movas/services/posts/prod_posts_service.dart';

class AppConfigA {
  AppConfigA(this.appConfigO, this.appConfigService);

  final AppConfigO appConfigO;
  final AppConfigService appConfigService;

  void switchService() {
    if (appConfigO.postsService.runtimeType == ProdPostsService) {
      appConfigService.addMockPostsService();
      return;
    }
    appConfigService.addProdPostsService();
  }

  factory AppConfigA.of(context) => AppConfigA(
        StaticProvider.of(context),
        StaticProvider.of(context),
      );
}
