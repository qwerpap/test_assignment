import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToTab extends NavigationEvent {
  const NavigateToTab(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class UpdateCurrentRoute extends NavigationEvent {
  const UpdateCurrentRoute(this.route);

  final String route;

  @override
  List<Object> get props => [route];
}
