import 'dart:io';

import 'package:doctor/core/helpers/app_regax.dart';
import 'package:doctor/core/helpers/spacing.dart';
import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:doctor/core/widgets/app_text_button.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:doctor/features/profile/data/models/profile_response_model.dart';
import 'package:doctor/features/profile/logic/cubit/update_profile_cubit.dart';
import 'package:doctor/features/profile/logic/cubit/update_profile_state.dart';
import 'package:doctor/features/sign_up/ui/widgets/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationScreen extends StatefulWidget {
  final ProfileData? profileData;

  const PersonalInformationScreen({super.key, this.profileData});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  late final ValueNotifier<int> selectedGenderNotifier;
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<UpdateProfileCubit>();
    cubit.initControllers(
      name: widget.profileData?.name,
      email: widget.profileData?.email,
      phone: widget.profileData?.phone,
      gender: widget.profileData?.gender,
    );
    selectedGenderNotifier = ValueNotifier(cubit.selectedGender);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();

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
        title: Text(
          'Personal information',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
      ),
      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (model) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully'),
                  backgroundColor: ColorsManager.mainBlue,
                ),
              );
              Navigator.pop(context, true);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                verticalSpace(20),
                // Avatar
                _buildAvatar(),
                verticalSpace(30),
                // Gender
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Gender', style: TextStyles.font14DarkBlueMedium),
                ),
                verticalSpace(10),
                ValueListenableBuilder<int>(
                  valueListenable: selectedGenderNotifier,
                  builder: (context, selectedGender, _) {
                    return Row(
                      children: [
                        Expanded(
                          child: GenderTile(
                            icon: Icons.male,
                            label: 'Male',
                            selected: selectedGender == 0,
                            onTap: () {
                              selectedGenderNotifier.value = 0;
                              cubit.updateGender(0);
                            },
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: GenderTile(
                            icon: Icons.female,
                            label: 'Female',
                            selected: selectedGender == 1,
                            onTap: () {
                              selectedGenderNotifier.value = 1;
                              cubit.updateGender(1);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                verticalSpace(20),
                // Name
                AppTextFormField(
                  labelText: 'Name',
                  controller: cubit.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                verticalSpace(18),
                // Email
                AppTextFormField(
                  labelText: 'Email',
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                verticalSpace(18),
                // Phone
                AppTextFormField(
                  labelText: 'Phone number',
                  controller: cubit.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                verticalSpace(24),
                // Info text
                Text(
                  'When you set up your personal information settings, you should take care to provide accurate information.',
                  style: TextStyles.font13GrayRegular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24),
                // Save button
                BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return AppTextButton(
                      buttonText: isLoading ? 'Saving...' : 'Save',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed:
                          isLoading ? () {} : () => cubit.updateProfile(),
                    );
                  },
                ),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Stack(
          children: [
            Container(
              width: 100.r,
              height: 100.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE8E4F7),
              ),
              child: ClipOval(
                child:
                    _pickedImage != null
                        ? Image.file(_pickedImage!, fit: BoxFit.cover)
                        : (widget.profileData?.image != null &&
                            widget.profileData!.image!.isNotEmpty)
                        ? Image.network(
                          widget.profileData!.image!,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => const Icon(
                                Icons.person,
                                size: 50,
                                color: ColorsManager.gray,
                              ),
                        )
                        : const Icon(
                          Icons.person,
                          size: 50,
                          color: ColorsManager.gray,
                        ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 28.r,
                height: 28.r,
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    selectedGenderNotifier.dispose();
    super.dispose();
  }
}
