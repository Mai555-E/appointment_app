import 'package:flutter/material.dart';
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
  void initState() => {super.initState(), controller = SearchController()};
  @override
  void dispose() => {controller.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctors = context.read<MyProvider>().doctors;
    return SearchAnchor.bar(
        searchController: controller,
        barBackgroundColor: WidgetStatePropertyAll(Colors.white),
        barShape: WidgetStatePropertyAll(StadiumBorder(side: BorderSide(style: BorderStyle.none))),
        barHintText: 'Search',
        suggestionsBuilder: (context, searchController) {
          final query = searchController.value.text.toLowerCase();
          final suggestion = doctors.where((doc) => doc.name.toLowerCase().contains(query));
          return suggestion.map((doc) {
            return ListTile(
              title: Text(doc.name),
              leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(doc.image)),
              subtitle: Text(doc.specialization),
              onTap: () {
                searchController.closeView(doc.name);
                searchController.clear();
                Navigator.push(context, MaterialPageRoute(builder:(_)=> DetailsScreen(doctors: doc)));
              },
            );
          }).toList();
        });
  }
}
