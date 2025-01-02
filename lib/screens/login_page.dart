import 'package:flutter/material.dart';
import 'package:show_ticket_app/components/my_button.dart';
import 'package:show_ticket_app/components/my_textfield.dart';
import 'package:show_ticket_app/ui_values.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum BottomSheetType { signIn, signUp, forgetPass, resetPass }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(logoImg),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: MyButton(
                width: size.width * 0.7,
                height: defaultButtonHeight,
                textSize: defaultTextSize,
                text: loginTextUpper,
                onTap: () => showBottomDialog(context, BottomSheetType.signIn),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: MyButton(
                width: size.width * 0.7,
                height: defaultButtonHeight,
                textSize: defaultTextSize,
                text: signUpTextUpper,
                isFilledButton: false,
                onTap: () => showBottomDialog(context, BottomSheetType.signUp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showBottomDialog(BuildContext context, BottomSheetType type) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 1,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: bottomSheetColor,
          ),
          child: [
            if (type == BottomSheetType.signIn)
              showSignInDialog(scrollController),
            if (type == BottomSheetType.signUp)
              showSignUpDialog(scrollController),
            if (type == BottomSheetType.forgetPass)
              showForgetPasswordDialog(context, scrollController),
            if (type == BottomSheetType.resetPass)
              showResetPasswordDialog(context, scrollController)
          ].first,
        ),
      ),
    );
  }

  Widget showSignInDialog(ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                loginTextUpper,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                noAccount,
                style: TextStyle(
                  fontSize: defaultTextSize,
                  color: grayContentColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showBottomDialog(context, BottomSheetType.signUp);
                },
                child: const Text(
                  registerNow,
                  style: TextStyle(
                      fontSize: defaultTextSize,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          MyTextField(label: "Email", textController: emailController),
          const SizedBox(height: defaultPadding),
          MyTextField(
            label: password,
            isPassword: true,
            textController: passwordController,
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              showBottomDialog(context, BottomSheetType.forgetPass);
            },
            child: const Text(
              forgetPassword,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: defaultPadding),
          MyButton(
            onTap: () {},
            width: double.infinity,
            height: 45,
            textSize: 14,
            text: loginTextUpper,
            isFilledButton: true,
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                loginWith,
                style: TextStyle(
                  color: grayContentColor,
                  fontSize: defaultTextSize,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(fbImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(googleImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(appleImg),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showSignUpDialog(ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                signUpTextUpper,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                haveAccount,
                style: TextStyle(
                  fontSize: defaultTextSize,
                  color: grayContentColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showBottomDialog(context, BottomSheetType.signIn);
                },
                child: const Text(
                  loginText,
                  style: TextStyle(
                      fontSize: defaultTextSize,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          MyTextField(label: "Email", textController: emailController),
          const SizedBox(height: defaultPadding),
          MyTextField(
            label: password,
            isPassword: true,
            textController: passwordController,
          ),
          const SizedBox(height: defaultPadding),
          MyTextField(
            label: confirmedPassword,
            isPassword: true,
            textController: confirmedPasswordController,
          ),
          const SizedBox(height: 32.0),
          MyButton(
            onTap: () {},
            width: double.infinity,
            height: 45,
            textSize: 14,
            text: signUpTextUpper,
            isFilledButton: true,
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                loginWith,
                style: TextStyle(
                  color: grayContentColor,
                  fontSize: defaultTextSize,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(fbImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(googleImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(appleImg),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showForgetPasswordDialog(
      BuildContext context, ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                forgetPasswordUpper,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                noAccount,
                style: TextStyle(
                  fontSize: defaultTextSize,
                  color: grayContentColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showBottomDialog(context, BottomSheetType.signUp);
                },
                child: const Text(
                  registerNow,
                  style: TextStyle(
                      fontSize: defaultTextSize,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          MyTextField(label: "Email", textController: emailController),
          const SizedBox(height: defaultPadding),
          MyTextField(
            label: otpText,
            isPassword: false,
            mySuffixIcon: refreshIcon,
            textController: otpController,
          ),
          const SizedBox(height: 32.0),
          MyButton(
            onTap: () {
              Navigator.of(context).pop();
              showBottomDialog(context, BottomSheetType.resetPass);
            },
            width: double.infinity,
            height: 45,
            textSize: 14,
            text: continueText.toUpperCase(),
            isFilledButton: true,
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                loginWith,
                style: TextStyle(
                  color: grayContentColor,
                  fontSize: defaultTextSize,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(fbImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(googleImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(appleImg),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showResetPasswordDialog(
      BuildContext context, ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0,
                bottom: 4.0,
              ),
              child: Text(
                resetPassword,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const MyTextField(label: newPassword),
          const SizedBox(height: defaultPadding),
          const MyTextField(
            label: confirmedPassword,
            isPassword: false,
          ),
          const SizedBox(height: 32.0),
          MyButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            width: double.infinity,
            height: 45,
            textSize: 14,
            text: confirm.toUpperCase(),
            isFilledButton: true,
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                loginWith,
                style: TextStyle(
                  color: grayContentColor,
                  fontSize: defaultTextSize,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: grayContentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(fbImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(googleImg),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(appleImg),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
