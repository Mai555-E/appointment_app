import 'package:doctor_appointment_app/presentation/resources/app_constants.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
        barBackgroundColor: WidgetStatePropertyAll(Colors.white),
        barShape: WidgetStatePropertyAll(StadiumBorder(side: BorderSide(style: BorderStyle.none))),
        barHintText: 'Search',
        suggestionsBuilder: (context, controller) {
          final query = controller.value.text;
          final suggestion = List.generate(AppConstants.doctorNamedSuggestion.length, (i) => AppConstants.doctorNamedSuggestion[i])
              .where((item) => item.contains(query.toLowerCase()))
              .map((item) => GestureDetector(onTap: () => controller.closeView(item), child: ListTile(leading: Text(item), )));
          return suggestion;
        });
  }
}
