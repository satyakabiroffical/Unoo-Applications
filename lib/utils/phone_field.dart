import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/CustomFormField.dart';
import 'package:unno/utils/custom_text.dart';

class PhoneNumberField extends StatelessWidget {
  BuildContext context;
  final Function(PhoneNumber)? onChanged;
  final TextEditingController? controller;

  PhoneNumberField({
    super.key,
    required this.context,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppFonts.textInter(
            context,
            "Phone Number",
            w * .038,
            FontWeight.w600,
            AppColors.blackFontColor.withOpacity(0.6),
            TextAlign.start,
            TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: w * .020),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: w * .250,
                height: w * .130,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(w * .020),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                ),
                child: Center(
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      counterText: '',
                    ),
                    initialCountryCode: 'IN',
                    readOnly: true,
                    style: TextStyle(fontSize: w * .032),
                    dropdownTextStyle: TextStyle(fontSize: w * .032),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 2,
              child: CustomFormField.custTextFormOther(
                context,
                "Enter Phone Number",
                1,
                100,
                null,
                null,
                TextInputType.number,
                (val) {},
                controller!,
                (val) {
                  return null;
                },
                false,
                FocusNode(),
                false,
                (val) {},
                () {},
              ),
            ),
          ],
        ),
        SizedBox(height: w * .016),
        Text(
          'All Payment updates will be sent on this number.',
          style: TextStyle(fontSize: w * .024, color: Colors.black),
        ),
      ],
    );
  }
}
