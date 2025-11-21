import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/constants/navigation_paths.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({required GoRouter router})
      : _router = router,
        super(const NavigationInitial()) {
    on<NavigateToTab>(_onNavigateToTab);
    on<UpdateCurrentRoute>(_onUpdateCurrentRoute);
  }

  final GoRouter _router;
  int _currentIndex = 0;
  String _currentRoute = '';

  static const List<String> _routes = [
    NavigationPaths.prompt,
    NavigationPaths.profile,
    NavigationPaths.settings,
    NavigationPaths.add,
  ];

  void _onNavigateToTab(
    NavigateToTab event,
    Emitter<NavigationState> emit,
  ) {
    if (_currentIndex == event.index) return;

    _currentIndex = event.index;
    
    Future.delayed(const Duration(milliseconds: 50), () {
      _router.go(_routes[event.index]);
    });

    emit(NavigationChanged(
      currentIndex: _currentIndex,
      currentRoute: _currentRoute,
    ));
  }

  void _onUpdateCurrentRoute(
    UpdateCurrentRoute event,
    Emitter<NavigationState> emit,
  ) {
    if (_currentRoute == event.route) return;

    _currentRoute = event.route;
    _currentIndex = _getIndexFromRoute(event.route);

    emit(NavigationChanged(
      currentIndex: _currentIndex,
      currentRoute: _currentRoute,
    ));
  }

  int _getIndexFromRoute(String route) {
    if (route.contains('prompt') || route.contains('result')) return 0;
    if (route.contains('profile')) return 1;
    if (route.contains('settings')) return 2;
    if (route.contains('add')) return 3;
    return 0;
  }
}
