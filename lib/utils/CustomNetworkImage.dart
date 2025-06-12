import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage {
  // this is the custom image to show every network image except profile
  static Widget CustImage(String url, double w, double h, BoxFit fit) {
    return CachedNetworkImage(
      height: h,
      width: w,
      fit: fit,
      imageUrl: "https://leadkart.in-maa-1.linodeobjects.com/$url",
      placeholder:
          (context, url) => Image.asset(
            "assets/images/cam2.png",
            color: Colors.grey.shade200,
          ),
      errorWidget:
          (context, url, error) => Image.asset(
            "assets/images/cam2.png",
            color: Colors.grey.shade200,
          ),
    );
  }

  // this is custom image to show profile image of the user
  static Widget CustImageProfile(String url, double w, double h, BoxFit fit) {
    return CachedNetworkImage(
      height: h,
      width: w,
      fit: fit,
      imageUrl: "https://leadkart.in-maa-1.linodeobjects.com/$url",
      placeholder: (context, url) => Image.asset("assets/icons/user.png"),
      errorWidget:
          (context, url, error) => Image.asset("assets/icons/user.png"),
    );
  }
}
