part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String name;
  final String phone;
  final String email;
  final String budget;
  final String password;
  final String createdAt;
  final String updatedAt;

  Users(
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.budget,
    this.password,
    this.createdAt,
    this.updatedAt,
  );

  @override
  List<Object> get props =>
      [uid, name, phone, email, budget, password, createdAt, updatedAt];
}
