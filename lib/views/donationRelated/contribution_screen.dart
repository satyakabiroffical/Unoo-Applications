import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/contribution.controller.dart';
import 'package:unno/utils/CustomFormField.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/utils/payment_option.dart';
import 'package:unno/utils/phone_field.dart';

class ContributionScreen extends StatefulWidget {
  const ContributionScreen({super.key});

  @override
  State<ContributionScreen> createState() => _ContributionScreenState();
}

class _ContributionScreenState extends State<ContributionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ContributionController contributionController = Get.put(
    ContributionController(),
  );
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController amount = TextEditingController();
  bool? isChecked = false;

  // Initialize with the first value from tips list
  String? selectedTip = "";

  @override
  initState() {
    contributionController.tip.addAll([
      '10% (${contributionController.selectedCurrency.value} 100)',
      '20% (${contributionController.selectedCurrency.value} 200)',
      '30% (${contributionController.selectedCurrency.value} 300)',
      'Others',
    ]);

    setState(() {
      selectedTip = contributionController.tip[0];
    });

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        contributionController.selectedCurrency.value = "INR";
        contributionController.selectedAmountIndex.value = 0;
        contributionController.tip.clear();
        contributionController.tip.addAll([
          '10% (${contributionController.selectedCurrency.value} 100)',
          '20% (${contributionController.selectedCurrency.value} 200)',
          '30% (${contributionController.selectedCurrency.value} 300)',
          'Others',
        ]);

        setState(() {
          selectedTip = contributionController.tip[0];
        });
      } else {
        contributionController.selectedCurrency.value = "USD";
        contributionController.selectedAmountIndex.value = 0;
        contributionController.tip.clear();
        contributionController.tip.addAll([
          '10% (${contributionController.selectedCurrency.value} 100)',
          '20% (${contributionController.selectedCurrency.value} 200)',
          '30% (${contributionController.selectedCurrency.value} 300)',
          'Others',
        ]);

        setState(() {
          selectedTip = contributionController.tip[0];
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          "Your Contribution",
          w * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppFonts.textInter(
                        context,
                        "Choose a contribution Amount",
                        w * .038,
                        FontWeight.w600,
                        AppColors.blackFontColor,
                        TextAlign.start,
                        TextOverflow.ellipsis,
                      ),
                      Container(
                        height: w * .08,
                        width: w * .29,
                        decoration: BoxDecoration(
                          color: AppColors.whiteFontColor,
                          borderRadius: BorderRadius.circular(w * .05),
                          border: Border.all(
                            color: AppColors.shadowColor.withOpacity(0.4),
                            width: w * .002,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * .005,
                            vertical: w * .005,
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(w * .05),
                            ),
                            indicatorColor: AppColors.shadowColor,
                            labelColor: AppColors.whiteFontColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerHeight: 0.0,
                            unselectedLabelColor: AppColors.shadowColor
                                .withOpacity(0.4),
                            labelStyle: TextStyle(
                              fontSize: w * .024,
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: [Tab(text: "INR"), Tab(text: "USD")],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: w * .05),
                  textInsideContainer(
                    context,
                    'Most Contributors contribute approx 2500 to this Fundraiser',
                    4,
                    true,
                  ),
                  SizedBox(height: w * .02),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textInsideContainer(
                          context,
                          contributionController.selectedCurrency.value == "INR"
                              ? '₹1000'
                              : "\$1000",
                          0,
                          false,
                        ),
                        textInsideContainer(
                          context,
                          contributionController.selectedCurrency.value == "INR"
                              ? '₹2500'
                              : "\$2500",
                          1,
                          false,
                        ),
                        textInsideContainer(
                          context,
                          contributionController.selectedCurrency.value == "INR"
                              ? '₹4000'
                              : "\$4000",
                          2,
                          false,
                        ),
                        textInsideContainer(context, 'Other amount', 3, false),
                      ],
                    ),
                  ),
                  SizedBox(height: w * .05),

                  Obx(
                    () =>
                        contributionController.selectedAmountIndex.value == 3
                            ? Padding(
                              padding: EdgeInsets.only(bottom: w * .040),
                              child: textFieldCommonWidget(
                                context,
                                "Enter Amount",
                                amount,
                                TextInputType.number,
                                "Amount",
                              ),
                            )
                            : SizedBox(),
                  ),
                  IntrinsicHeight(
                    child: Container(
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * .020),
                        color: AppColors.primaryColorLight1,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * .040,
                          vertical: w * .040,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: AppFonts.textInter(
                                    context,
                                    'Unno is charging 0% platform fee* for this fundraiser, relying solely on the generosity of contributors like you. ',
                                    w * .031,
                                    FontWeight.w500,
                                    AppColors.blackFontColor,
                                    TextAlign.start,
                                    TextOverflow.visible,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Icon(
                                    Icons.info_rounded,
                                    color: AppColors.blackFontColor,
                                    size: w * .055,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: w * .040),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppFonts.textInter(
                                  context,
                                  'Support us by adding a tip of :',
                                  w * .032,
                                  FontWeight.w700,
                                  AppColors.blackFontColor,
                                  TextAlign.start,
                                  TextOverflow.visible,
                                ),
                                Column(
                                  children: [
                                    IntrinsicWidth(
                                      child: Container(
                                        height: w * 0.075,
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteFontColor,
                                          borderRadius: BorderRadius.circular(
                                            w * 0.01,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.blackFontColor
                                                  .withOpacity(.1),
                                              spreadRadius: w * 0.005,
                                              blurRadius: w * 0.01,
                                              offset: Offset(0, w * 0.005),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: w * .020,
                                            vertical: w * .020,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              icon: Icon(
                                                CupertinoIcons.chevron_down,
                                                color: AppColors.primaryColor,
                                                size: w * 0.035,
                                              ),
                                              iconSize: w * 0.035,
                                              style: TextStyle(
                                                fontSize: w * 0.032,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.blackFontColor,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              isExpanded: true,
                                              items:
                                                  contributionController.tip.map((
                                                    String tip,
                                                  ) {
                                                    return DropdownMenuItem<
                                                      String
                                                    >(
                                                      value: tip,
                                                      child: Text(
                                                        "${tip}    ",
                                                        style: TextStyle(
                                                          fontSize: w * 0.030,
                                                          color:
                                                              AppColors
                                                                  .blackFontColor,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                              value: selectedTip,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedTip = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    //some space from top
                                    SizedBox(height: w * .020),

                                    //text
                                    AppFonts.textInter(
                                      context,
                                      "Total Amount: INR 2950",
                                      w * .025,
                                      FontWeight.w500,
                                      AppColors.blackFontColor,
                                      TextAlign.start,
                                      TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // space from top
                  SizedBox(height: w * .040),

                  //name  text
                  textFieldCommonWidget(
                    context,
                    "Enter full name",
                    name,
                    TextInputType.text,
                    "Full Name",
                  ),
                ],
              ),
            ),

            // row with checkbox and text
            Padding(
              padding: EdgeInsets.only(left: w * .010),
              child: Row(
                children: [
                  //checkbox
                  Checkbox(
                    // fillColor: WidgetStatePropertyAll(AppColors.shadowColor),
                    value: isChecked,
                    activeColor: AppColors.primaryColor,
                    overlayColor: WidgetStatePropertyAll(
                      AppColors.primaryColor,
                    ),
                    onChanged: (val) {
                      setState(() {
                        isChecked = val!;
                      });
                    },
                    side: BorderSide(
                      color:
                          (isChecked ?? false)
                              ? AppColors.primaryColor
                              : AppColors.blackFontColor,
                      width: w * .002,
                    ),
                  ),

                  //text
                  AppFonts.textInter(
                    context,
                    "Make my contribution anonymous",
                    w * .028,
                    FontWeight.w500,
                    AppColors.blackFontColor,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            //space from top
            SizedBox(height: w * .040),

            //name  text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: textFieldCommonWidget(
                context,
                "Enter your email",
                name,
                TextInputType.text,
                "Email ID *",
              ),
            ),

            // space from top
            SizedBox(height: w * .030),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: Column(
                children: [
                  PhoneNumberField(
                    context: context,
                    onChanged: (val) {},
                    controller: phone,
                  ),

                  // space from top
                  SizedBox(height: w * .080),
                  AppButtons.loginLike(
                    context,
                    () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const PaymentOptionsBottomSheet(),
                      ).then((selectedMethod) {
                        if (selectedMethod != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Selected: $selectedMethod'),
                            ),
                          );
                        }
                      });
                    },
                    AppFonts.textInter(
                      context,
                      "Proceed to contribute ₹2500",
                      w * .040,
                      FontWeight.bold,
                      AppColors.whiteFontColor,
                      TextAlign.center,
                      TextOverflow.ellipsis,
                    ),
                    AppColors.primaryColor,
                    false,
                    w * .130,
                    w * .020,
                  ),

                  // space from top
                  SizedBox(height: w * .020),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: w * .028,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      children: [
                        const TextSpan(
                          text: 'By continuing, you agree to our ',
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // text inside a colored container
  Widget textInsideContainer(
    BuildContext context,
    String text,
    int index,
    bool isAlwaysSelected,
  ) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (!isAlwaysSelected) {
          contributionController.selectedAmountIndex.value = index;
          if (index == 0) {
            contributionController.amountWithoutDonation.value = 1000;
            contributionController.tip.clear();
            contributionController.tip.addAll([
              '10% (${contributionController.selectedCurrency.value} 100)',
              '20% (${contributionController.selectedCurrency.value} 200)',
              '30% (${contributionController.selectedCurrency.value} 300)',
              'Others',
            ]);

            setState(() {
              selectedTip = contributionController.tip[0];
            });
          } else if (index == 1) {
            contributionController.amountWithoutDonation.value = 2500;
            contributionController.tip.clear();
            contributionController.tip.addAll([
              '10% (${contributionController.selectedCurrency.value} 250)',
              '20% (${contributionController.selectedCurrency.value} 500)',
              '30% (${contributionController.selectedCurrency.value} 750)',
              'Others',
            ]);

            setState(() {
              selectedTip = contributionController.tip[0];
            });
          } else if (index == 2) {
            contributionController.amountWithoutDonation.value = 4000;
            contributionController.tip.clear();
            contributionController.tip.addAll([
              '10% (${contributionController.selectedCurrency.value} 400)',
              '20% (${contributionController.selectedCurrency.value} 800)',
              '30% (${contributionController.selectedCurrency.value} 1200)',
              'Others',
            ]);

            setState(() {
              selectedTip = contributionController.tip[0];
            });
          }
        }
      },
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            color:
                isAlwaysSelected
                    ? AppColors.primaryColorLight1
                    : contributionController.selectedAmountIndex.value == index
                    ? AppColors.primaryColorLight1
                    : AppColors.whiteFontColor,
            border: Border.all(color: AppColors.primaryColor, width: w * .003),
            borderRadius: BorderRadius.circular(w * .020),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: w * .010,
              horizontal: w * .040,
            ),
            child: AppFonts.textInter(
              context,
              text,
              w * .032,
              FontWeight.w600,
              AppColors.primaryColor,
              TextAlign.center,
              TextOverflow.visible,
            ),
          ),
        ),
      ),
    );
  }

  //text field common widget
  Widget textFieldCommonWidget(
    BuildContext context,
    String hint,
    TextEditingController controller,
    TextInputType type,
    String label,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text
        AppFonts.textInter(
          context,
          label,
          w * .038,
          FontWeight.w600,
          AppColors.blackFontColor.withOpacity(0.6),
          TextAlign.start,
          TextOverflow.ellipsis,
        ),

        //space from top
        SizedBox(height: w * .020),

        //text form field
        CustomFormField.custTextFormOther(
          context,
          hint,
          1,
          100,
          null,
          null,
          type,
          (val) {},
          controller,
          (val) {
            return null;
          },
          false,
          FocusNode(),
          false,
          (val) {},
          () {},
        ),
      ],
    );
  }
}
