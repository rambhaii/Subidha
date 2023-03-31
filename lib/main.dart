
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:suvidha/Splash/Splash.dart';

import 'AppConsTant/AppConstant.dart';

 Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayOpacity: 0.1,
      overlayWidget: Center(
        child: Container(
            height: 41,
            width: 41,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 3.5,
            )),
      ),
      child: GetMaterialApp
        (
        title: 'Society',
        theme: ThemeData
          (
          primarySwatch: Colors.blue,
        ),
        home: GetStorage().read(AppConstant.userName)!=null? GetStorage().read(AppConstant.userName).toString().isNotEmpty? const Splash(): const Splash():const Splash(),
      ),
    );
  }

}