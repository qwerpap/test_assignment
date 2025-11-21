import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../features/image_generation/presentation/view/prompt_screen.dart';
import '../../../../features/image_generation/presentation/view/result_screen.dart';
import '../../../../features/profile/presentation/view/profile_screen.dart';
import '../../../../features/settings/presentation/view/settings_screen.dart';
import '../../data/constants/navigation_paths.dart';
import 'main_scaffold.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: NavigationPaths.prompt,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: NavigationPaths.prompt,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const PromptScreen(),
            ),
          ),
          GoRoute(
            path: NavigationPaths.result,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const ResultScreen(),
            ),
          ),
          GoRoute(
            path: NavigationPaths.profile,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
          GoRoute(
            path: NavigationPaths.settings,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const SettingsScreen(),
            ),
          ),
          GoRoute(
            path: NavigationPaths.add,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const PromptScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
