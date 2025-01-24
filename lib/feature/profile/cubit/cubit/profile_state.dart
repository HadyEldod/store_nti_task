part of 'profile_cubit.dart';


sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoad extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserProfile  profileData;
  ProfileSuccess({required this.profileData});
}

final class ProfileFail extends ProfileState {}
