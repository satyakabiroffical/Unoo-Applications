import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'custom_label_text.dart';
import 'custom_textfield.dart';

// Make sure LabeledText and CustomTextField are imported or defined

class StepTwoWidget extends StatefulWidget {
  final double w;
  final BuildContext parentContext;

  const StepTwoWidget({Key? key, required this.w, required this.parentContext}) : super(key: key);

  @override
  _StepTwoWidgetState createState() => _StepTwoWidgetState();
}

class _StepTwoWidgetState extends State<StepTwoWidget> {
  File? _selectedImage;
  File? _finalImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final w = widget.w;
    final parentContext = widget.parentContext;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: w * .0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .04),
            child: Center(
              child: Text(
                'Add Fundraiser image / Video',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: w * .036,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: w * .05),
          Container(
            margin: EdgeInsets.symmetric(horizontal: w * .04),
            width: double.maxFinite,
            height: w * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(241, 245, 249, 1),
            ),
            child: Center(
              child: _finalImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _finalImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
                  : SizedBox(
                width: w * .07,
                height: w * .07,
                child: Image.asset('assets/images/img.png'),
              ),
            ),
          ),
          SizedBox(height: w * .05),
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(w * .05),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: SizedBox(
                              width: w * .06,
                              height: w * .06,
                              child: Image.asset('assets/images/cam2.png'),
                            ),
                            title: Text(
                              'Choose Image from Gallery',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: w * .038,
                                color: const Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            onTap: () async {
                              Navigator.pop(context); // closes bottom sheet

                              final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

                              if (!mounted) return;

                              if (pickedFile != null) {
                                setState(() {
                                  _selectedImage = File(pickedFile.path);
                                });

                                showDialog(
                                  context: parentContext, // Use parent context here!
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "This is the image that will feature right on top of your page.\nMake it impactful!",
                                          style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(153, 153, 153, 1),
                                            fontSize: w * .04,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(
                                            style: GoogleFonts.inter(
                                              color: const Color.fromRGBO(153, 153, 153, 1),
                                              fontSize: w * .04,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: const [
                                              TextSpan(
                                                text: 'Filetype: ',
                                                style: TextStyle(fontWeight: FontWeight.w600),
                                              ),
                                              TextSpan(text: 'PNG, JPG, BMP\n'),
                                              TextSpan(
                                                text: 'Recommended Size: ',
                                                style: TextStyle(fontWeight: FontWeight.w600),
                                              ),
                                              TextSpan(text: '700×400'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SizedBox(
                                        width: w * 0.44,
                                        height: w * 0.44,
                                        child: Image.file(
                                          _selectedImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _selectedImage = null;
                                              });
                                            },
                                            child: Container(
                                              width: w * .32,
                                              height: w * .11,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: const Color.fromRGBO(0, 181, 226, 1)),
                                              ),
                                              child: Center(
                                                child: LabeledText(
                                                  text: 'Cancel',
                                                  showAsterisk: false,
                                                  textStyle: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: w * 0.038,
                                                    color: const Color.fromRGBO(0, 181, 226, 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _finalImage = _selectedImage;
                                              });
                                            },
                                            child: Container(
                                              width: w * .32,
                                              height: w * .11,
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(0, 181, 226, 1),
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: const Color.fromRGBO(0, 181, 226, 1)),
                                              ),
                                              child: Center(
                                                child: LabeledText(
                                                  text: 'Save',
                                                  showAsterisk: false,
                                                  textStyle: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: w * 0.038,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          ListTile(
                            leading: SizedBox(
                              width: w * .06,
                              height: w * .06,
                              child: Image.asset('assets/images/vid.png'),
                            ),
                            title: Text(
                              'Enter Video URL',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: w * .038,
                                color: const Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              // TODO: Handle video selection
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: w * .03, horizontal: w * .03),
                width: w * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(232, 245, 250, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: w * .044,
                      height: w * .044,
                      child: Image.asset('assets/images/cam.png'),
                    ),
                    Text(
                      'Choose file',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: w * .036,
                        color: const Color.fromRGBO(25, 155, 198, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: w * .1),
          CustomTextField(
            fontSize: w * .04,
            textColor: const Color.fromRGBO(156, 163, 175, 1),
            initialValue: "Enter your city",
            suffixIcon: Image.asset(
              'assets/images/loco.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: w * .04),
          SizedBox(height: w * .04),
        ],
      ),
    );
  }
}
