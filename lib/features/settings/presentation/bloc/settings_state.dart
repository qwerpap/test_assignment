import 'package:equatable/equatable.dart';
import '../../data/models/setting_item_model.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded({
    required this.settingsItems,
    required this.notificationsEnabled,
  });

  final List<SettingItemModel> settingsItems;
  final bool notificationsEnabled;

  @override
  List<Object> get props => [settingsItems, notificationsEnabled];

  SettingsLoaded copyWith({
    List<SettingItemModel>? settingsItems,
    bool? notificationsEnabled,
  }) {
    return SettingsLoaded(
      settingsItems: settingsItems ?? this.settingsItems,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
