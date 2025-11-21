import '../../domain/entities/generated_image.dart';
import '../../domain/repositories/image_generation_repository.dart';
import '../datasources/image_generation_datasource.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  const ImageGenerationRepositoryImpl(this._dataSource);

  final ImageGenerationDataSource _dataSource;

  @override
  Future<GeneratedImage> generateImage(String prompt) async {
    return await _dataSource.generateImage(prompt);
  }
}
