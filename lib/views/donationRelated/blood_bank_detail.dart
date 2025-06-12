import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../appPreferences/appColors.dart';
import '../../utils/custom_blood_card.dart';
import '../../utils/custom_label_text.dart';
import '../../utils/custom_status_label.dart';
import '../../utils/custom_text.dart';


class BloodBankDetail extends StatefulWidget {
  const BloodBankDetail({super.key});

  @override
  State<BloodBankDetail> createState() => _BloodBankDetailState();
}

class _BloodBankDetailState extends State<BloodBankDetail> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: Text(
          "Blood Bank Name",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: w * .045,
            color: AppColors.blackFontColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:  w * .03,),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: w *.04),
              child: AppFonts.textInter(
        
                context,
                'We are a non-governmental \norganization',
                w * .047,
                FontWeight.w700,
                AppColors.lightGrey,
                TextAlign.start,
                TextOverflow.visible,
              ),
              
            ),
            SizedBox(height:  w * .03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: Text.rich(
                TextSpan(
                  text: 'Aenean faucibus nibh et justo cursus id rutrum lorem imperdiet. Nunc ut sem vitae risus tristique posuere. Aenean faucibus nibh et justo cursus id rutrum lorem imperdiet. Nunc ut sem vitae risus ',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: w * .033,
                    color: Color.fromRGBO(106, 92, 92, 1),
                  ),
                  children: [
                    TextSpan(
                      text: 'Learn more',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, // Bold
                        color: Colors.black, // Black color
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
        
            SizedBox(height:  w * .03,),
            Container(
              width: double.maxFinite,
              height: w * .6,
              color: Color.fromRGBO(0, 181, 226, 1),
            ),
        
        
            // BLOOD CATERGORY 
            SizedBox(height:  w * .03,),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: w *.04),
              child: AppFonts.textInter(
        
                context,
                'Blood Category',
                w * .047,
                FontWeight.w600,
                AppColors.lightGrey,
                TextAlign.start,
                TextOverflow.visible,
              ),
        
            ),
            SizedBox(height:  w * .03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // allows parent scroll
                childAspectRatio: 0.94,
                children: [
                  BloodCard(
                    imagePath: 'assets/images/cells.png',
                    bloodType: 'A-',
                    status1: 'Available',
                    status1Color: Color.fromRGBO(0, 147, 51, 1),
                    status2: 'Get Blood Now',
                    status2Color: Color.fromRGBO(25, 155, 198, 1),
                  ),
                  BloodCard(
                    imagePath: 'assets/images/cells.png',
                    bloodType: 'B+',
                    status1: 'Available',
                    status1Color:  Color.fromRGBO(0, 147, 51, 1),
                    status2: 'Get Blood Now',
                    status2Color: Color.fromRGBO(25, 155, 198, 1),
                  ),
                  BloodCard(
                    imagePath: 'assets/images/cells.png',
                    bloodType: 'B+',
                    status1: 'Available',
                    status1Color:  Color.fromRGBO(0, 147, 51, 1),
                    status2: 'Get Blood Now',
                    status2Color: Color.fromRGBO(25, 155, 198, 1),
                  ),
                  BloodCard(
                    imagePath: 'assets/images/cells.png',
                    bloodType: 'B+',
                    status1: 'Available',
                    status1Color:  Color.fromRGBO(0, 147, 51, 1),
                    status2: 'Get Blood Now',
                    status2Color: Color.fromRGBO(25, 155, 198, 1),
                  ),
                ],
              ),
            )
        
        
        
          ],
        ),
      ),
    );
  }
}
