import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/custom_text.dart';

class PaymentOptionsBottomSheet extends StatefulWidget {
  const PaymentOptionsBottomSheet({super.key});

  @override
  State<PaymentOptionsBottomSheet> createState() =>
      PaymentOptionsBottomSheetState();
}

class PaymentOptionsBottomSheetState extends State<PaymentOptionsBottomSheet> {
  String? selectedPaymentMethod = 'Debit/Credit'; // Default selected option

  final List<String> paymentOptions = [
    'UPI',
    'Debit/Credit',
    'Net Banking',
    'Paytm',
    'Wallets',
  ];

  final List<String> icons = [
    'assets/icons/upi.png',
    'assets/icons/debit.png', // Added comma here
    'assets/icons/netBank.png', // Added comma here
    'assets/icons/paytm.png', // Added comma here
    'assets/icons/wallet.png', // Added comma here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose payment option',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(color: AppColors.blackFontColor.withOpacity(0.4), height: 20),
          ...paymentOptions
              .map(
                (option) => _buildPaymentOption(
                  option,
                  icons[paymentOptions.indexOf(option)],
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String option, String icon) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            selectedPaymentMethod == option
                ? AppColors.shadowColor
                : AppColors.whiteFontColor,
      ),

      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        leading: Image.asset(
          icon,
          height: 30,
          width: 30,
          color:
              selectedPaymentMethod == option
                  ? AppColors.primaryColor
                  : Colors.black,
        ),
        title: AppFonts.textInter(
          context,
          option,
          19,
          FontWeight.w500,
          selectedPaymentMethod == option
              ? AppColors.primaryColor
              : AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
        onTap: () {
          setState(() {
            selectedPaymentMethod = option;
          });
          Navigator.pop(context, selectedPaymentMethod);
        },
      ),
    );
  }
}
