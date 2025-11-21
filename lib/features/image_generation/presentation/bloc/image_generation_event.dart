import 'package:equatable/equatable.dart';

abstract class ImageGenerationEvent extends Equatable {
  const ImageGenerationEvent();

  @override
  List<Object> get props => [];
}

class GenerateImage extends ImageGenerationEvent {
  const GenerateImage(this.prompt);

  final String prompt;

  @override
  List<Object> get props => [prompt];
}

class RetryGeneration extends ImageGenerationEvent {
  const RetryGeneration();
}

class ResetGeneration extends ImageGenerationEvent {
  const ResetGeneration();
}

class UpdatePromptText extends ImageGenerationEvent {
  const UpdatePromptText(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

class NavigateToResult extends ImageGenerationEvent {
  const NavigateToResult();
}

class NavigateToPrompt extends ImageGenerationEvent {
  const NavigateToPrompt();
}
