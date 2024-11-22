import 'package:flutter/material.dart';

class OrderSegmentedButton extends StatelessWidget {
  const OrderSegmentedButton({
    super.key,
    required this.currentSegment,
    required this.onSelectioChanged,
  });

  final Set<int> currentSegment;
  final void Function(Set<int>) onSelectioChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      segments: const [
        ButtonSegment(
            value: 0, label: Text('Delivery'), icon: Icon(Icons.pedal_bike)),
        ButtonSegment(
            value: 1, label: Text('Pickup'), icon: Icon(Icons.local_mall)),
      ],
      selected: currentSegment,
      onSelectionChanged: (newSelection) => onSelectioChanged,
    );
  }
}
