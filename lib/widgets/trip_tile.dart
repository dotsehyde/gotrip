import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/models/trip_model.dart';
import 'package:gotrip/pages/trip_detail.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TripTile extends ConsumerWidget {
  final TripModel trip;
  const TripTile(this.trip, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TripDetailPage(trip)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 0.8),
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: GridTile(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 1.6.h,
                    backgroundImage: const AssetImage("img/pp.png"),
                  ).paddingSymmetric(horizontal: 1.5.w),
                  Text(
                    trip.driver.firstName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ).paddingSymmetric(vertical: 1.h),
              Text(
                trip.from,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                  padding: EdgeInsets.all(0.2.w),
                  decoration: BoxDecoration(
                      color: primaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    size: 22.sp,
                    color: Colors.white,
                  )),
              Text(trip.to,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w600)),
              Divider(
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("GHS ${}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                  Text("GHS ${trip.fare.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ).paddingBottom(1.h),
            ],
          ),
        ),
      ),
    );
  }
}
