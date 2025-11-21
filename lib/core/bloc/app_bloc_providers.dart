import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../di/dependency_injection.dart';
import '../navigation/presentation/bloc/navigation_bloc.dart';
import '../../features/image_generation/presentation/bloc/image_generation_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({
    super.key, 
    required this.child,
    required this.router,
  });

  final Widget child;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    DependencyInjection.setRouter(router);
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageGenerationBloc>(
          create: (context) => DependencyInjection.imageGenerationBloc,
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(router: router),
        ),
      ],
      child: child,
    );
  }
}
