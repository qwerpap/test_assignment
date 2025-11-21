import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/gradient_background.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../widgets/profile_glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: GradientBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 100.0),
              child: Column(
                children: [
                  const Spacer(),
                  const ProfileGlassCard(),
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
