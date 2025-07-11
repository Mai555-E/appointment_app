import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/saving_appointment.dart';
import '../../../domain/provider/my_provider.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_constants.dart';
import '../../widgets/leading_app_bar.dart';
import '../widgets/home_widgets/custom_calender_table.dart';

class BookingAppointmentScreen extends StatelessWidget {
  const BookingAppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MyProvider>();

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
                          SavingAppointment.saveAppointment(
                            context,
                              context.read<MyProvider>().selected!,
                              context.read<MyProvider>().focusDate!.toIso8601String(),
                              provider.doctorName!,
                              provider.doctorField!,
                              provider.price!);
                         
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
