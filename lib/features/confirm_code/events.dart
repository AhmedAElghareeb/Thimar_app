class VerifyUserEvents {}

class VerifyCodeEvent extends VerifyUserEvents {
  final bool isActive;
  final String phone, pinCode;

  VerifyCodeEvent({required this.isActive, required this.phone, required this.pinCode});
}

class ResendCodeEvent extends VerifyUserEvents {
  final String phone;

  ResendCodeEvent({required this.phone});
}
