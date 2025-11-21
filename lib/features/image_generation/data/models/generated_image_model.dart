import '../../domain/entities/generated_image.dart';

class GeneratedImageModel extends GeneratedImage {
  const GeneratedImageModel({
    required super.url,
    required super.prompt,
    required super.createdAt,
  });

  factory GeneratedImageModel.fromJson(Map<String, Object?> json) {
    return GeneratedImageModel(
      url: json['url'] as String,
      prompt: json['prompt'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'url': url,
      'prompt': prompt,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
