import '../entities/generated_image.dart';

abstract class ImageGenerationRepository {
  Future<GeneratedImage> generateImage(String prompt);
}
