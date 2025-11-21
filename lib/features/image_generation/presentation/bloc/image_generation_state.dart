import 'package:equatable/equatable.dart';

abstract class ImageGenerationState extends Equatable {
  const ImageGenerationState();

  @override
  List<Object?> get props => [];
}

// UI State mixin for prompt management
mixin PromptStateMixin {
  String get currentPrompt;
  bool get isButtonEnabled;
}

class ImageGenerationInitial extends ImageGenerationState with PromptStateMixin {
  const ImageGenerationInitial({
    this.currentPrompt = '',
  });

  @override
  final String currentPrompt;

  @override
  bool get isButtonEnabled => currentPrompt.trim().isNotEmpty;

  @override
  List<Object> get props => [currentPrompt];
}

class ImageGenerationLoading extends ImageGenerationState with PromptStateMixin {
  const ImageGenerationLoading(this.prompt);

  final String prompt;

  @override
  String get currentPrompt => prompt;

  @override
  bool get isButtonEnabled => false; // Disabled during loading

  @override
  List<Object> get props => [prompt];
}

class ImageGenerationSuccess extends ImageGenerationState with PromptStateMixin {
  const ImageGenerationSuccess({
    required this.imageUrl,
    required this.prompt,
  });

  final String imageUrl;
  final String prompt;

  @override
  String get currentPrompt => prompt;

  @override
  bool get isButtonEnabled => prompt.trim().isNotEmpty;

  @override
  List<Object> get props => [imageUrl, prompt];
}

class ImageGenerationError extends ImageGenerationState with PromptStateMixin {
  const ImageGenerationError({
    required this.message,
    required this.prompt,
  });

  final String message;
  final String prompt;

  @override
  String get currentPrompt => prompt;

  @override
  bool get isButtonEnabled => prompt.trim().isNotEmpty;

  @override
  List<Object> get props => [message, prompt];
}
