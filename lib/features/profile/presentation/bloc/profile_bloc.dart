import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/logger.dart';
import '../../data/data_profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  String _userName = 'User Profile';
  String _userDescription = 'Welcome to your profile page';

  void _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) {
    try {
      final profileItems = DataProfile.getProfileItems();

      emit(ProfileLoaded(
        profileItems: profileItems,
        userName: _userName,
        userDescription: _userDescription,
      ));
    } catch (e) {
      Logger.error('Failed to load profile', e);
      emit(const ProfileInitial());
    }
  }

  void _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) {
    _userName = event.userName;
    _userDescription = event.userDescription;
    
    Logger.info('Profile updated: ${event.userName}');
    
    // Reload profile with new data
    add(const LoadProfile());
  }
}
