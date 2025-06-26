import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/doctor_model.dart';
import '../../../domain/provider/my_provider.dart';
import '../../resources/app_colors.dart';
import '../../resources/routes.dart';
import '../widgets/body_widgets/custom_position_widgets.dart';
import '../widgets/body_widgets/details_card.dart';

class DetailsScreen extends StatelessWidget {
  final DoctorModel doctors;
  const DetailsScreen({super.key, required this.doctors});
  @override
  Widget build(BuildContext context) {
    var docList = context.read<MyProvider>();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [Icon(Icons.favorite, size: 26, color: AppColors.primary)]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 60, backgroundImage: AssetImage(doctors.image)),
              CustomPositionWidgets(doctors: doctors),
              SizedBox(
                  height: 130,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => DetailsCard(),
                      separatorBuilder: (_, __) => SizedBox(width: 30),
                      itemCount: 3)),
              SizedBox(height: MediaQuery.sizeOf(context).height / 3.5, child: _buildInfoWidget(context)),
              ElevatedButton(
                  onPressed: () => {
                        docList.getDoctorName(doctors.name),
                        docList.getDoctorField(doctors.specialization),
                        docList.getDoctorDeposit(doctors.price),
                       Navigator.pushNamed(context, NamedRoutes.bookingAppointment)
                      },
                  child: Text("Booking Appointment"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoWidget(BuildContext context) {
    return Column(spacing: 5, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("About", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text(doctors.bio),
      Spacer(),
      Text("Availability", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text(doctors.working_days),
      Spacer(),
      Text("Consultation fee", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
      Text('${doctors.price} EGP')
    ]);
  }
}
