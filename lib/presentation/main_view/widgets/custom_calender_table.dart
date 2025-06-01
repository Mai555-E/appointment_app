import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/model/my_provider.dart';

class CustomCalenderTable extends StatelessWidget {
  const CustomCalenderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 393,
      width: double.infinity,
      child: Consumer<MyProvider>(
        builder: (context, value, child) => TableCalendar(
          selectedDayPredicate: (day) => isSameDay(value.selectDate, day),
          onDaySelected: (selectedDay, focusedDay) {
            value.changeDateTime(selectedDate: selectedDay, focusedDate: focusedDay);
          },
          focusedDay: value.focusDate!,
          firstDay: DateTime.utc(2020, 1, 12),
          lastDay: DateTime.utc(2035, 5, 12),
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
        ),
      ),
    );
  }
}
