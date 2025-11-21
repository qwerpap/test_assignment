import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_elevated_button.dart';

class GenerateButtonSection extends StatelessWidget {
  const GenerateButtonSection({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  final bool isEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      text: 'Generate',
      isEnabled: isEnabled,
    );
  }
}
