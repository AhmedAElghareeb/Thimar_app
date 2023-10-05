import 'package:thimar_app/models/contact_us.dart';

class ContactUsStates {}

class GetContactLoadingState extends ContactUsStates {}

class GetContactFailedState extends ContactUsStates {}

class GetContactSuccessState extends ContactUsStates {
  final ContactModel model;

  GetContactSuccessState({
    required this.model,
  });
}

class SendContactLoadingState extends ContactUsStates {}

class SendContactFailedState extends ContactUsStates {}

class SendContactSuccessState extends ContactUsStates {}
