part of 'my_profile_cubit.dart';

@immutable
abstract class MyProfileState {
  final String? error;
  final UserDetailsModel? userInfo;

 const MyProfileState({this.error,this.userInfo});
}

class MyProfileInitial extends MyProfileState {}
class LoadMyProfileState extends MyProfileState {}
class SuccessMyProfileState extends MyProfileState {
  const SuccessMyProfileState(  final UserDetailsModel? userInfo
  ):super(userInfo: userInfo);
}
class ErrorState extends MyProfileState {
  const ErrorState(String error):super(error: error);
}
