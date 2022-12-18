import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripHistoryPage extends ConsumerStatefulWidget {
  const TripHistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripHistoryPageState();
}

class _TripHistoryPageState extends ConsumerState<TripHistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Trip History"),
    );
  }
}