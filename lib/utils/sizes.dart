import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
double screenHeight(BuildContext context, {double scaleConstraint = 1}) {
  return screenSize(context).height * scaleConstraint;
}
double screenWidth(BuildContext context, {double scaleConstraint = 1}) {
  return screenSize(context).width * scaleConstraint;
}

BoxConstraints constraints({double? height, width}){
  return BoxConstraints(
      minHeight: height==null?0:height*800, ///800 is the safe height factor
      minWidth: width==null?0:width*1312
  );
}