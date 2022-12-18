import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTripPage extends ConsumerStatefulWidget {
  const AddTripPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTripPageState();
}

class _AddTripPageState extends ConsumerState<AddTripPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Add Trip Page"),
      ),
    );
  }
}
