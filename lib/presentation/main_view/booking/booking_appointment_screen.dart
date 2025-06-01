import '../../../domain/model/my_provider.dart';
import '../../../domain/model/saving_appointment.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_calender_table.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_constants.dart';
import '../../widgets/leading_app_bar.dart';
import 'package:flutter/material.dart';

class BookingAppointmentScreen extends StatelessWidget {
  const BookingAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String name = context.watch<MyProvider>().doctorName!;
    String field = context.watch<MyProvider>().doctorField!;
    int price = context.watch<MyProvider>().price!;

    return Scaffold(
      appBar: LeadingAppBar(title: "Booking Screen"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                CustomCalenderTable(),
                _buildChoiceChip(),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          SavingAppointment.saveAppointment(context.read<MyProvider>().selected!,
                              context.read<MyProvider>().focusDate!.toIso8601String(), name, field, price);
                        },
                        child: Text("set appointment"))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //

  Widget _buildChoiceChip() {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Wrap(
          spacing: 15,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: List.generate(
              AppConstants.timeSlots.length,
              (i) => ChoiceChip(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  selectedColor: AppColors.primary,
                  elevation: 2,
                  onSelected: (val) {
                    value.choiceTime(AppConstants.timeSlots[i].time);
                  },
                  label: Text(AppConstants.timeSlots[i].time,
                      style: TextStyle(
                          fontSize: value.selected == AppConstants.timeSlots[i].time ? 18 : 15,
                          color: value.selected == AppConstants.timeSlots[i].time ? Colors.white : Colors.black)),
                  selected: value.selected == AppConstants.timeSlots[i].time))),
    );
  }
}
