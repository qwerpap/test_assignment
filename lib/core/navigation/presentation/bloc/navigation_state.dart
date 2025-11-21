import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();
}

class NavigationChanged extends NavigationState {
  const NavigationChanged({
    required this.currentIndex,
    required this.currentRoute,
  });

  final int currentIndex;
  final String currentRoute;

  @override
  List<Object> get props => [currentIndex, currentRoute];
}
