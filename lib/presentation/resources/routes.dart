import 'package:get/get.dart';

import '../auth/sign_in_screen.dart';
import '../auth/sign_up_screen.dart';
import '../main_view/main_view.dart';
import '../auth/profile/profile.dart';
import '../splash_screen/splash_screen.dart';
import '../main_view/body/details_screen.dart';
import '../main_view/body/my_whish_list.dart';
import '../main_view/booking/appointment_screen.dart';
import '../main_view/booking/confirmation_screen.dart';
import '../main_view/booking/booking_appointment_screen.dart';

class NamedRoutes {
  NamedRoutes._();

  static const String home = '/';
  
  //splash
  static const String splash = '/splash';

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
  static const String profilePage = "/profilePage";
  //
}

class RouteGenerator {
  static List<GetPage> getRoute() {
    return [
      // Authentication
      GetPage(name: NamedRoutes.signInScreen, page: () => const SignInScreen()),
      GetPage(name: NamedRoutes.signUpScreen, page: () => const SignUpScreen()),
      //
      GetPage(name: NamedRoutes.profilePage, page: () => ProfileScreen()),
      //
      GetPage(name: NamedRoutes.splash, page: () => const SplashScreen()),

      //
      GetPage(name: NamedRoutes.mainView, page: () => const MainView()),
      GetPage(name: NamedRoutes.detailsScreen, page: () => DetailsScreen(doctors: Get.arguments)),
      //
      GetPage(name: NamedRoutes.confirm, page: () => ConfirmationScreen()),
      GetPage(name: NamedRoutes.appointment, page: () => AppointmentScreen()),
      GetPage(name: NamedRoutes.myWhishList, page: () => const MyWhishListPage()),
      GetPage(name: NamedRoutes.bookingAppointment, page: () => BookingAppointmentScreen())
    ];
  }
}
