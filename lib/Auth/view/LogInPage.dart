import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../AppConsTant/textStyle.dart';
import '../../Widget/CircularButton.dart';
import '../controller/login_controller.dart';

class LogInPage extends StatelessWidget
 {
LogInPage ({Key? key}) : super(key: key);
LoginController _controller=Get.put(LoginController());
final _keyForm=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: SafeArea(
          child: SingleChildScrollView(
           child: Container
             (
                      margin: EdgeInsets.only(left: 15,right: 15,top: 20),
                      child: Column
                        (
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>
                       [
                       Row(crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                            Container(
                           margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                           height: 70,
                            width: 70,
                           child: Lottie.asset('assets/json/vle.json',fit:BoxFit.fill),),
                             const Text.rich(
                              TextSpan(
                             style: TextStyle(
                             fontFamily: 'Josefin Sans',
                             fontSize: 28,
                             color: const Color(0xff051ba6),
                             letterSpacing: 1.25,
                             height: 0.04,
                              ),
                             children: [
                             TextSpan(
                            text: 'Rural ',
                            style: TextStyle(
                            fontWeight: FontWeight.w700,
                              ),
                              ),
                               TextSpan(
                                 text: 'Society',
                               ),
                             ],
                              ),
                               textHeightBehavior:
                               TextHeightBehavior(applyHeightToFirstAscent: false),
                               softWrap: false,
                             ),
                           ],
                       ),

                      Container(
                       margin: EdgeInsets.only(top:20),
                     width:Get.width,
                    child: Text("BROWSE AS GUEST ",style: titleStyle.copyWith(fontSize: 16,decoration: TextDecoration.underline),textAlign: TextAlign.end,)),
                         SizedBox(height: 60,),
                         Text(
                           'Create an Account',
                           style: titleStyle,
                         ),
                        Container(
                   margin: EdgeInsets.only(top:40),
                   width:Get.width,
                   child: Text("Enter your mobile number\nwith country code",style: smallTextStyle,textAlign: TextAlign.center,)),
                         const  SizedBox(height: 50,),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment:MainAxisAlignment.start,
                           children: [
                             Spacer(flex: 1,),
                             Expanded(flex:1,child: TextFormField(
                                 readOnly: true,
                                 initialValue: "+91",
                                 decoration:const InputDecoration(

                                   enabledBorder: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black),
                                   ),
                                   focusedBorder: UnderlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black),
                                   ),

                                   isDense: true,
                                   ),
                                 style: titleStyle)),
                             SizedBox(width: 8,),
                             Expanded(flex:5,
                                 child: Form(
                                   key: _keyForm,
                               child: TextFormField(
                                   keyboardType: TextInputType.number,
                                   controller: _controller.etMobile,
                                   decoration: const InputDecoration(
                                     enabledBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.black),
                                     ),
                                     focusedBorder: UnderlineInputBorder(
                                       borderSide: BorderSide(color: Colors.black),
                                     ),
                                     counter: Offstage(),

                                     hintText: "0000000000",
                                     isDense: true,
                                     contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                    ),


                                   validator: (value)
                                   {
                                     if(value.toString().isEmpty)
                                     {
                                       return "Please enter mobile No.";
                                     }
                                     if(value!.length!=10)
                                     {
                                       return "Please enter 10 digits mobile number";
                                     }
                                   },
                                   maxLength: 10,

                                   style: titleStyle),
                             )),
                           ],
                         ),
                         const SizedBox(height: 36,),

                         Row(
                           children: [
                             SizedBox(width: 20,),
                             Expanded(flex: 6,
                                 child: CircularButton(onPress: ()
                                 async {
                                   if(_keyForm.currentState!.validate())
                                      {
                                   _controller.loginNetworkApi();
                                      }



                                 },)),
                           ],
                         ),

                         const SizedBox(height: 40,),
                         SizedBox(
                           width: Get.width,
                           child: Text(
                             'Sign In With',
                             style: titleStyle.copyWith(fontSize: 18),textAlign: TextAlign.center,
                           ),
                         ),

                         const SizedBox(height: 30,),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Column(
                               children: [
                                 Container(

                                   child: Image.asset("assets/images/google_icon.png", height: 40,
                                     width: 40,),
                                 ),
                                 SizedBox(height: 25,),
                                 Text("Google",style: titleStyle.copyWith(fontSize: 15),)
                               ],
                             ) ,
                             SizedBox(width: 30,),
                             Column(
                               children: [
                                 Container(
                                   height: 40,
                                   width: 40,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5),
                                       image: DecorationImage(image: AssetImage("assets/images/facebook.png"))
                                   ),


                                 ),
                                 SizedBox(height: 25,),
                                 Text("Facebook",style: titleStyle.copyWith(fontSize: 15))
                               ],
                             ) ,
                           ],
                         ),

                         const SizedBox(height: 40,),



                         Text.rich(
                           TextSpan(
                             style: smallTextStyle,
                             children: [
                               TextSpan(
                                 text:
                                 'By signing in or creating an account, you agree with our \n',
                                 style: TextStyle(
                                     fontWeight: FontWeight.w300,
                                     fontSize: 12,
                                     height: 2,
                                     letterSpacing: 0.2
                                 ),
                               ),
                               TextSpan(
                                 text: 'Term and conditions',
                                 style: TextStyle(
                                   color: const Color(0xff006eff),
                                   fontWeight: FontWeight.w300,
                                   decoration: TextDecoration.underline,
                                 ),
                               ),
                               TextSpan(
                                 text: ' and ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                               TextSpan(
                                 text: 'Privacy Policy',
                                 style: TextStyle(
                                   color: const Color(0xff006eff),
                                   fontWeight: FontWeight.w300,
                                   decoration: TextDecoration.underline,
                                 ),
                               ),
                               TextSpan(
                                 text: ' ',
                                 style: TextStyle(
                                   color: const Color(0xff006eff),
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ],
                           ),
                           textHeightBehavior:
                           TextHeightBehavior(applyHeightToFirstAscent: false),
                           textAlign: TextAlign.center,
                           softWrap: false,
                         ),

                       ],
                      ),
           ),
          ),
          ),
    );
  }
}

