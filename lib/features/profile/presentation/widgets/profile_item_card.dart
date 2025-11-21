import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/profile_item_model.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    super.key,
    required this.item,
  });

  final ProfileItemModel item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Icon(
          item.icon,
          color: theme.colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppTextStyles.inter12s400w.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            Text(
              item.value,
              style: AppTextStyles.inter14s400w.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
