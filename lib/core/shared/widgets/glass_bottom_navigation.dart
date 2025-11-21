import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import '../../theme/app_colors.dart';

class GlassBottomNavigation extends StatelessWidget {
  const GlassBottomNavigation({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<GlassBottomNavItem> items;
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: safeAreaBottom > 0 ? safeAreaBottom + 10 : 20,
      ),
      child: LiquidGlassLayer(
        settings: LiquidGlassSettings(
          thickness: 18,
          blur: 15,
          glassColor: isDark
              ? const Color(0x20FFFFFF)
              : const Color(0x20FFFFFF),
          lightIntensity: 1.6,
          ambientStrength: 0.8,
          saturation: 1.3,
          refractiveIndex: 1.4,
        ),
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: 25),
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isSelected = currentIndex == index;
                
                return Expanded(
                  child: _AnimatedNavButton(
                    onTap: () => onTap(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSelected ? item.activeIcon : item.icon,
                            color: isSelected 
                                ? AppColors.primaryColor
                                : (isDark ? Colors.white70 : Colors.black54),
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              color: isSelected 
                                  ? AppColors.primaryColor
                                  : (isDark ? Colors.white70 : Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassBottomNavItem {
  const GlassBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}

class _AnimatedNavButton extends StatefulWidget {
  const _AnimatedNavButton({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_AnimatedNavButton> createState() => _AnimatedNavButtonState();
}

class _AnimatedNavButtonState extends State<_AnimatedNavButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
