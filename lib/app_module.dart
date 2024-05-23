import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        // CoreModule(),
        // UserModule(),
      ];

  @override
  void routes(RouteManager r) {
    super.routes(r);
    // r.module(Modular.initialRoute, module: SplashModule());
    // r.module('/auth', module: AuthModule());
    // r.module('/router', module: RouterModule());
  }
}
