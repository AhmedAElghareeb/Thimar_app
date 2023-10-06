class ResetPasswordEvents {}

class UserResetPasswordEvent extends ResetPasswordEvents {
  final String phone, pinCode;

  UserResetPasswordEvent({required this.phone, required this.pinCode});
}
