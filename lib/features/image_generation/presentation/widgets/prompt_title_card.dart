import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/app_glass_container.dart';
import '../../../../core/theme/app_text_styles.dart';

class PromptTitleCard extends StatelessWidget {
  const PromptTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppGlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Image Generator',
            style: AppTextStyles.inter24s600w.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Describe what you want to see and let AI create it for you',
            style: AppTextStyles.inter16s400w.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}