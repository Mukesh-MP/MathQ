import 'package:flutter/material.dart';

class ErrorWidgetMathQ extends StatelessWidget {
   ErrorWidgetMathQ({super.key,this.errorMsg = ''});


String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMsg),);
  }
}