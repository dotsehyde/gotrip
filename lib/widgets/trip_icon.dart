import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/core/go_trip_icons_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TripIcon extends ConsumerWidget {
  final bool isBus;
  const TripIcon({super.key, required this.isBus});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Row(children: [
          Image.asset("img/dot.png"),
          Image.asset("img/line.png"),
          Image.asset("img/ar.png")
        ]),
        Positioned(
          left: 18.w,
          child: Container(
            color: primaryColor,
            child: Icon(
              isBus ? GoTripIcons.bus : GoTripIcons.car,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
