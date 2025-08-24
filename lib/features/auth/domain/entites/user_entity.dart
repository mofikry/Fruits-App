class UserEntity {
  final String email;
  final String displayName;
  final String id;

  UserEntity(
      {required this.email, required this.displayName, required this.id});

  UserEntity copyWith({String? email, String? name, String? id}) {
    return UserEntity(
      email: email ?? this.email,
      displayName: name ?? this.displayName,
      id: id ?? this.id,
    );
  }
}
