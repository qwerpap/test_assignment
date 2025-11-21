import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

class UpdateProfile extends ProfileEvent {
  const UpdateProfile({
    required this.userName,
    required this.userDescription,
  });

  final String userName;
  final String userDescription;

  @override
  List<Object> get props => [userName, userDescription];
}
