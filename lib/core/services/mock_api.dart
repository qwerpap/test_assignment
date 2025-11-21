import 'dart:math';
import 'logger.dart';

class MockApiService {
  const MockApiService();

  static const List<String> _mockImages = [
    'https://picsum.photos/seed/ai1/400/400',
    'https://picsum.photos/seed/ai2/400/400',
    'https://picsum.photos/seed/ai3/400/400',
    'https://picsum.photos/seed/ai4/400/400',
    'https://picsum.photos/seed/ai5/400/400',
  ];

  Future<String> generate(String prompt) async {
    Logger.info('Starting image generation for prompt: "$prompt"');
    
    // Simulate 2-3 seconds delay
    final delay = 2000 + Random().nextInt(1000);
    await Future.delayed(Duration(milliseconds: delay));
    
    // 50% chance of error
    if (Random().nextBool()) {
      Logger.error('Image generation failed for prompt: "$prompt"');
      throw Exception('Failed to generate image. Please try again.');
    }
    
    // Return random mock image
    final imageUrl = _mockImages[Random().nextInt(_mockImages.length)];
    Logger.info('Image generation successful: $imageUrl');
    return imageUrl;
  }
}
