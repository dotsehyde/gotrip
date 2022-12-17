import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gotrip/core/app_data.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/core/go_trip_icons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _selType = "Car";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("GoTrip",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: primaryColor, fontSize: 22.sp)),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text("Home"),
            ),
          ],
        ),
      ),
      body: SafeArea(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80.w,
                    height: 12.w,
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
                    height: 12.w,
                    width: 12.w,
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
              ).paddingBottom(2.h),
              Row(
                children: [
                  Text(
                    "Available Trips",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 19.sp,
                          color: Colors.black,
                        ),
                  ).paddingBottom(1.5.h),
                ],
              ),
              //Trip type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...types.map((e) => GestureDetector(
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
                                        // fit: BoxFit.contain,
                                        // width: 5.h,
                                        // height: 5.h,
                                      )
                                    : Image.asset(
                                        "img/car.png",
                                        // fit: BoxFit.fitHeight,
                                        // width: 2.h,
                                        // height: 2.h,
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
              )
              //Render Trips
            ],
          ),
        ),
      ),
    );
  }
}
