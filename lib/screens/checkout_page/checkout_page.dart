import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../models/cart_item.dart';
import '../providers/cart/cart_provider.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/order_segmented_button.dart';
import 'widgets/order_summary.dart';
import 'widgets/submit_button.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text('Delivery'),
    1: Text('Self Pick-Up')
  };

  Set<int> selectedSegment = {0};
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);
  final TextEditingController _nameController = TextEditingController();

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return 'Select Date';
    }
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  String formatTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) {
      return 'Select Time';
    }
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void selectSegment(Set<int> segmentIndex) => setState(() {
        selectedSegment = segmentIndex;
      });

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void removeItem(CartItem item) {
    return setState(() {
      ref.read(cartProvider.notifier).removeItem(item.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order Details', style: textTheme.headlineSmall),
            const SizedBox(height: 16.0),
            OrderSegmentedButton(
                currentSegment: selectedSegment,
                onSelectioChanged: selectSegment),
            const SizedBox(height: 16.0),
            CustomTextField(_nameController),
            const SizedBox(height: 16.0),
            Row(
              children: [
                TextButton(
                  child: Text(formatDate(selectedDate)),
                  onPressed: () => _selectDate(context),
                ),
                TextButton(
                  child: Text(formatTimeOfDay(selectedTime)),
                  onPressed: () => _selectTime(context),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Order Summary'),
            OrderSummary(onDismissed: removeItem),
            SubmitButton(
              ref: ref,
              selectedSegment: selectedSegment,
              selectedTime: selectedTime,
              selectedDate: selectedDate,
              nameController: _nameController,
            ),
          ],
        ),
      ),
    );
  }
}
