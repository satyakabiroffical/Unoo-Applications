import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/custom_text.dart';

class ReelProfileScreen extends StatefulWidget {
  const ReelProfileScreen({super.key});

  @override
  State<ReelProfileScreen> createState() => _ReelProfileScreenState();
}

class _ReelProfileScreenState extends State<ReelProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,

      body: Column(
        children: [
          Container(
            height: w * .520,

            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(w * .05),
                bottomRight: Radius.circular(w * .05),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // icon back button
                      IconButton(
                        icon: Icon(Icons.arrow_back, size: w * .055),
                        color: AppColors.whiteFontColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                      // profile image
                      Container(
                        height: w * .20,
                        width: w * .20,
                        margin: EdgeInsets.only(top: w * .03),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteFontColor,
                          border: Border.all(
                            color: AppColors.whiteFontColor,
                            width: w * .005,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: w * .20,
                          width: w * .20,
                        ),
                      ),

                      SizedBox(width: w * .11),
                    ],
                  ),

                  SizedBox(height: w * .02),

                  // profile name
                  AppFonts.textInter(
                    context,
                    'Roshan Sharma',
                    w * .045,
                    FontWeight.w600,
                    AppColors.whiteFontColor,
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),

                  //user email
                  AppFonts.textInter(
                    context,
                    'Roshansharma99@gmail.com',
                    w * .034,
                    FontWeight.w500,
                    AppColors.whiteFontColor.withOpacity(0.9),
                    TextAlign.start,
                    TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // space from top
          SizedBox(height: w * .02),

          // row with your post and likes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // your post
                _commnContainer(context, 'Your Posts', '12'),

                _commnContainer(context, 'Likes', '8000'),
              ],
            ),
          ),

          // space from row
          SizedBox(height: w * .04),

          //tab bar
          Container(
            height: w * .15,
            decoration: BoxDecoration(color: AppColors.primaryColorLight1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColors.blackFontColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: w * .005,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Container(
                      width: w * 0.1,
                      height: w * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * 0.01),
                        color: AppColors.whiteFontColor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/icons/reelProfile2.png",
                          width: w * 0.07,
                          height: w * 0.07,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Image.asset(
                      "assets/icons/reelProfile1.png",
                      width: w * 0.07,
                      height: w * 0.07,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // tab bar view
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // first tab bar view widget
                SingleChildScrollView(
                  child: Center(
                    child: Wrap(
                      spacing: w * 0.02,
                      runSpacing: w * 0.02,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        10,
                        (index) => Container(
                          height: w * 0.5,
                          width: w * 0.30,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColorLight1,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/reelProfile.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // second tab bar view widget
                SingleChildScrollView(
                  child: Center(
                    child: Wrap(
                      spacing: w * 0.02,
                      runSpacing: w * 0.02,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        10,
                        (index) => Container(
                          height: w * 0.5,
                          width: w * 0.30,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColorLight1,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/reelProfile.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ListView.builder(
                //   itemCount: 10,
                //   physics: const BouncingScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     return notificationCard(
                //       context,
                //       "new notification is here",
                //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur ",
                //       "assets/images/notification.png",
                //       "1m ago",
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _commnContainer(BuildContext context, String title, String value) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * .18,
      width: w * .43,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(w * .02),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppFonts.textInter(
            context,
            value,
            w * .04,
            FontWeight.w600,
            AppColors.whiteFontColor,
            TextAlign.center,
            TextOverflow.ellipsis,
          ),
          SizedBox(height: w * .01),
          AppFonts.textInter(
            context,
            title,
            w * .035,
            FontWeight.w500,
            AppColors.whiteFontColor,
            TextAlign.center,
            TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
