import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingItemModel extends Equatable {
  const SettingItemModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.type,
    this.value,
    this.onTap,
    this.onChanged,
  });

  final String id;
  final IconData icon;
  final String title;
  final String subtitle;
  final SettingItemType type;
  final Object? value;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onChanged;

  @override
  List<Object?> get props => [id, icon, title, subtitle, type, value];
}

enum SettingItemType {
  toggle,
  navigation,
  info,
}

extension SettingItemModelExtension on SettingItemModel {
  SettingItemModel copyWith({
    String? id,
    IconData? icon,
    String? title,
    String? subtitle,
    SettingItemType? type,
    Object? value,
    VoidCallback? onTap,
    ValueChanged<bool>? onChanged,
  }) {
    return SettingItemModel(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      value: value ?? this.value,
      onTap: onTap ?? this.onTap,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}
