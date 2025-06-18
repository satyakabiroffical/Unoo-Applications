import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unno/apis/funds.api.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/contribution.controller.dart';
import 'package:unno/utils/CustomFormField.dart';
import 'package:unno/utils/Custom_buttons.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/utils/payment_option.dart';
import 'package:unno/utils/phone_field.dart';

class ContributionScreen extends StatefulWidget {
  String? contributionId;
  ContributionScreen({super.key, this.contributionId});

  @override
  State<ContributionScreen> createState() => _ContributionScreenState();
}

class _ContributionScreenState extends State<ContributionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ContributionController contributionController = Get.put(
    ContributionController(),
  );
  FundApi fundApi = Get.put(FundApi());

  TextEditingController amount = TextEditingController();
  TextEditingController tipAmount = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  bool? isChecked = false;

  // Initialize with the first value from tips list
  String? selectedTip = "";

  // For real-time form validation
  final ValueNotifier<bool> _formValidNotifier = ValueNotifier<bool>(false);

  @override
  initState() {
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

    contributionController.totalTipAmount.value = "100";
    contributionController.amountWithoutDonation.value = 1000;

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

        contributionController.totalTipAmount.value = "100";
        contributionController.amountWithoutDonation.value = 1000;
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
        contributionController.totalTipAmount.value = "100";
        contributionController.amountWithoutDonation.value = 1000;
      }
    });

    // Add listeners to all text controllers
    contributionController.name.value.addListener(_checkFormValidity);
    contributionController.email.value.addListener(_checkFormValidity);
    contributionController.phone.value.addListener(_checkFormValidity);
    amount.addListener(_checkFormValidity);
    tipAmount.addListener(_checkFormValidity);

    super.initState();
  }

  void _checkFormValidity() {
    final isNameValid =
        contributionController.name.value.text.trim().isNotEmpty;
    final isPhoneValid = contributionController.phone.value.text.length == 10;
    final isEmailValid = _validateEmail(
      contributionController.email.value.text.trim(),
    );
    final isAmountValid =
        contributionController.amountWithoutDonation.value > 0;
    final isTipValid =
        contributionController.totalTipAmount.value.isNotEmpty &&
        double.tryParse(contributionController.totalTipAmount.value) != null;

    _formValidNotifier.value =
        isNameValid &&
        isPhoneValid &&
        isEmailValid &&
        isAmountValid &&
        isTipValid;
  }

  @override
  void dispose() {
    // Remove listeners
    contributionController.name.value.removeListener(_checkFormValidity);
    contributionController.email.value.removeListener(_checkFormValidity);
    contributionController.phone.value.removeListener(_checkFormValidity);
    amount.removeListener(_checkFormValidity);
    tipAmount.removeListener(_checkFormValidity);
    _formValidNotifier.dispose();

    _tabController.dispose();
    contributionController.name.value.clear();
    contributionController.email.value.clear();
    contributionController.phone.value.clear();
    amount.clear();
    tipAmount.clear();
    contributionController.amountWithoutDonation.value = 0.0;
    contributionController.totalTipAmount.value = "";
    contributionController.selectedCurrency.value = "INR";
    contributionController.selectedAmountIndex.value = 0;
    contributionController.tip.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        surfaceTintColor: AppColors.primaryColor,
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
                              child: CustomFormField.custTextFormOther(
                                context,
                                "Enter amount",
                                1,
                                6,
                                null,
                                null,
                                TextInputType.number,
                                (val) {
                                  if (val.isNotEmpty) {
                                    contributionController
                                        .amountWithoutDonation
                                        .value = double.parse(val);
                                    contributionController
                                        .totalTipAmount
                                        .value = (double.parse(val) * 0.1)
                                        .toStringAsFixed(1);
                                    contributionController.tip.clear();
                                    contributionController.tip.addAll([
                                      '10% (${contributionController.selectedCurrency.value} ${(double.parse(val) * 0.1).toStringAsFixed(1)})',
                                      '20% (${contributionController.selectedCurrency.value} ${(double.parse(val) * 0.2).toStringAsFixed(1)})',
                                      '30% (${contributionController.selectedCurrency.value} ${(double.parse(val) * 0.3).toStringAsFixed(1)})',
                                      'Others',
                                    ]);

                                    setState(() {
                                      selectedTip =
                                          contributionController.tip[0];
                                    });
                                  }
                                },
                                amount,
                                (val) {
                                  return null;
                                },
                                false,
                                focusNode1,
                                false,
                                (val) {
                                  setState(() {});
                                },
                                () {},
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
                            if (selectedTip == "Others")
                              SizedBox(height: w * .020),
                            if (selectedTip == "Others")
                              SizedBox(
                                width: w,
                                child: CustomFormField.custTextFormOther(
                                  context,
                                  "Enter tip amount",
                                  1,
                                  5,
                                  null,
                                  null,
                                  TextInputType.number,
                                  (val) {
                                    contributionController
                                        .totalTipAmount
                                        .value = val;
                                    setState(() {});
                                  },
                                  tipAmount,
                                  (val) {
                                    return null;
                                  },
                                  false,
                                  focusNode2,
                                  false,
                                  (val) {
                                    setState(() {});
                                  },
                                  () {},
                                ),
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
                                                        "${tip} ",
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

                                                tipAmount.clear();

                                                if (newValue != "Others") {
                                                  // Extract the string and parse to double
                                                  String amountString =
                                                      newValue!.substring(
                                                        9,
                                                        newValue.length - 1,
                                                      );

                                                  contributionController
                                                      .totalTipAmount
                                                      .value = amountString;
                                                } else {
                                                  contributionController
                                                      .totalTipAmount
                                                      .value = "0";
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: w * .020),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: w * .040),

                  textFieldCommonWidget(
                    context,
                    "Enter full name",
                    contributionController.name.value,
                    TextInputType.text,
                    "Full Name *",
                    (val) {
                      setState(() {});
                    },
                    focusNode3,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: w * .010),
              child: Row(
                children: [
                  Checkbox(
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

            SizedBox(height: w * .040),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: textFieldCommonWidget(
                context,
                "Enter your email",
                contributionController.email.value,
                TextInputType.text,
                "Email ID *",
                (val) {
                  setState(() {});
                },
                focusNode4,
              ),
            ),

            SizedBox(height: w * .030),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: Column(
                children: [
                  PhoneNumberField(
                    context: context,
                    onChanged: (val) {
                      setState(() {});
                    },
                    controller: contributionController.phone.value,
                    focusNode: focusNode5,
                  ),

                  SizedBox(height: w * .080),
                  ValueListenableBuilder<bool>(
                    valueListenable: _formValidNotifier,
                    builder: (context, isFormValid, child) {
                      final totalAmount =
                          contributionController.amountWithoutDonation.value +
                          (double.tryParse(
                                contributionController.totalTipAmount.value,
                              ) ??
                              0);
                      final currencySymbol =
                          contributionController.selectedCurrency.value == "INR"
                              ? "₹"
                              : "\$";

                      return isFormValid
                          ? AppButtons.loginLike(
                            context,
                            () {
                              fundApi
                                  .createDonationApi(context, {
                                    "name":
                                        contributionController.name.value.text,
                                    "email":
                                        contributionController.email.value.text,
                                    "tipAmount": double.tryParse(
                                      contributionController
                                          .totalTipAmount
                                          .value,
                                    ),
                                    "hide": isChecked,
                                    "donationAmount": totalAmount,
                                    "paymentMethod": "RAZORPAY",
                                    "userId": "6815a20a1d536533ed37248e",
                                    "transactionId": "tgdyajsh12345",
                                    "fundRaiseFor": widget.contributionId,
                                  })
                                  .then((val) {
                                    if (val) {
                                      Navigator.pop(context);
                                    }
                                  });
                            },
                            AppFonts.textInter(
                              context,
                              "Proceed to contribute $currencySymbol${totalAmount.toStringAsFixed(2)}",
                              w * .040,
                              FontWeight.bold,
                              AppColors.whiteFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
                            AppColors.primaryColor,
                            fundApi.gettingFundDetails.value,
                            w * .130,
                            w * .020,
                          )
                          : InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              if (contributionController
                                  .name
                                  .value
                                  .text
                                  .isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Name is required",
                                  backgroundColor: Colors.red,
                                  icon: Icon(Icons.close, color: Colors.white),
                                );
                              }

                              if (!_validateEmail(
                                contributionController.email.value.text,
                              )) {
                                Get.snackbar(
                                  "Error",
                                  "Enter valid email",
                                  backgroundColor: Colors.red,
                                  icon: Icon(Icons.close, color: Colors.white),
                                );
                              }

                              if (contributionController
                                  .phone
                                  .value
                                  .text
                                  .isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Phone number is required",
                                  backgroundColor: Colors.red,
                                  icon: Icon(Icons.close, color: Colors.white),
                                );
                              } else if (contributionController
                                      .phone
                                      .value
                                      .text
                                      .length !=
                                  10) {
                                Get.snackbar(
                                  "Error",
                                  "Phone number must be of 10 digit",
                                  backgroundColor: Colors.red,
                                  icon: Icon(Icons.close, color: Colors.white),
                                );
                              }
                            },
                            child: Container(
                              height: w * .130,
                              width: w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(w * .020),
                              ),
                              child: Center(
                                child: AppFonts.textInter(
                                  context,
                                  "Proceed to contribute $currencySymbol${totalAmount.toStringAsFixed(2)}",
                                  w * .040,
                                  FontWeight.bold,
                                  AppColors.whiteFontColor,
                                  TextAlign.center,
                                  TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                    },
                  ),

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

                  SizedBox(height: w * .700),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String email) {
    if (email.isEmpty) return false;
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  Widget textInsideContainer(
    BuildContext context,
    String text,
    int index,
    bool isAlwaysSelected,
  ) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        amount.clear();
        tipAmount.clear();
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

            contributionController.totalTipAmount.value = "100";
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

            contributionController.totalTipAmount.value = "250";
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

            contributionController.totalTipAmount.value = "400";
          } else {
            contributionController.amountWithoutDonation.value = 0;
            contributionController.totalTipAmount.value = "0";
            contributionController.tip.clear();
            contributionController.tip.addAll([
              '10% (${contributionController.selectedCurrency.value} 0)',
              '20% (${contributionController.selectedCurrency.value} 0)',
              '30% (${contributionController.selectedCurrency.value} 0)',
              'Others',
            ]);

            setState(() {
              selectedTip = contributionController.tip[0];
            });
          }
          setState(() {});
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

  Widget textFieldCommonWidget(
    BuildContext context,
    String hint,
    TextEditingController controller,
    TextInputType type,
    String label,
    Function(String val) onChange,
    FocusNode focusNode,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFonts.textInter(
          context,
          label,
          w * .038,
          FontWeight.w600,
          AppColors.blackFontColor.withOpacity(0.6),
          TextAlign.start,
          TextOverflow.ellipsis,
        ),

        SizedBox(height: w * .020),

        CustomFormField.custTextFormOther(
          context,
          hint,
          1,
          100,
          null,
          null,
          type,
          onChange,
          controller,
          (val) {
            return null;
          },
          false,
          focusNode,
          false,
          (val) {
            setState(() {});
          },
          () {},
        ),
      ],
    );
  }
}
