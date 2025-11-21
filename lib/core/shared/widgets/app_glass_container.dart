import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class AppGlassContainer extends StatelessWidget {
  const AppGlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.margin,
    this.padding,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  static const _defaultGlassSettings = LiquidGlassSettings(
    thickness: 18,
    blur: 10,
    glassColor: Color(0x25FFFFFF),
    lightIntensity: 1.6,
    ambientStrength: 0.8,
    saturation: 1.3,
    refractiveIndex: 1.4,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 8),
      child: LiquidGlassLayer(
        settings: _defaultGlassSettings,
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: borderRadius),
          child: Container(
            width: double.infinity,
            padding: padding ?? const EdgeInsets.all(24),
            child: child,
          ),
        ),
      ),
    );
  }
}
