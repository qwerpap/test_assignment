import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/gradient_background.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../widgets/settings_glass_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(const LoadSettings()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 100.0),
              child: Column(
                children: [
                  const Spacer(),
                  const SettingsGlassCard(),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
