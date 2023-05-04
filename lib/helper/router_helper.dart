import 'package:citraland/utill/routes.dart';
import 'package:citraland/view/screens/home/home_screen.dart';
import 'package:citraland/view/screens/scan/scan_screen.dart';
import 'package:fluro/fluro.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  static Handler _homeHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => HomeScreen(),
  );
  static Handler _scanHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => ScanScreen(),
  );

  static void setupRouter() {
    router.define(Routes.HOME_SCREEN,
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.SCAN_SCREEN,
        handler: _scanHandler, transitionType: TransitionType.inFromBottom);

    // router.define(Routes.REGISTER_SCREEN,
    //     handler: _registerHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routes.LOGIN_SCREEN,
    //     handler: _loginHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routes.DASHBOARD_SCREEN,
    //     handler: _dashScreenBoardHandler,
    //     transitionType: TransitionType.fadeIn); // ?page=home
    // router.define(Routes.DASHBOARD,
    //     handler: _deshboardHandler, transitionType: TransitionType.fadeIn);
    // router.define(Routes.OPTION_SCREEN,
    //     handler: _optionHandler, transitionType: TransitionType.fadeIn);
    // router.define(Routes.BODY_SCREEN,
    //     handler: _bodyHandler, transitionType: TransitionType.fadeIn);
    // router.define(Routes.ENVIRONMENT_SCREEN,
    //     handler: _environmentHandler, transitionType: TransitionType.fadeIn);
    // router.define(Routes.MIND_SCREEN,
    //     handler: _mindHandler, transitionType: TransitionType.fadeIn);
    // router.define(Routes.RESULT_SCREEN,
    //     handler: _resultHandler, transitionType: TransitionType.fadeIn);
  }
}
