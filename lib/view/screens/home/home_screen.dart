import 'package:citraland/di_container.dart' as di;
import 'package:citraland/utill/app_constants.dart';
import 'package:citraland/utill/color_resources.dart';
import 'package:citraland/utill/routes.dart';
import 'package:citraland/utill/styles.dart';
import 'package:citraland/view/base/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences _sPref = di.sl();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {}

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
      ),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(4.h, 7.h, 4.h, 6.h),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryButton(
                  label: 'Scan QR Code',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.SCAN_SCREEN);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
