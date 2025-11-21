import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileItemModel extends Equatable {
  const ProfileItemModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.value,
  });

  final String id;
  final IconData icon;
  final String title;
  final String value;

  @override
  List<Object> get props => [id, icon, title, value];
}
