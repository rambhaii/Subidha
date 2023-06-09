import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:suvidha/Auth/Model/CityModel.dart';

import '../../AppConsTant/textStyle.dart';
import '../../Widget/EditTextWidget.dart';
import '../controller/login_controller.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);



  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  LoginController _controller=Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    //_controller.getStateNetworkApi();
    super.initState();
  }
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15,right: 0,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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

                SizedBox(height: 60,),
                Text(
                  'Create an Account',
                  style: titleStyle,

                ),
                Row(
                  children: [
                    Spacer(flex:2),
                    Expanded(
                        flex: 10,
                        child: Form(
                          key: _controller.formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 25,),
                              EditTextWidget(controller: _controller.etName, hint: 'Name',
                                  validator: (value)
                                {
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etEmail, hint: 'Email',
                                type: TextInputType.emailAddress,
                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Email";
                                  }
                                  if(!GetUtils.isEmail(value))
                                  {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15,),


                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etMobile, hint: 'Mobile',
                                isRead: true,
                                type: TextInputType.phone,

                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please enter mobile";
                                  }
                                  if(value.toString().length!=10)
                                  {
                                    return "Please enter 10 digit Number";
                                  }
                                  return null;
                                },
                                length: 10,
                              ),

                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etblock, hint: 'Block',
                                type: TextInputType.text,
                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please enter block";
                                  }
                                  return null;
                                },


                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etZip, hint: 'Zip',
                                type: TextInputType.number,
                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Zip";
                                  }
                                  if(value.toString().length!=6)
                                  {
                                    return "Please enter 6 digit pin";
                                  }
                                  return null;
                                },
                                length: 6,
                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etSate, hint: 'State',
                                type: TextInputType.text,
                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please enter State";
                                  }
                                  return null;
                                },


                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etCity, hint: 'City',
                                type: TextInputType.text,
                                validator: (value){
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please enter City";
                                  }
                                  return null;
                                },


                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etAddress1, hint: 'First Address',
                                validator: (value)
                                {
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Address";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15,),
                              EditTextWidget(controller: _controller.etAddress2, hint: 'Second Address',
                                validator: (value)
                                {
                                  if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Address";
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child:
                                     DropdownButton(
                                      underline: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                              width: 1.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      hint: Text(" Select City           ",style: subtitleStyle.copyWith(color: Colors.grey.withOpacity(0.7),)),
                                      onChanged: ( newValue)
                                      {

                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              SizedBox(height: 25,),
                              Container(
                                margin: EdgeInsets.only(right: 35),
                                alignment: Alignment.centerRight,
                                width: Get.width,
                                child: RawMaterialButton(onPressed: (){
                                  if(_controller.formKey.currentState!.validate())
                                  {
                                    _controller.signUpNetworkApi();
                                  }
                                },
                                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                                  fillColor: Colors.black,
                                  padding: EdgeInsets.all(8),
                                  shape: CircleBorder(),
                                  constraints: BoxConstraints(maxHeight: 54,maxWidth: 54),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),

                const SizedBox(height: 35,),



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
