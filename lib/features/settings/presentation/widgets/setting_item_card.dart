import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/setting_item_model.dart';

class SettingItemCard extends StatelessWidget {
  const SettingItemCard({
    super.key,
    required this.item,
  });

  final SettingItemModel item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            item.icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: AppTextStyles.inter16s600w.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                item.subtitle,
                style: AppTextStyles.inter14s400w.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        _buildTrailing(context),
      ],
    );
  }

  Widget _buildTrailing(BuildContext context) {
    switch (item.type) {
      case SettingItemType.toggle:
        return Switch(
          value: item.value as bool? ?? false,
          onChanged: item.onChanged,
        );
      case SettingItemType.navigation:
        return const Icon(Icons.chevron_right);
      case SettingItemType.info:
        return const Icon(Icons.chevron_right);
    }
  }
}
