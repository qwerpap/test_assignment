import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import 'animated_tap.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isEnabled = true,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final button = ElevatedButton(
      onPressed: (isEnabled && !isLoading) ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled 
            ? colorScheme.primary 
            : colorScheme.primary.withOpacity(0.6),
        disabledBackgroundColor: colorScheme.primary.withOpacity(0.6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: AppTextStyles.inter16s600w.copyWith(
                color: Colors.white,
              ),
            ),
    );

    final wrappedButton = SizedBox(
      width: double.infinity,
      child: button,
    );

    if (isLoading || !isEnabled || onPressed == null) {
      return wrappedButton;
    }

    return AnimatedTap(
      onTap: onPressed!,
      pressedColor: Colors.black.withOpacity(0.15),
      child: wrappedButton,
    );
  }
}
