import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/core/go_trip_icons_icons.dart';
import 'package:gotrip/models/trip_model.dart';
import 'package:gotrip/widgets/trip_icon.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TripDetailPage extends ConsumerStatefulWidget {
  final TripModel trip;
  const TripDetailPage(this.trip, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripDetailPageState();
}

class _TripDetailPageState extends ConsumerState<TripDetailPage> {
  var timeleft = "";
  @override
  void initState() {
    int hours = widget.trip.departure.difference(DateTime.now()).inHours;
    int days = hours ~/ 24;
    if (hours < 24) {
      timeleft = "$hours hours left";
    } else {
      days += 1;
      timeleft = "$days days left";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset("img/top_bg.png", fit: BoxFit.fitWidth),
                  //Header
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                size: 28.sp,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                GoTripIcons.edit,
                                size: 22.sp,
                                color: Colors.white,
                              )).paddingRight(3.w),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                                  DateFormat("dd MMMM yyyy")
                                      .format(widget.trip.departure),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 17.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800))
                              .paddingBottom(1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 25.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        widget.trip.from
                                            .substring(0, 3)
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 18.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800)),
                                    Text(widget.trip.from,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              TripIcon(isBus: widget.trip.carType == "Bus"),
                              SizedBox(
                                width: 25.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        widget.trip.to
                                            .substring(0, 3)
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 18.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800)),
                                    Text(widget.trip.to,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.chair_rounded,
                                      color: Colors.white)
                                  .paddingRight(1.w),
                              Text(
                                "${widget.trip.seatAvailable} seats left",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 17.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            //Trip Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                  border: Border.all(color: xGrey),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Driver Details",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w800),
                  ),
                ).paddingLeft(2.w),
                Row(
                  children: [
                    Icon(Icons.person, color: primaryColor).paddingRight(2.w),
                    Text(
                        widget.trip.driver.firstName +
                            " " +
                            widget.trip.driver.lastName,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 16.sp)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone, color: primaryColor).paddingRight(2.w),
                    Text(widget.trip.driver.phone,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 16.sp)),
                  ],
                ).paddingSymmetric(vertical: 1.5.h),
               TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.phone,color: Colors.white,),
              label: Text(
                "Call Driver",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(double.infinity, 6.h)),
            ),
              ]),
            ),
            Spacer(),
            //Driver Info
            TextButton(
              onPressed: () {},
              child: Text(
                "Book Trip Now",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(double.infinity, 6.h)),
            ).paddingSymmetric(horizontal: 3.w, vertical: 1.5.h)
          ],
        ),
      ),
    );
  }
}
