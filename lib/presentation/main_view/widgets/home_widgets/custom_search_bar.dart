import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/doctor_model.dart';
import '../../../../domain/provider/my_provider.dart';
import '../../body/details_screen.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final SearchController controller;
  @override
  void initState() => {controller = SearchController(), super.initState()};
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctors = context.read<MyProvider>().doctors;
    return SearchAnchor.bar(
        barBackgroundColor: WidgetStatePropertyAll(Colors.white),
        barShape: WidgetStatePropertyAll(StadiumBorder(side: BorderSide(style: BorderStyle.none))),
        barHintText: 'Search',
        suggestionsBuilder: (context, controller) {
          final query = controller.value.text.toLowerCase();
          final suggestion = doctors.where((doc) => doc.name.toLowerCase().contains(query));
          return suggestion.map((doc) {
            return ListTile(
              title: Text(doc.name),
              leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(doc.image)),
              subtitle: Text(doc.specialization),
              onTap: () {
                Get.to(() => DetailsScreen(doctors: doc));
                controller.closeView(doc.name);
              },
            );
          }).toList();
        });
  }
}
