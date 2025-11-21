import 'package:equatable/equatable.dart';

class GeneratedImage extends Equatable {
  const GeneratedImage({
    required this.url,
    required this.prompt,
    required this.createdAt,
  });

  final String url;
  final String prompt;
  final DateTime createdAt;

  @override
  List<Object> get props => [url, prompt, createdAt];
}
