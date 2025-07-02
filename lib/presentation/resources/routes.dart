import 'package:flutter/material.dart';

import '../../data/model/doctor_model.dart';
import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';
import '../main_view/body/details_screen.dart';
import '../main_view/body/my_whish_list.dart';
import '../main_view/booking/appointment_screen.dart';
import '../main_view/booking/booking_appointment_screen.dart';
import '../main_view/booking/confirmation_screen.dart';
import '../main_view/main_view.dart';
import '../onboarding/onboarding_screen.dart';
import '../setting/profile/profile.dart';
import '../setting/setting_screen.dart';
import '../splash_screen/splash_screen.dart';

class NamedRoutes {
  NamedRoutes._();

  static const String home = '/';

  //splash
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  // Authentication
  static const String signInScreen = "/signInScreen";
  static const String signUpScreen = "/signUpScreen";

//payment

  //
  static const String mainView = "/mainView";
  static const String detailsScreen = "/detailsScreen";
//
  static const String myWhishList = "/myWhishList";
  static const String appointment = "/appointment";
  static const String bookingAppointment = "/bookingAppointment";

  // Profile Page
  static const String confirm = '/confirm';
  static const String setting = '/setting';
  static const String profilePage = "/profilePage";
  //
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      //
      case NamedRoutes.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      //
      case NamedRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      //
      case NamedRoutes.confirm:
        return MaterialPageRoute(builder: (_) => ConfirmationScreen());

      //
      case NamedRoutes.profilePage:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      //

      case NamedRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      //
      case NamedRoutes.mainView:
        return MaterialPageRoute(builder: (_) => MainView());

      case NamedRoutes.detailsScreen:
        if (settings.arguments is DoctorModel) {
          final doctor = settings.arguments as DoctorModel;
          return MaterialPageRoute(builder: (_) => DetailsScreen(doctors: doctor));
        } else {
          return MaterialPageRoute(
              builder: (_) => Center(child: Text(" No page found", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700))));
        }
//
      case NamedRoutes.appointment:
        return MaterialPageRoute(builder: (_) => AppointmentScreen());

      //
      case NamedRoutes.myWhishList:
        return MaterialPageRoute(builder: (_) => MyWhishListPage());
      //
      case NamedRoutes.setting:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      //
      case NamedRoutes.bookingAppointment:
        return MaterialPageRoute(builder: (_) => BookingAppointmentScreen());
      //

      default:
        return MaterialPageRoute(
            builder: (_) => Center(child: Text(" No page found", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700))));
    }
  }
}
