import '../entities/generated_image.dart';
import '../repositories/image_generation_repository.dart';

class GenerateImageUseCase {
  const GenerateImageUseCase(this._repository);

  final ImageGenerationRepository _repository;

  Future<GeneratedImage> call(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw Exception('Prompt cannot be empty');
    }
    return await _repository.generateImage(prompt.trim());
  }
}
