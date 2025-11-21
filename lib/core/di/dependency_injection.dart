import 'package:go_router/go_router.dart';
import '../services/mock_api.dart';
import '../../features/image_generation/data/datasources/image_generation_datasource.dart';
import '../../features/image_generation/data/repositories/image_generation_repository_impl.dart';
import '../../features/image_generation/domain/repositories/image_generation_repository.dart';
import '../../features/image_generation/domain/usecases/generate_image_usecase.dart';
import '../../features/image_generation/presentation/bloc/image_generation_bloc.dart';

class DependencyInjection {
  DependencyInjection._();

  static MockApiService? _mockApiService;
  static ImageGenerationDataSource? _imageGenerationDataSource;
  static ImageGenerationRepository? _imageGenerationRepository;
  static GenerateImageUseCase? _generateImageUseCase;
  static ImageGenerationBloc? _imageGenerationBloc;
  static GoRouter? _router;

  static MockApiService get mockApiService {
    _mockApiService ??= MockApiService();
    return _mockApiService!;
  }

  static ImageGenerationDataSource get imageGenerationDataSource {
    _imageGenerationDataSource ??= ImageGenerationDataSourceImpl(mockApiService);
    return _imageGenerationDataSource!;
  }

  static ImageGenerationRepository get imageGenerationRepository {
    _imageGenerationRepository ??= ImageGenerationRepositoryImpl(imageGenerationDataSource);
    return _imageGenerationRepository!;
  }

  static GenerateImageUseCase get generateImageUseCase {
    _generateImageUseCase ??= GenerateImageUseCase(imageGenerationRepository);
    return _generateImageUseCase!;
  }

  static void setRouter(GoRouter router) {
    _router = router;
  }

  static ImageGenerationBloc get imageGenerationBloc {
    if (_router == null) {
      throw Exception('Router must be set before accessing ImageGenerationBloc');
    }
    _imageGenerationBloc ??= ImageGenerationBloc(
      generateImageUseCase: generateImageUseCase,
      router: _router!,
    );
    return _imageGenerationBloc!;
  }
}
