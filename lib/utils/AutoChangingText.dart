import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:unno/appPreferences/appColors.dart';
import 'package:unno/controller/homePage.controller.dart';
import 'package:unno/models/successStories.model.dart';
import 'package:unno/utils/custom_text.dart';

class AutoChangingText extends StatefulWidget {
  final List<SuccessStories> textItems;
  final double widthFactor;

  const AutoChangingText({
    Key? key,
    required this.textItems,
    required this.widthFactor,
  }) : super(key: key);

  @override
  _AutoChangingTextState createState() => _AutoChangingTextState();
}

class _AutoChangingTextState extends State<AutoChangingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final HomePageController _homeController = Get.find<HomePageController>();
  int _lastIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  late Worker? _indexListener;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Start listening to index changes using ever from GetX
    _indexListener = ever<int>(_homeController.currentIndex, (val) {
      _handleIndexChange(val);
    });
  }

  void _handleIndexChange(val) {
    if (!mounted) return;

    // Only animate if index actually changed
    if (_homeController.currentIndex.value != _lastIndex) {
      _controller.reverse().then((_) {
        if (mounted) {
          setState(() {
            _lastIndex = _homeController.currentIndex.value;
          });
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _homeController.currentIndex.value = 0;
    _indexListener?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.widthFactor;

    if (widget.textItems.isEmpty) {
      return Container();
    }

    // Use modulo to ensure index is within bounds
    final currentIndex =
        _homeController.currentIndex.value % widget.textItems.length;
    final currentItem = widget.textItems[currentIndex];
    final name = currentItem.name ?? '';
    final description = currentItem.description ?? '';
    final truncatedDescription =
        description.length > 42
            ? '${description.substring(0, 42)}..'
            : description;

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          // Animated name text
          FadeTransition(
            opacity: _fadeAnimation,
            child: AppFonts.textInter(
              context,
              name,
              w * .050,
              FontWeight.w600,
              AppColors.blackFontColor,
              TextAlign.center,
              TextOverflow.visible,
            ),
          ),

          SizedBox(height: w * .010),
          Container(
            width: w * .160,
            height: w * .005,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(w * .050),
            ),
          ),

          SizedBox(height: w * .010),

          // Animated description row
          FadeTransition(
            opacity: _fadeAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/Group.png',
                      height: w * .050,
                      width: w * .050,
                    ),
                    SizedBox(width: w * .010),
                    SizedBox(
                      width: w * .550,
                      child: AppFonts.textInter(
                        context,
                        truncatedDescription,
                        w * .048,
                        FontWeight.w500,
                        AppColors.blackFontColor.withOpacity(.7),
                        TextAlign.center,
                        TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: w * .010),
                Image.asset(
                  'assets/icons/Group1.png',
                  height: w * .050,
                  width: w * .050,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
