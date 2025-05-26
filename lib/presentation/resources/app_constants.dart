import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppConstants {
  static const List<String> doctorsImages = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/1.png"
  ];

//payment

  static List<({IconData icon})> paymentIcons = [
    (icon: FontAwesomeIcons.ccVisa),
    (icon: FontAwesomeIcons.paypal),
    (icon: FontAwesomeIcons.ccAmex),
    (icon: FontAwesomeIcons.ccMastercard)
  ];

//

  static List<({String time})> timeSlots = [
    (time: '8:00 AM'),
    (time: '8:30 AM'),
    (time: '9:00 AM'),
    (time: '9:30 AM'),
    (time: '10:00 AM'),
    (time: '10:30 AM'),
    (time: '11:00 AM'),
    (time: '11:30 AM'),
    (time: '12:00 PM'),
    (time: '12:30 PM'),
    (time: '1:00 PM'),
    (time: '1:30 PM'),
    (time: '2:00 PM'),
    (time: '2:30 PM'),
    (time: '3:00 PM'),
    (time: '3:30 PM'),
    (time: '4:00 PM'),
    (time: '4:30 PM'),
    (time: '5:00 PM'),
    (time: '5:30 PM'),
    (time: '6:30 PM')
  ];

  //
  static const DoctorJobs doctorJobs = [
    (job: "Cardiologist", icon: Icons.heart_broken),
    (job: "Immunologist", icon: Icons.coronavirus),
    (job: "Pediatrician", icon: Icons.child_care),
    (job: "Dermatologist", icon: Icons.health_and_safety),
    (job: "Gynecologist", icon: Icons.female),
    (job: "Psychiatrist", icon: Icons.psychology)
  ];

  static const ServiceTypes servicesTypes = [
    (job: "", icon: Icons.heart_broken),
    (job: "", icon: Icons.health_and_safety),
    (job: "", icon: Icons.medical_services),
    (job: "", icon: Icons.local_hospital)
  ];

  static List<String> locations = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Port Said',
    'Suez',
    'Shubra El Kheima',
    'Luxor',
    'Aswan',
    'Asyut',
    'Qena',
    'Sohag',
    'Minya',
    'Beni Suef',
    'Fayoum',
    'Gharbia',
    'Daqahlia',
    'Kafr El Sheikh',
    'Behaira',
    'Ismailia',
    'Sharqia',
    'Matruh',
    'Red Sea',
    'North Sinai',
    'South Sinai'
  ].map((location) => "$location, Egypt").toList();

  static const CarouselSliderData carouselSliderData = [
    (images: "assets/images/1.png", title: "Stay at home", subTitle: "Take care of your mental healthy "),
    (images: "assets/images/2.png", title: "Take care", subTitle: "Take care of your mental healthy  "),
    (images: "assets/images/3.png", title: "Stay at home", subTitle: "Take care of your mental healthy  "),
    (images: "assets/images/4.png", title: "Stay at home", subTitle: "Take care of your mental healthy "),
    (images: "", title: "", subTitle: " ")
  ];

  static final NavigationData navigationData = [
    (icon: Icons.home_outlined, iconFilled: Icons.home_filled),
    (icon: Icons.notifications, iconFilled: Icons.notifications),
    (icon: Icons.favorite_outline_rounded, iconFilled: Icons.favorite_rounded),
    (icon: Icons.calendar_month, iconFilled: Icons.calendar_month_rounded),
    (icon: Icons.person_pin, iconFilled: Icons.person_pin)
  ];
}

typedef DoctorJobs = List<({String job, IconData icon})>;
typedef ServiceTypes = List<({String job, IconData icon})>;
typedef NavigationData = List<({IconData icon, IconData iconFilled})>;
typedef CarouselSliderData = List<({String title, String subTitle, String images})>;
