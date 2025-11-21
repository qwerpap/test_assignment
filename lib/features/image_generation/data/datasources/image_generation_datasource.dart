import '../../../../core/services/mock_api.dart';
import '../models/generated_image_model.dart';

abstract class ImageGenerationDataSource {
  Future<GeneratedImageModel> generateImage(String prompt);
}

class ImageGenerationDataSourceImpl implements ImageGenerationDataSource {
  const ImageGenerationDataSourceImpl(this._mockApiService);

  final MockApiService _mockApiService;

  @override
  Future<GeneratedImageModel> generateImage(String prompt) async {
    final imageUrl = await _mockApiService.generate(prompt);
    return GeneratedImageModel(
      url: imageUrl,
      prompt: prompt,
      createdAt: DateTime.now(),
    );
  }
}
