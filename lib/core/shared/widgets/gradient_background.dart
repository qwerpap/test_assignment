import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        // Background gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF1A1A1A),
                      const Color(0xFF2A2A2A).withOpacity(0.8),
                      const Color(0xFF1A1A1A),
                    ]
                  : [
                      const Color(0xFFF5F5F5),
                      const Color(0xFFE8F4FD),
                      const Color(0xFFF0F8FF),
                    ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
