import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/RouteTransition.dart';
import 'package:unno/utils/custom_text.dart';
import 'package:unno/views/profileRelated/editProfile_screen.dart';
import 'package:unno/views/profileRelated/historyDonation_screen.dart';
import 'package:unno/views/profileRelated/kyc_screen.dart';
import 'package:unno/views/profileRelated/reelProfile_screen.dart';

import '../form/form_screen.dart';
import '../other_cause_form/form_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: w * .05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // profile with round container only show photo
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: w * .25,
                    width: w * .25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            
                // some space
                SizedBox(height: w * .02),
            
                //name of the user
                AppFonts.textInter(
                  context,
                  'Roshan Sharma',
                  w * .05,
                  FontWeight.w600,
                  AppColors.blackFontColor,
            
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
            
                //email text with light black font
                AppFonts.textInter(
                  context,
                  'roshansharma99@gmail.com',
                  w * .038,
                  FontWeight.w400,
                  AppColors.blackFontColor.withOpacity(.7),
            
                  TextAlign.center,
                  TextOverflow.ellipsis,
                ),
            
                //some space from top
                SizedBox(height: w * .02),
            
                //bio of the user
                AppFonts.textInter(
                  context,
                  'Here is my bio to write down you can so Here is my bio to write down you can so or anything else.',
                  w * .037,
                  FontWeight.w400,
                  AppColors.blackFontColor.withOpacity(.5),
                  TextAlign.center,
                  TextOverflow.visible,
                ),
            
                //some space from top
                SizedBox(height: w * .06),
            
                //inside row i want two containers with rounded corners
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //first container
                    Container(
                      height: w * .18,
                      width: w / 2.25,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorLight1,
                        borderRadius: BorderRadius.circular(w * .015),
                      ),
            
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: w * .02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // text which showa Total Contribution
                            AppFonts.textInter(
                              context,
                              'Total Contribution',
                              w * .04,
                              FontWeight.w500,
                              AppColors.blackFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
            
                            //  text which shows the 5000 with rupee symbols
                            AppFonts.textInter(
                              context,
                              '₹5000',
                              w * .042,
                              FontWeight.w600,
                              AppColors.blackFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
            
                    //second container
                    Container(
                      height: w * .18,
                      width: w / 2.25,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorLight1,
                        borderRadius: BorderRadius.circular(w * .015),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: w * .02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // text which showa Active Fundraisers
                            AppFonts.textInter(
                              context,
                              'Active Fundraisers',
                              w * .04,
                              FontWeight.w500,
                              AppColors.blackFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
            
                            //  text which shows no of active fundraisers
                            AppFonts.textInter(
                              context,
                              '1',
                              w * .042,
                              FontWeight.w600,
                              AppColors.blackFontColor,
                              TextAlign.center,
                              TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(context, "Your reels", "assets/icons/reel1.png", () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: ReelProfileScreen()),
                  );
                }, false),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Edit Profile",
                  "assets/icons/editProfile.png",
                  () {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: EditProfileScreen()),
                    );
                  },
                  false,
                ),
            
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Edit NGO",
                  "assets/icons/editNGO.png",
                  () {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: FormScreen()),
                    );
                  },
                  false,
                ),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Update your KYC",
                  "assets/icons/updateKYC.png",
                  () {
                    Navigator.push(context, SlideLeftRoute(page: KycScreen()));
                  },
                  true,
                ),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Contribution history",
                  "assets/icons/history.png",
                  () {
                    Navigator.push(context, SlideLeftRoute(page: History()));
                  },
                  false,
                ),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Inbox",
                  "assets/icons/inbox.png",
                  () {
                    Navigator.push(context, SlideLeftRoute(page:  FormScreen1()));

                  },
                  false,
                ),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Help & FAQ",
                  "assets/icons/help.png",
                  () {},
                  false,
                ),
            
                //some space of 10
                SizedBox(height: w * .01),
            
                // first common widget
                commonWidget(
                  context,
                  "Logout",
                  "assets/icons/logout.png",
                  () {},
                  false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //common widget functiion
  Widget commonWidget(
    BuildContext context,
    String title,
    String icon,
    void Function() onTap,
    bool isShowPending,
  ) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(w * .02),
      child: Container(
        height: w * .145,
        width: w,
        decoration: BoxDecoration(
          color: AppColors.primaryColorLight1,
          borderRadius: BorderRadius.circular(w * .02),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //icon
                  Container(
                    height: w * .055,
                    width: w * .055,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(icon),
                      ),
                    ),
                  ),

                  //some space
                  SizedBox(width: w * .03),
                  //title
                  AppFonts.textInter(
                    context,
                    title,
                    w * .038,

                    FontWeight.w500,
                    AppColors.blackFontColor,
                    TextAlign.center,
                    TextOverflow.ellipsis,
                  ),

                  //some space
                  SizedBox(width: w * .03),

                  if (isShowPending)
                    //pending text
                    Container(
                      height: w * .052,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * .010),
                        border: Border.all(
                          width: w * .002,
                          color: AppColors.orangeColor,
                        ),
                        color: AppColors.lightOrange,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .02),
                        child: Center(
                          child: AppFonts.textInter(
                            context,
                            'Pending',
                            w * .030,
                            FontWeight.w500,
                            AppColors.redColor,
                            TextAlign.center,
                            TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              //cupertino forward arrow icon
              Icon(
                CupertinoIcons.forward,
                color: AppColors.blackFontColor,
                size: w * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
