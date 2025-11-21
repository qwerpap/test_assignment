import 'package:flutter/material.dart';
import 'core/bloc/app_bloc_providers.dart';
import 'core/navigation/presentation/widgets/app_router.dart';
import 'core/services/logger.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const MyApp());
}

Future<void> _initApp() async {
  Logger.enable();
  Logger.info('Application initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;
    
    return AppBlocProviders(
      router: router,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'AI Image Generator',
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}
