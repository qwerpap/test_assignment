import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';

class PromptInputSection extends StatelessWidget {
  const PromptInputSection({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Describe what you want to see...',
      maxLines: 4,
      keyboardType: TextInputType.multiline,
    );
  }
}
