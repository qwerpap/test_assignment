import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/gradient_background.dart';
import '../bloc/image_generation_bloc.dart';
import '../bloc/image_generation_event.dart';
import '../bloc/image_generation_state.dart';
import '../widgets/generate_button_section.dart';
import '../widgets/prompt_input_section.dart';
import '../widgets/prompt_title_card.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _promptController.addListener(() {
      context.read<ImageGenerationBloc>().add(
        UpdatePromptText(_promptController.text),
      );
    });
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Generator'),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 100.0),
            child: BlocConsumer<ImageGenerationBloc, ImageGenerationState>(
              listener: (context, state) {
                // Update controller text when state changes (e.g., returning from result screen)
                String currentPrompt = '';
                if (state is ImageGenerationSuccess) {
                  currentPrompt = state.prompt;
                } else if (state is ImageGenerationError) {
                  currentPrompt = state.prompt;
                } else if (state is ImageGenerationInitial) {
                  currentPrompt = state.currentPrompt;
                }
                
                if (_promptController.text != currentPrompt) {
                  _promptController.text = currentPrompt;
                }
              },
              builder: (context, state) {
                bool isButtonEnabled = false;
                if (state is ImageGenerationInitial) {
                  isButtonEnabled = state.isButtonEnabled;
                } else if (state is ImageGenerationSuccess) {
                  isButtonEnabled = state.isButtonEnabled;
                } else if (state is ImageGenerationError) {
                  isButtonEnabled = state.isButtonEnabled;
                }
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    
                    // Title
                    const PromptTitleCard(),
                    
                    const SizedBox(height: 32),
                    
                    // Input field
                    PromptInputSection(controller: _promptController),
                    
                    const SizedBox(height: 24),
                    
                    // Generate button
                    GenerateButtonSection(
                      isEnabled: isButtonEnabled,
                      onPressed: () {
                        context.read<ImageGenerationBloc>().add(
                          GenerateImage(_promptController.text.trim()),
                        );
                      },
                    ),
                    
                    const Spacer(flex: 2),
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
