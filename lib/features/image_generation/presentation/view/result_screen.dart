import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/gradient_background.dart';
import '../bloc/image_generation_bloc.dart';
import '../bloc/image_generation_event.dart';
import '../bloc/image_generation_state.dart';
import '../widgets/result_buttons_section.dart';
import '../widgets/result_content_section.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ImageGenerationBloc>().add(const NavigateToPrompt());
          },
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 100.0),
            child: BlocBuilder<ImageGenerationBloc, ImageGenerationState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ResultContentSection(
                        state: state,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ResultButtonsSection(state: state),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
