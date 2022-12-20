import 'package:flutter/material.dart';
import 'package:gotrip/core/app_data.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/core/go_trip_icons_icons.dart';
import 'package:gotrip/widgets/app_bar.dart';
import 'package:gotrip/widgets/trip_tile.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = List.generate(20, (index) => "Name $index");
  String _selType = "Bus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: SizedBox(
          child: Scrollbar(
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning, Shreya....",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "Make plan for weekend",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ).paddingBottom(1.5.h),
                    ],
                  ),
                ),
              ),
              //Search box
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leadingWidth: 0,
                elevation: 0,
                toolbarHeight: 6.5.h,
                snap: true,
                floating: true,
                primary: false,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 10.w,
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search Trips...",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.w,
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 17.sp,
                                    color: xGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                          prefixIcon: Icon(
                            GoTripIcons.search,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        GoTripIcons.settings,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    )
                  ],
                ).paddingBottom(0.h),
              ),
              //Trip type
              SliverAppBar(
                primary: false,
                toolbarHeight: 18.h,
                automaticallyImplyLeading: false,
                pinned: true,
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...carTypes.map((e) => GestureDetector(
                              onTap: () => setState(() {
                                _selType = e;
                              }),
                              child: Column(
                                children: [
                                  Container(
                                      width: 10.h,
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selType == e
                                              ? primaryColor
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: e == "Bus"
                                          ? Image.asset(
                                              "img/bus.png",
                                            )
                                          : Image.asset(
                                              "img/car.png",
                                            )),
                                  Text(
                                    e,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    Text(
                      "Available Trips",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 19.sp,
                            color: Colors.black,
                          ),
                    )
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 3.w,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return TripTile(tripData);
                }, childCount: 20),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 1.5.h,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
