import 'package:flutter/material.dart';

import '../constants/const.dart';
class CustomContainer extends StatelessWidget {
  final String txt;
  final Color bg;
  final String icnName;
  final TextAlign? txtAlgn;
  const CustomContainer({super.key, required this.txt, required this.bg, required this.icnName, this.txtAlgn});

  @override
  Widget build(BuildContext context) {
    return  Container(

      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bg,

      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
           Image.asset("assets/icons/$icnName.png",width: 32,),
          SizedBox(width: 10,),
          Expanded(child:Text(txt,style: CustomTextStyles.text16Black600,textAlign: txtAlgn??TextAlign.center,))

        ]) ,
    );
  }
}
