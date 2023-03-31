import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:suvidha/Utils/APIConstant.dart';
import '../../Utils/Base_controller.dart';
import '../../Utils/base_client.dart';
import '../Model/UserData.dart';
import '../view/OtypVerifyPage.dart';
import '../view/Registration.dart';
import '../Model/CityModel.dart';
import '../Model/StateModel.dart';
class LoginController extends GetxController
{   var stateData=StateModel().obs;
    var cityModel=CityModel().obs;
    var selectedState;
    var selectedCity;
     RxString rxPath="".obs;


  TextEditingController etMobile=TextEditingController();
  TextEditingController etName=TextEditingController();
  TextEditingController etMobileNo=TextEditingController();
  TextEditingController etEmail=TextEditingController();
  TextEditingController etZip=TextEditingController();
  TextEditingController etblock=TextEditingController();
  TextEditingController etAddress1=TextEditingController();
  TextEditingController etAddress2=TextEditingController();


  TextEditingController etSate=TextEditingController();
  TextEditingController etCity=TextEditingController();

  final formKey=GlobalKey<FormState>();
  GetStorage _storage=GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  loginNetworkApi()async
  {

    var bodyRequest ='+91 '+etMobile.text;
     print(bodyRequest);
     //Get.context!.loaderOverlay.show();
     await FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: bodyRequest,
       timeout: Duration(seconds: 50),
        verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken)
    {

      Get.to(()=>OtypVerifyPage(id: verificationId ,otp:"" ,));
      print(verificationId);
      return;
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
      );

  }
  Timer? _timer;
  RxInt start = 60.obs;

  void startTimer() {
    const oneSec =  Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }





  verifyNetworkApi(String verificationId,String otp)async
  {
     print("hellooo     "+verificationId+""+otp);
     try
     {
       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
       await auth.signInWithCredential(credential);



       Get.to(() => Registration());

     }catch(e)
    {
      print(e);
    }


  /*  Get.context!.loaderOverlay.show();
    var response=await BaseClient().post(verfyApi, bodyRequest).catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    print("jnvkjnkdsv");
    print(response);
    if(jsonDecode(response)["status"]==1) {
      if (jsonDecode(response)["Data"].isNotEmpty)
      {
        if(jsonDecode(response)["Data"]["ID"].toString().isNotEmpty && jsonDecode(response)["Data"]["user_email"].toString().isNotEmpty)
        {
          _storage.write(AppConstant.id, jsonDecode(response)["Data"]["ID"]??"");
          _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
          _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["display_name"]??"");
          _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
          _storage.write(AppConstant.email, jsonDecode(response)["Data"]["user_email"]??"");
          _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile_no"]??"");
          _storage.write(AppConstant.block, jsonDecode(response)["Data"]["block"]??"");
          _storage.write(AppConstant.zip, jsonDecode(response)["Data"]["zip_code"]??"");
          Get.offAll(() => HomeDashboard());
        }
        else{
          _storage.write(AppConstant.id, jsonDecode(response)["Data"]["ID"]??"");
          Get.to(() => Registration());
        }
        BaseController().successSnack(jsonDecode(response)["message"]);

      }
    }
    else{
      BaseController().errorSnack(jsonDecode(response)["message"]);
    }*/

  }
  signUpNetworkApi()
  async {
    final user = <String, String>{
      "username":etName.text,
      "state": etSate.text,
      "country": "India",
      "contact":"",
      "city":etCity.text,
      "address1":etAddress1.text,
      "address2": etAddress2.text,
      "user_id":"",
      "date":Timestamp.now().toString(),
      "latitude": "",
      "longitude": "",
    };
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference dbcoures=_firestore.collection('Users');


  //  print("fdjkghdkfgrytiy"+_auth.currentUser!.uid);
    // dbcoures.doc(_auth.currentUser!.uid).set(user) .onError((e, _) => print("Errorwritingdocument: $e"));

        dbcoures.add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));




  }

getCityNetworkApi(String id)async
{
  print("mnfmcbvn"+id);
  Get.context!.loaderOverlay.show();
  var response=await BaseClient().get(getCityApi+"?lng=eng&state_id=${id}").catchError(BaseController().handleError);
  Get.context!.loaderOverlay.hide();
  if(jsonDecode(response)["status"]==1)
  {
    print("vdsbvkjdsbvkjs");
    print(response);
    cityModel.value=cityModelFromJson(response);
    return;
  }
  BaseController().errorSnack(jsonDecode(response)["message"]);
}
getStateNetworkApi()async{
  Get.context!.loaderOverlay.show();
  var response=await BaseClient().get(getStateApi+"?lng=eng").catchError(BaseController().handleError);
  Get.context!.loaderOverlay.hide();
  if(jsonDecode(response)["status"]==1)
  {
    print("vdsbvkjdsbvkjs");
    print(response);
    stateData.value=stateModelFromJson(response);
    return;
  }
  BaseController().errorSnack(jsonDecode(response)["message"]);
}




}