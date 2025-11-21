import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.onChanged,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: colorScheme.surface,
        labelStyle: AppTextStyles.inter14s400w.copyWith(
          color: colorScheme.onSurface.withOpacity(0.6),
        ),
        hintStyle: AppTextStyles.inter14s400w.copyWith(
          color: colorScheme.onSurface.withOpacity(0.4),
        ),
      ),
      style: AppTextStyles.inter14s400w.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
