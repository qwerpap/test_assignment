import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavItemModel extends Equatable {
  const NavItemModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;

  @override
  List<Object> get props => [icon, activeIcon, label];
}
