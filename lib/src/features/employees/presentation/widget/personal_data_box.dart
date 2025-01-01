import 'dart:convert';
import 'package:crm_system/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

// Assume these imports exist
import 'package:crm_system/src/utilities/colors.dart';
import 'package:crm_system/src/utilities/image_path.dart';
import 'package:crm_system/src/utilities/text_style.dart';

class UserModel {
  final String name;
  final String position;
  final String gender;
  final String experience;
  final String company;
  final String location;
  final String birthday;
  final String email;
  final String mobileNumber;
  final String skype;

  UserModel({
    required this.name,
    required this.position,
    required this.gender,
    required this.experience,
    required this.company,
    required this.location,
    required this.birthday,
    required this.email,
    required this.mobileNumber,
    required this.skype,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final profile = json['message']['profile'];
    final company = profile['employeecompany'];
    return UserModel(
      name: json['message']['name'] ?? 'No name',
      position: profile['postition'] ??
          'No position', // Typo corrected from JSON: 'postition' to 'position'.
      gender: profile['gender'] ?? 'No gender',
      experience:
          '${profile['level'] ?? 'No'} Level', // Assuming level maps to experience.
      company: company?['companyName'] ?? 'No company',
      location: profile['location'] ?? 'No location',
      birthday: profile['dob'] ?? 'No birthday',
      email: json['message']['email'] ?? 'No email',
      mobileNumber: json['message']['phone'] ?? 'No mobile',
      skype: profile['skype'] ?? 'No skype',
    );
  }
}

class PersonalDataBox extends StatelessWidget {
  const PersonalDataBox({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ApiServices().fetchProfileDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No profile data found.'));
        }

        // Parse the profile data
        UserModel user = UserModel.fromJson(snapshot.data!);

        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(user),
              const Divider(),
              const SizedBox(height: 16),
              _buildMainInfo(user),
              const SizedBox(height: 24),
              _buildContactInfo(user),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 85,
                  height: 85,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    strokeWidth: 3,
                    strokeAlign: 1.5,
                    valueColor: AlwaysStoppedAnimation(AppColors.blue),
                    backgroundColor: AppColors.textGrey1.withOpacity(0.2),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    dp1png,
                    scale: 1.5,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: AppColors.bgWhite),
              child: SvgPicture.asset(editSvg),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(user.name, style: AppTextStyle.boldText(size: 16)),
        const SizedBox(height: 8),
        Text(
          user.position,
          style: AppTextStyle.regularText(size: 14, color: AppColors.textGrey1),
        ),
      ],
    );
  }

  Widget _buildMainInfo(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerText(label: 'Main Info'),
        _subText(label: 'Gender'),
        textDisply(label: user.gender),
        _subText(label: 'Experience'),
        textDisply(label: user.experience),
        _subText(label: 'Company'),
        textDisply(label: user.company),
        _subText(label: 'Location'),
        textDisply(label: user.location),
        _subText(label: 'Birthday Date'),
        textDisply(label: user.birthday),
      ],
    );
  }

  Widget _buildContactInfo(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerText(label: 'Contact Info'),
        _subText(label: 'Email'),
        textDisply(label: user.email),
        _subText(label: 'Mobile Number'),
        textDisply(label: user.mobileNumber),
        _subText(label: 'Skype'),
        textDisply(label: user.skype),
      ],
    );
  }

  Padding _headerText({required String label}) => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 18),
        ),
      );

  Padding _subText({required String label}) => Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 6),
        child: Text(
          label,
          style: AppTextStyle.boldText(size: 14, color: AppColors.textGrey1),
        ),
      );

  Widget textDisply({required String label}) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        color: AppColors.white,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            label,
            style:
                AppTextStyle.mediumText(size: 14, color: AppColors.textGrey1),
          ),
        ),
      ),
    );
  }
}
