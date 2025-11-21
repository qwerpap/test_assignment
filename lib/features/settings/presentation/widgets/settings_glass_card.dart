import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/app_glass_container.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/setting_item_model.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import 'setting_item_card.dart';

class SettingsGlassCard extends StatelessWidget {
  const SettingsGlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppGlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Settings',
            style: AppTextStyles.inter24s600w.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Customize your app experience',
            style: AppTextStyles.inter16s400w.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          
          // Settings List
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is SettingsLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.settingsItems.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final item = state.settingsItems[index];
                    return SettingItemCard(
                      item: item.copyWith(
                        onChanged: item.type == SettingItemType.toggle
                            ? (value) => _handleToggle(context, item.id, value)
                            : null,
                        onTap: item.type == SettingItemType.navigation
                            ? () => _handleNavigation(context, item.id)
                            : null,
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  void _handleToggle(BuildContext context, String id, bool value) {
    switch (id) {
      case 'notifications':
        context.read<SettingsBloc>().add(ToggleNotifications(value));
        break;
    }
  }

  void _handleNavigation(BuildContext context, String id) {
    switch (id) {
      case 'language':
        context.read<SettingsBloc>().add(const NavigateToLanguage());
        break;
      case 'about':
        context.read<SettingsBloc>().add(const NavigateToAbout());
        break;
    }
  }
}
