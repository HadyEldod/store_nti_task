class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  final String nationalId;

  ProfileModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.profileImage,
      required this.nationalId});

  factory ProfileModel.fromjson(Map<String, dynamic> jsonData) {
    return ProfileModel(
        name: jsonData['name'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        profileImage: jsonData['profileImage'],
        nationalId: jsonData['nationalId']);
  }
}

class UserProfile {
  final ProfileModel profileModel;
  UserProfile({required this.profileModel});
  factory UserProfile.fromjson(Map<String, dynamic> jsonData) {
    return UserProfile(profileModel: ProfileModel.fromjson(jsonData['user']));
  }
}
