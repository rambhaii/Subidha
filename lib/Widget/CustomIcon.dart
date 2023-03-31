import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Color(0x00A8FF).withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 0.6, color: Color(0xff00A8FF)),
      ),
      child:Image.asset("assets/images/csc.png",height: 18,width: 35,
    fit: BoxFit.fill,)



    );
  }
}
