import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/app_glass_container.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';
import 'profile_item_card.dart';

class ProfileGlassCard extends StatelessWidget {
  const ProfileGlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppGlassContainer(
      padding: const EdgeInsets.all(32),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return Column(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Title
                Text(
                  state.userName,
                  style: AppTextStyles.inter24s600w.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  state.userDescription,
                  style: AppTextStyles.inter16s400w.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                
                // Profile Items List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.profileItems.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return ProfileItemCard(item: state.profileItems[index]);
                  },
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
