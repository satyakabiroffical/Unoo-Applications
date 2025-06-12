import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../appPreferences/appColors.dart';
import '../../utils/Custom_buttons.dart';
import '../../utils/custom_dropdown_textfield.dart';
import '../../utils/custom_label_text.dart';
import '../../utils/custom_text.dart';
import 'my_fundraiser.dart' show MyFundraiser;


class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return   Scaffold(

      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: Text(
          "Personal Details",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: w * .045,
            color: AppColors.blackFontColor,
          ),
        ),
      ),

      body:
      Container(
        margin: EdgeInsets.all(w * .05),
        padding: EdgeInsets.symmetric(horizontal: w * .01, vertical: w * .05),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white, // Background color is needed for shadow to be visible
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // soft shadow
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 0), // X and Y offset
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledText(
                text: 'Have you raised funds online before this ?',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
          
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
          
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: 'Have you donated to a crowdfunding campaign before?',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
              SizedBox(height: w * .06,),
          
          
              LabeledText(
                text: 'Hospitalisation Status',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: 'Have you raised funds online before this ?',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
          
          
          
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: 'Employment Status',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
          
          
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: ' Company Name (most recent employer)',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
          
          
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: 'Highest Academic Qualification',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),
          
          
              SizedBox(height: w * .06,),
          
              LabeledText(
                text: 'Name of college/school last studied at',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),

                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),


              SizedBox(height: w * .06,),

              LabeledText(
                text: 'Total family income (monthly)',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  prefixIcon: Container(
                    padding: EdgeInsets.all(17),
                      width: 10,height: 10,
                      child: Image.asset('assets/images/rupee.png',fit: BoxFit.contain,)),
                  hintText: '',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),



              SizedBox(height: w * .06,),

              LabeledText(
                text: 'How much amount have you already secured through insurance, loans, friends/relatives, etc.?',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  prefixIcon: Container(
                      padding: EdgeInsets.all(17),
                      width: 10,height: 10,
                      child: Image.asset('assets/images/rupee.png',fit: BoxFit.contain,)),
                  hintText: '',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),


              SizedBox(height: w * .06,),

              LabeledText(
                text: 'Can you raise at least 10% of your goal amount through your family/friends?',
                showAsterisk: false,
                textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromRGBO(68, 68, 67, 1),
                ),
              ),
              SizedBox(height: w * .025,),
              // CUSTOM DROPDOWN TEXTFIELD
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                child: CustomDropdownTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  hintText: 'Select',
                  onTap: () {
                    // Show bottom sheet or modal here
                  },
                ),
              ),


              SizedBox(height: w * .06,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .04),
                child:   AppButtons.loginLike(
                  context,
                      () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFundraiser()));
                      },
                  AppFonts.textInter(
                    context,
                    "Update",
                    w * .040,
                    FontWeight.w700,
                    AppColors.whiteFontColor,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),
                  AppColors.primaryColor,
                  false,
                  w * .130,
                  w * .020,
                ),
              ),
          
          
          
            ],
          ),
        ),
      )

    );
  }
}
