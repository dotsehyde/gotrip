import 'package:flutter/material.dart';
import 'package:gotrip/core/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text("GoTrip",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: primaryColor, fontSize: 22.sp)),
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
  );
}
