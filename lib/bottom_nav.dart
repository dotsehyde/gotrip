import 'package:flutter/material.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/core/go_trip_icons_icons.dart';
import 'package:gotrip/pages/home.dart';
import 'package:gotrip/pages/trip_history.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;
 final List<Widget> _pages = [HomePage(), TripHistoryPage(), HomePage()];
  final List<IconData> _items = [
    GoTripIcons.home,
    Icons.qr_code_scanner_rounded,
    Icons.add_box_rounded,
    GoTripIcons.briefcase,
    GoTripIcons.user
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        color: Colors.white,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items
                .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _index = _items.indexOf(e);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _items.indexOf(e) == _index
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          e,
                          color: _items.indexOf(e) == _index
                              ? Colors.white
                              : Color(0xFF6D6D6D),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
