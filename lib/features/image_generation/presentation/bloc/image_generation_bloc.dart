import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/data/constants/navigation_paths.dart';
import '../../../../core/services/logger.dart';
import '../../domain/usecases/generate_image_usecase.dart';
import 'image_generation_event.dart';
import 'image_generation_state.dart';

class ImageGenerationBloc extends Bloc<ImageGenerationEvent, ImageGenerationState> {
  ImageGenerationBloc({
    required GenerateImageUseCase generateImageUseCase,
    required GoRouter router,
  })  : _generateImageUseCase = generateImageUseCase,
        _router = router,
        super(const ImageGenerationInitial()) {
    on<GenerateImage>(_onGenerateImage);
    on<RetryGeneration>(_onRetryGeneration);
    on<ResetGeneration>(_onResetGeneration);
    on<UpdatePromptText>(_onUpdatePromptText);
    on<NavigateToResult>(_onNavigateToResult);
    on<NavigateToPrompt>(_onNavigateToPrompt);
  }

  final GenerateImageUseCase _generateImageUseCase;
  final GoRouter _router;

  String? _lastPrompt;

  Future<void> _onGenerateImage(
    GenerateImage event,
    Emitter<ImageGenerationState> emit,
  ) async {
    _lastPrompt = event.prompt;
    emit(ImageGenerationLoading(event.prompt));

    // Auto-navigate to result screen
    add(const NavigateToResult());

    try {
      final generatedImage = await _generateImageUseCase(event.prompt);
      emit(ImageGenerationSuccess(
        imageUrl: generatedImage.url,
        prompt: generatedImage.prompt,
      ));
    } catch (e) {
      Logger.error('Image generation failed', e);
      emit(ImageGenerationError(
        message: e.toString().replaceAll('Exception: ', ''),
        prompt: event.prompt,
      ));
    }
  }

  Future<void> _onRetryGeneration(
    RetryGeneration event,
    Emitter<ImageGenerationState> emit,
  ) async {
    if (_lastPrompt != null) {
      add(GenerateImage(_lastPrompt!));
    }
  }

  void _onResetGeneration(
    ResetGeneration event,
    Emitter<ImageGenerationState> emit,
  ) {
    emit(const ImageGenerationInitial());
  }

  void _onUpdatePromptText(
    UpdatePromptText event,
    Emitter<ImageGenerationState> emit,
  ) {
    final currentState = state;
    
    if (currentState is ImageGenerationInitial) {
      emit(ImageGenerationInitial(currentPrompt: event.text));
    } else if (currentState is ImageGenerationSuccess) {
      // Keep the success state but update the prompt for future use
      _lastPrompt = event.text;
    } else if (currentState is ImageGenerationError) {
      // Keep the error state but update the prompt for future use
      _lastPrompt = event.text;
    }
  }

  void _onNavigateToResult(
    NavigateToResult event,
    Emitter<ImageGenerationState> emit,
  ) {
    _router.push(NavigationPaths.result);
  }

  void _onNavigateToPrompt(
    NavigateToPrompt event,
    Emitter<ImageGenerationState> emit,
  ) {
    _router.go(NavigationPaths.prompt);
  }
}
