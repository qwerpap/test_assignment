import 'package:equatable/equatable.dart';
import '../../data/models/profile_item_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded({
    required this.profileItems,
    required this.userName,
    required this.userDescription,
  });

  final List<ProfileItemModel> profileItems;
  final String userName;
  final String userDescription;

  @override
  List<Object> get props => [profileItems, userName, userDescription];

  ProfileLoaded copyWith({
    List<ProfileItemModel>? profileItems,
    String? userName,
    String? userDescription,
  }) {
    return ProfileLoaded(
      profileItems: profileItems ?? this.profileItems,
      userName: userName ?? this.userName,
      userDescription: userDescription ?? this.userDescription,
    );
  }
}
