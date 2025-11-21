import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import 'models/nav_item_model.dart';

class DataNavigation {
  static List<NavItemModel> getNavItems() {
    return const [
      NavItemModel(
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: AppStrings.homeLabel,
      ),
      NavItemModel(
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        label: AppStrings.profileLabel,
      ),
      NavItemModel(
        icon: Icons.settings_outlined,
        activeIcon: Icons.settings,
        label: AppStrings.settingsLabel,
      ),
      NavItemModel(
        icon: Icons.add_circle_outline,
        activeIcon: Icons.add_circle,
        label: AppStrings.addLabel,
      ),
    ];
  }
}
