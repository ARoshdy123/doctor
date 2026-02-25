import 'dart:io';

import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalIdScreen extends StatefulWidget {
  const MedicalIdScreen({super.key});

  @override
  State<MedicalIdScreen> createState() => _MedicalIdScreenState();
}

class _MedicalIdScreenState extends State<MedicalIdScreen> {
  static const String _medicalIdPathKey = 'medical_id_image_path';
  File? _medicalIdImage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPath = prefs.getString(_medicalIdPathKey);
    if (savedPath != null && File(savedPath).existsSync()) {
      setState(() {
        _medicalIdImage = File(savedPath);
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_medicalIdPathKey, file.path);
      setState(() {
        _medicalIdImage = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.darkBlue,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Medical ID', style: TextStyles.font18DarkBlueSemiBold),
      ),
      body:
          _isLoading
              ? const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              )
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    verticalSpace(24),
                    Expanded(
                      child:
                          _medicalIdImage != null
                              ? _buildImageView()
                              : _buildEmptyState(),
                    ),
                    verticalSpace(16),
                    AppTextButton(
                      buttonText:
                          _medicalIdImage != null
                              ? 'Update Medical ID'
                              : 'Upload Medical ID',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: _pickImage,
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.r,
            height: 120.r,
            decoration: BoxDecoration(
              color: ColorsManager.superLightGray2,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Icons.badge_outlined,
              size: 60.r,
              color: ColorsManager.gray,
            ),
          ),
          verticalSpace(24),
          Text(
            'No Medical ID uploaded',
            style: TextStyles.font18DarkBlueSemiBold,
          ),
          verticalSpace(8),
          Text(
            'Upload your medical ID card to keep\nit accessible anytime.',
            style: TextStyles.font13GrayRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildImageView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Image.file(
          _medicalIdImage!,
          fit: BoxFit.contain,
          width: double.infinity,
        ),
      ),
    );
  }
}
