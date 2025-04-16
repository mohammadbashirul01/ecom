class UserModel {
  final String uid;
  final String name;
  final String email;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  const UserModel.empty()
      : uid = '',
        name = '',
        email = '';

  bool get isNotEmpty => uid.isNotEmpty;
  bool get isEmpty => uid.isEmpty;
}