import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../appPreferences/appColors.dart';
import '../../utils/custom_dropdown_textfield.dart';
import '../../utils/custom_label_text.dart';

class MyFundraiser extends StatefulWidget {
  const MyFundraiser({super.key});

  @override
  State<MyFundraiser> createState() => _MyFundraiserState();
}

class _MyFundraiserState extends State<MyFundraiser> {

  List<File> _pickedImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    try {
      final List<XFile>? images = await picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        setState(() {
          // Add newly selected images to the existing list
          _pickedImages.addAll(images.map((xfile) => File(xfile.path)));
        });
      }
    } catch (e) {
      debugPrint('Error picking images: $e');
    }
  }

  void _removeImageAt(int index) {
    setState(() {
      _pickedImages.removeAt(index);
    });
  }



  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteFontColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteFontColor,
        title:   Text(
          "My fundraises",
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
            SizedBox(height: w * .06,),
            LabeledText(
              text: 'Fundraiser Title',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            // CUSTOM DROPDOWN TEXTFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: CustomDropdownTextField(
                borderColor: Color.fromRGBO(85, 85, 85, 1),
                maxLines: 2,
                // suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                hintText: 'I Need Your Urgent Support For My Fat embolism Treatment',
                onTap: () {
                  // Show bottom sheet or modal here
                },
              ),
            ),


            SizedBox(height: w * .06,),
            LabeledText(
              text: 'Goal',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            // CUSTOM DROPDOWN TEXTFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: CustomDropdownTextField(
                borderColor: Color.fromRGBO(85, 85, 85, 1),
                // maxLines: 2,
                // suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                hintText: '2000',
                onTap: () {
                  // Show bottom sheet or modal here
                },
              ),
            ),


            SizedBox(height: w * .06,),
            LabeledText(
              text: 'End Date',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            // CUSTOM DROPDOWN TEXTFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: CustomDropdownTextField(
                borderColor: Color.fromRGBO(85, 85, 85, 1),
                // maxLines: 2,
                // suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                hintText: '07/25/2025',
                onTap: () {
                  // Show bottom sheet or modal here
                },
              ),
            ),


            SizedBox(height: w * .06,),
            LabeledText(
              text: 'Fundraiser Link',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            // CUSTOM DROPDOWN TEXTFIELD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: CustomDropdownTextField(
                borderColor: Color.fromRGBO(85, 85, 85, 1),
                maxLines: 2,
                // suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                hintText: 'i-need-your-urgent-support-for-my-fat-embolism-treatment-1005999',
                onTap: () {
                  // Show bottom sheet or modal here
                },
              ),
            ),


            SizedBox(height: w * .06),

            LabeledText(
              text: 'About',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 18),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromRGBO(85, 85, 85, 1),width: 1)
              ),

              child: Text('Hi,\nMy name is Ayush Ranjan and I am raising funds for my grandfather, Mr Babu lal who is suffering from Bladder cancer/ bladder carcinoma and is undergoing treatment at Paras HMRI Hospital, Patna. The family has done all it can to collect the total amount required for the treatment but Rs.50000 more is required to pay for all the medical expenses.As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time of As the amount required is huge, I request you to kindly contribute towards the treatment and help during this time '
                ,style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(68, 68, 68, 1)
                ),
              ),
            ),

            SizedBox(height: w * .06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Row(
                children: [
                  LabeledText(
                    horizontalPadding: 0,
                    text: 'Add Medical Documents',
                    showAsterisk: false,
                    textStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.039,
                      color: const Color.fromRGBO(68, 68, 68, 1),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: w * 0.060,
                    height: w * 0.060,
                    child: Image.asset(
                      'assets/images/q.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: w * .02),
            LabeledText(
              text: 'Upload important bill and documents e.g. Hospital/Medical bill, Doctor’s prescription etc.',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.width * 0.035,
                color: const Color.fromRGBO(85, 85, 85, 1),
              ),
            ),


            // FUNDRAISER IMAGE
            SizedBox(height: w * .03,),

            // Show picked images thumbnails if any
            if (_pickedImages.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  height: (w * .3) * ((_pickedImages.length / 2).ceil()), // Height adjusted by rows count
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // disable scroll inside parent scroll
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: w * 0.03,
                      crossAxisSpacing: w * 0.03,
                      childAspectRatio: (w * 0.44) / (w * 0.29), // keep similar aspect ratio as Add box
                    ),
                    itemCount: _pickedImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: w * .8,
                            height: w *.8,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // border: Border.all()
                            ),
                            child: Image.file(
                              _pickedImages[index],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () => _removeImageAt(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),


            SizedBox(height: w * .02),

            // Always show this Add button container
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: w * 0.04),
                width: w * .44,
                height: w * .29,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  dashPattern: const [6, 3],
                  color: const Color.fromRGBO(0, 181, 226, 1),
                  strokeWidth: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w * .080,
                          height: w * .080,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset('assets/images/img.png'),
                        ),
                        const SizedBox(height: 2),
                        LabeledText(
                          text: 'Add',
                          showAsterisk: false,
                          textStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.039,
                            color: const Color.fromRGBO(0, 181, 226, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



            // FUNDRAISER IMAGE
            SizedBox(height: w * .06,),
            LabeledText(
              text: 'Fundraiser Image',
              showAsterisk: false,
              textStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.of(context).size.width * 0.039,
                color: const Color.fromRGBO(68, 68, 68, 1),
              ),
            ),
            SizedBox(height: w * .025,),
            // Show picked image with Remove button or Add container

            if (_selectedImage != null)
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: w * .04),
                    width: double.infinity,
                    height: w * .6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: w * .010,
                    right: w * .060,
                    child: GestureDetector(
                      onTap: _removeImage,
                      child: Container(
                        width: w * .20,
                        height: w * .080,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Remove',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: w * 0.037,
                              color: Color.fromRGBO(255, 59, 48, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            SizedBox(height: w * .04),

            // Always show Add Button
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                width: w * .44,
                height: w * .29,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(8),
                  dashPattern: [6, 3],
                  color: Color.fromRGBO(0, 181, 226, 1),
                  strokeWidth: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w * .080,
                          height: w * .080,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset('assets/images/img.png'),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Add',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: w * 0.039,
                            color: Color.fromRGBO(0, 181, 226, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(height: w * .06),
          ],
        ),
      ),
    );
  }
}
