import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../AppConsTant/textStyle.dart';
import 'SplashPage1.dart';
class Splash extends StatefulWidget
{
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin
{
  void initState()
  {
    Future.delayed(Duration(seconds: 5)).then((value) =>
          Get.to(()=>SplashPage1(),transition: Transition.fadeIn,duration: Duration(milliseconds: 1000))
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        backgroundColor: const Color(0xffffffff),
        body: Stack(
                children: <Widget>
                [
                 Positioned(child:  Lottie.asset('assets/json/team.json',
                    frameRate: FrameRate.max
                  ),height: 400,width: Get.width,),
                 Positioned(
                         bottom: -120,
                         child:  RotationTransition(
                           turns: AlwaysStoppedAnimation(-40 / 360),
                           child: Lottie.asset('assets/json/blackline.json',
                              frameRate: FrameRate.max
                             ,fit:BoxFit.fill),)
                           ,height: 700,
                          width: Get.width,),

            Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
                Text(
                'Become A Member of \n    India\'s Largest',
            style: heading3,
                ),
      SizedBox(height: 20,),
        Text(
       '    Rural Development       Entrepreneur of\n           Society',
        style: heading3,
        ),
    ],
    ),
    ),

    ],
    ),

    );
  }
}
