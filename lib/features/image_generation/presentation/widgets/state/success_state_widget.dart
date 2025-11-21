import 'package:flutter/material.dart';
import '../../../../../core/shared/widgets/fade_in_animation.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../bloc/image_generation_state.dart';

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({
    super.key,
    required this.state,
  });

  final ImageGenerationSuccess state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 600),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    state.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: theme.colorScheme.error,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Failed to load image',
                              style: AppTextStyles.inter16s400w.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInAnimation(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  'Generated successfully!',
                  style: AppTextStyles.inter18s600w.copyWith(
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Prompt: "${state.prompt}"',
                    style: AppTextStyles.inter14s400w.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
