import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/app_glass_container.dart';
import '../bloc/image_generation_state.dart';
import 'state/error_state_widget.dart';
import 'state/initial_state_widget.dart';
import 'state/loading_state_widget.dart';
import 'state/success_state_widget.dart';

class ResultContentSection extends StatelessWidget {
  const ResultContentSection({
    super.key,
    required this.state,
  });

  final ImageGenerationState state;

  @override
  Widget build(BuildContext context) {
    return AppGlassContainer(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state is ImageGenerationLoading) ...[
              Expanded(child: LoadingStateWidget(state: state as ImageGenerationLoading)),
            ] else if (state is ImageGenerationSuccess) ...[
              Expanded(child: SuccessStateWidget(state: state as ImageGenerationSuccess)),
            ] else if (state is ImageGenerationError) ...[
              Expanded(child: ErrorStateWidget(state: state as ImageGenerationError)),
            ] else ...[
              const Expanded(child: InitialStateWidget()),
            ],
          ],
        ),
      ),
    );
  }
}
