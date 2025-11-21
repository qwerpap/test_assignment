import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'models/profile_item_model.dart';

class DataProfile {
  static List<ProfileItemModel> getProfileItems() {
    return const [
      ProfileItemModel(
        id: 'email',
        icon: Icons.email_outlined,
        title: AppStrings.emailLabel,
        value: AppStrings.defaultEmail,
      ),
      ProfileItemModel(
        id: 'phone',
        icon: Icons.phone_outlined,
        title: AppStrings.phoneLabel,
        value: AppStrings.defaultPhone,
      ),
      ProfileItemModel(
        id: 'location',
        icon: Icons.location_on_outlined,
        title: AppStrings.locationLabel,
        value: AppStrings.defaultLocation,
      ),
    ];
  }
}
