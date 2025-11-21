import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent {
  const LoadSettings();
}

class ToggleNotifications extends SettingsEvent {
  const ToggleNotifications(this.enabled);

  final bool enabled;

  @override
  List<Object> get props => [enabled];
}

class NavigateToLanguage extends SettingsEvent {
  const NavigateToLanguage();
}

class NavigateToAbout extends SettingsEvent {
  const NavigateToAbout();
}
