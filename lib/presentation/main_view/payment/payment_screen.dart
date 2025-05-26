import 'package:doctor_appointment_app/domain/model/my_provider.dart';
import 'package:doctor_appointment_app/domain/notification/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/strip_payment/payment_manager.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_constants.dart';
import '../../widgets/custom_circular_avatar_icons.dart';
import '../../widgets/leading_app_bar.dart';
import 'text_form_field_payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController cardController, cashHeaderController, expireController, cvvController;

  @override
  void initState() => {
        cvvController = TextEditingController(),
        cardController = TextEditingController(),
        expireController = TextEditingController(),
        cashHeaderController = TextEditingController(),
        super.initState()
      };

  @override
  void dispose() =>
      {cardController.dispose(), cashHeaderController.dispose(), expireController.dispose(), cvvController.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingAppBar(title: "Payment"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 35,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text("Choose the payment method", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17), textAlign: TextAlign.start),
              _buildWrapPaymentMethod(),
              TextFormFieldPayment(label: "Card number ", controller: cardController),
              TextFormFieldPayment(label: "Cash header ", controller: cashHeaderController),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(width: 150, child: TextFormFieldPayment(label: "Expire", controller: expireController)),
                SizedBox(width: 150, child: TextFormFieldPayment(label: "Cvv", controller: cvvController))
              ]),
              SizedBox(
                  width: 160,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Icon((Icons.qr_code_scanner), color: AppColors.white, size: 27),
                        Text("Scan card", style: TextStyle(fontSize: 17))
                      ]))),
              ElevatedButton(
                  onPressed: () async {
                   LocalNotificationService.showNotification();
                    // await PaymentManager.makePayment(context.watch<MyProvider>().price!, "egp");
                  },
                  child: Text("pay now", style: TextStyle(fontSize: 22)))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWrapPaymentMethod() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(AppConstants.paymentIcons.length,
            (i) => CustomCircularAvatarIcons(icon: AppConstants.paymentIcons[i].icon, size: 23, radius: 30)));
  }
}
