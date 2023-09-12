import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppInput extends StatefulWidget {
  AppInput({
    this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    this.obscureText = false,
    this.isPassword = false,
    this.isFilled = false,
    this.isEnabled = true,
    this.labelText,
    this.validator,
  });

  late TextEditingController? controller;
  bool isPhone;
  bool obscureText;
  bool isPassword;
  bool isEnabled;
  bool isFilled;
  late String? labelText;
  late String prefixIcon;
  late TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        icon: widget.isPhone
            ? Container(
                height: 60,
                width: 69,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(
                      0xffF3F3F3,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icons/appInputIcons/saudi.png",
                      width: 32,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "966+",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(
              0xffF3F3F3,
            ),
          ),
        ),
        filled: widget.isFilled,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(
              0xffF3F3F3,
            ),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(
              0xffF3F3F3,
            ),
          ),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            widget.prefixIcon,
            fit: BoxFit.scaleDown,
            height: 20,
            width: 32,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : const SizedBox.shrink(),
      ),
      obscureText: widget.obscureText,
      enabled: widget.isEnabled,
    );
  }
}
