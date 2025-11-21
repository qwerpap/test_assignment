import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/widgets/glass_bottom_navigation.dart';
import '../../data/data_navigation.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final navItems = DataNavigation.getNavItems();
    
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final currentIndex = state is NavigationChanged ? state.currentIndex : 0;
        final currentRoute = state is NavigationChanged ? state.currentRoute : '';

        WidgetsBinding.instance.addPostFrameCallback((_) {
          final location = ModalRoute.of(context)?.settings.name ?? '';
          if (location != currentRoute) {
            context.read<NavigationBloc>().add(UpdateCurrentRoute(location));
          }
        });

        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Container(
              key: ValueKey(currentRoute),
              child: child,
            ),
          ),
          extendBody: true,
          bottomNavigationBar: GlassBottomNavigation(
            items: navItems.map((item) => GlassBottomNavItem(
              icon: item.icon,
              activeIcon: item.activeIcon,
              label: item.label,
            )).toList(),
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<NavigationBloc>().add(NavigateToTab(index));
            },
          ),
        );
      },
    );
  }
}
