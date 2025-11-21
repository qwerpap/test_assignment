import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/logger.dart';
import '../../data/data_settings.dart';
import '../../data/models/setting_item_model.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ToggleNotifications>(_onToggleNotifications);
    on<NavigateToLanguage>(_onNavigateToLanguage);
    on<NavigateToAbout>(_onNavigateToAbout);
  }

  bool _notificationsEnabled = true;

  void _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) {
    try {
      final baseItems = DataSettings.getSettingsItems();
      final updatedItems = baseItems.map((item) {
        if (item.id == 'notifications') {
          return item.copyWith(value: _notificationsEnabled);
        }
        return item;
      }).toList();

      emit(SettingsLoaded(
        settingsItems: updatedItems,
        notificationsEnabled: _notificationsEnabled,
      ));
    } catch (e) {
      Logger.error('Failed to load settings', e);
      emit(const SettingsInitial());
    }
  }

  void _onToggleNotifications(
    ToggleNotifications event,
    Emitter<SettingsState> emit,
  ) {
    _notificationsEnabled = event.enabled;
    Logger.info('Notifications ${event.enabled ? 'enabled' : 'disabled'}');
    
    // Reload settings with new value
    add(const LoadSettings());
  }

  void _onNavigateToLanguage(
    NavigateToLanguage event,
    Emitter<SettingsState> emit,
  ) {
    Logger.info('Navigate to language settings');
    // TODO: Implement navigation to language settings
  }

  void _onNavigateToAbout(
    NavigateToAbout event,
    Emitter<SettingsState> emit,
  ) {
    Logger.info('Navigate to about page');
    // TODO: Implement navigation to about page
  }
}
