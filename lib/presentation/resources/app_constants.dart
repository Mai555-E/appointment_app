import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_assets.dart';

class AppConstants {
  static const List<String> doctorsImages = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/1.png"
  ];
//
  static const List<({String image, String title})> onboardingImages = [
    (image: AppAssets.onboardingDoc1, title: "Best Doctor Appointment Mobile App"),
    (image: AppAssets.onboardingDoc2, title: " Get E, Prescription from a Doctor"),
    (image: AppAssets.onboardingDoc3, title: "Best Medicine Reminder")
  ];
//payment

  static const PaymentIcons paymentIcons = [
    (icon: FontAwesomeIcons.ccVisa),
    (icon: FontAwesomeIcons.paypal),
    (icon: FontAwesomeIcons.ccAmex),
    (icon: FontAwesomeIcons.ccMastercard)
  ];

//
  static const DoctorNamedSuggestion doctorNamedSuggestion = [
    "Dr. Sarah Johnson",
    "Dr. Michael Chen",
    "Dr. Emily Rodriguez",
    "Dr. James Wilson",
    "Dr. Priya Patel",
    "Dr. David Kim",
    "Dr. Olivia  Smith",
    "Dr. Sophia Lee"
  ];

//
  static const TimeSlots timeSlots = [
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
    (time: '6:00 PM')
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

  static Locations locations = [
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
//
  static const CarouselSliderData carouselSliderData = [
    (images: "assets/images/1.png", title: "Stay at home", subTitle: "Take care of your mental healthy "),
    (images: "assets/images/2.png", title: "Take care", subTitle: "Take care of your mental healthy  "),
    (images: "assets/images/3.png", title: "Stay at home", subTitle: "Take care of your mental healthy  "),
    (images: "assets/images/4.png", title: "Stay at home", subTitle: "Take care of your mental healthy "),
    (images: "", title: "", subTitle: " ")
  ];
//
  static final NavigationData navigationData = [
    (icon: Icons.home_outlined, iconFilled: Icons.home_filled),
    (icon: Icons.notifications, iconFilled: Icons.notifications),
    (icon: Icons.favorite_outline_rounded, iconFilled: Icons.favorite_rounded),
    (icon: Icons.calendar_month, iconFilled: Icons.calendar_month_rounded),
    (icon: Icons.person_pin, iconFilled: Icons.person_pin)
  ];




  static const SettingData  settingData = [
  (title: "Notification", icon: Icons.notifications),
  (title: "My Appointment", icon: Icons.book_online_rounded),
  (title: "Payment", icon: Icons.payment_rounded),
  (title: "Language", icon: Icons.language_rounded),
   (title: "Support", icon: Icons.support_agent),
    (title: "Logout", icon: Icons.logout)
];
}





//
typedef Locations = List<String>;
typedef DoctorsImages = List<String>;
typedef SettingData = List<({String title, IconData icon})>;
typedef TimeSlots = List<({String time})>;
typedef DoctorNamedSuggestion = List<String>;
typedef PaymentIcons = List<({IconData icon})>;
typedef DoctorJobs = List<({String job, IconData icon})>;
typedef ServiceTypes = List<({String job, IconData icon})>;
typedef NavigationData = List<({IconData icon, IconData iconFilled})>;
typedef CarouselSliderData = List<({String title, String subTitle, String images})>;
