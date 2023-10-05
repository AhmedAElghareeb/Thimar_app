class VerifyUserEvents {}

class VerifyCodeEvent extends VerifyUserEvents {
  final bool isActive;
  final String phone;

  VerifyCodeEvent({required this.isActive, required this.phone});
}

class ResendCodeEvent extends VerifyUserEvents {
  final String phone;

  ResendCodeEvent({required this.phone});
}
