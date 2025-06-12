import 'package:flutter/material.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/utils/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
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
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title: AppFonts.textInter(
          context,
          "Notification",
          w * .045,
          FontWeight.w600,
          AppColors.blackFontColor,
          TextAlign.start,
          TextOverflow.ellipsis,
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.blackFontColor),
      ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.primaryColorLight1),
            child: TabBar(
              controller: tabController,
              indicatorColor: AppColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: w * .010,
              isScrollable: false,
              tabs: [
                Tab(
                  child: Center(
                    child: AppFonts.textInter(
                      context,
                      "General",
                      w * 0.038,
                      FontWeight.w500,
                      AppColors.primaryColor,
                      TextAlign.center,
                      TextOverflow.visible,
                    ),
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Center(
                        child: AppFonts.textInter(
                          context,
                          "Recommended",
                          w * 0.038,
                          FontWeight.w500,
                          AppColors.primaryColor,
                          TextAlign.center,
                          TextOverflow.visible,
                        ),
                      ),

                      // container with square shape and center text with primary color which show number of notification
                      Container(
                        margin: EdgeInsets.only(left: w * 0.02),
                        height: w * 0.05,
                        width: w * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.005),
                          color: AppColors.whiteFontColor,
                        ),
                        child: Center(
                          child: AppFonts.textInter(
                            context,
                            "12",
                            w * 0.025,
                            FontWeight.w700,
                            AppColors.primaryColor,
                            TextAlign.center,
                            TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // tab bar view
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // first tab bar view widget
                ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return notificationCard(
                      context,
                      "new notification is here",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur ",
                      "assets/images/notification.png",
                      "1m ago",
                    );
                  },
                ),

                // second tab bar view widget
                ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return notificationCard(
                      context,
                      "new notification is here",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur ",
                      "assets/images/notification.png",
                      "1m ago",
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //notification screen widget
  Widget notificationCard(
    BuildContext context,
    String title,
    String subtitle,
    String image,
    String time,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: w * 0.05, horizontal: w * 0.03),
      child: Row(
        children: [
          // image in circle container
          Container(
            height: w * 0.12,
            width: w * 0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColorLight1,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: w * 0.02),

          // title and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFonts.textInter(
                context,
                title,
                w * 0.035,
                FontWeight.w600,
                AppColors.blackFontColor,
                TextAlign.start,
                TextOverflow.visible,
              ),
              SizedBox(
                width: w * 0.7,
                child: AppFonts.textInter(
                  context,
                  subtitle,
                  w * 0.028,
                  FontWeight.w400,
                  AppColors.blackFontColor.withOpacity(0.9),
                  TextAlign.start,
                  TextOverflow.visible,
                ),
              ),
            ],
          ),

          // time
          AppFonts.textInter(
            context,
            time,
            w * 0.025,
            FontWeight.w500,
            AppColors.blackFontColor.withOpacity(0.5),
            TextAlign.start,
            TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
