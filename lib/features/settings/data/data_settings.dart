import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'models/setting_item_model.dart';

class DataSettings {
  static List<SettingItemModel> getSettingsItems() {
    return [
      const SettingItemModel(
        id: 'notifications',
        icon: Icons.notifications_outlined,
        title: AppStrings.notificationsTitle,
        subtitle: AppStrings.notificationsSubtitle,
        type: SettingItemType.toggle,
        value: true,
      ),
      const SettingItemModel(
        id: 'language',
        icon: Icons.language_outlined,
        title: AppStrings.languageTitle,
        subtitle: AppStrings.languageSubtitle,
        type: SettingItemType.navigation,
      ),
      const SettingItemModel(
        id: 'about',
        icon: Icons.info_outline,
        title: AppStrings.aboutTitle,
        subtitle: AppStrings.aboutSubtitle,
        type: SettingItemType.navigation,
      ),
    ];
  }
}
