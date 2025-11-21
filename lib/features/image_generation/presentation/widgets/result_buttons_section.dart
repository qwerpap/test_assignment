import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/custom_elevated_button.dart';
import '../bloc/image_generation_bloc.dart';
import '../bloc/image_generation_event.dart';
import '../bloc/image_generation_state.dart';

class ResultButtonsSection extends StatelessWidget {
  const ResultButtonsSection({
    super.key,
    required this.state,
  });

  final ImageGenerationState state;

  @override
  Widget build(BuildContext context) {
    if (state is ImageGenerationLoading) {
      return const SizedBox.shrink();
    }

    if (state is ImageGenerationSuccess) {
      return Column(
        children: [
          CustomElevatedButton(
            onPressed: () {
              context.read<ImageGenerationBloc>().add(const RetryGeneration());
            },
            text: 'Try Another',
          ),
          const SizedBox(height: 12),
          CustomElevatedButton(
            onPressed: () {
              context.read<ImageGenerationBloc>().add(const NavigateToPrompt());
            },
            text: 'New Prompt',
          ),
        ],
      );
    }

    if (state is ImageGenerationError) {
      return Column(
        children: [
          CustomElevatedButton(
            onPressed: () {
              context.read<ImageGenerationBloc>().add(const RetryGeneration());
            },
            text: 'Retry',
          ),
          const SizedBox(height: 12),
          CustomElevatedButton(
            onPressed: () {
              context.read<ImageGenerationBloc>().add(const NavigateToPrompt());
            },
            text: 'New Prompt',
          ),
        ],
      );
    }

    return CustomElevatedButton(
      onPressed: () {
        context.read<ImageGenerationBloc>().add(const NavigateToPrompt());
      },
      text: 'Back to Prompt',
    );
  }
}
