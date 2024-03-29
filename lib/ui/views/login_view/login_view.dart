import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_container.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: screenWidth(2.2),
              right: screenWidth(2.2),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: screenWidth(13),
                    ),
                    child: Customtext(
                        text: 'LOG IN',
                        styleType: TextStyleType.SUBTITLE,
                        textColor: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      controller.SignUp();
                    },
                    child: Customtext(
                        text: 'SIGN UP',
                        styleType: TextStyleType.SUBTITLE,
                        textColor: Color.fromRGBO(255, 255, 255, 0.5)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenWidth(1.2),
              left: screenWidth(5),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: screenWidth(1.25),
                        child: CustomTextField(
                          obscureText: false,
                          controller: controller.usernameController,
                          hintText: 'Username',
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter Username";
                              else if (value.length<4)
                              return "Username must be at least 4 characters";
                            else if (!isUsernameValid(value))
                              return "Please enter Valid Username";
                          },
                        )),
                    Obx(
                      () => SizedBox(
                          width: screenWidth(1.25),
                          child: CustomTextField(
                            obscureText: controller.obscureText.value,
                            controller: controller.passwordController,
                            suffixIcon: IconButton(
                              icon: Icon(
                                size: 17,
                                controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                controller.toggleObscureText();
                              },
                            ),
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Please enter password";
                              else if (isComplexPassword(value))
                                return "Please enter valid password";
                              else {
                                controller.passwordError.value =
                                    "Please enter valid password";
                                return null;
                              }
                            },
                          )),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: screenWidth(50),
                        start: screenWidth(2.4),
                      ),
                      child: Obx(() => Row(children: [
                            Checkbox(
                                activeColor: AppColors.skyblueColor,
                                value: controller.isChecked.value,
                                onChanged: (bool? value) {
                                  controller.isChecked.value = value!;
                                }),
                            Customtext(text: 'remember me')
                          ])),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: screenWidth(16),
                          start: screenWidth(20),
                          bottom: screenWidth(15)),
                      child:
                       Obx(() {
                        if (controller.isLoading.value) {
                          customLoader();
                          return SizedBox();
                        } else {
                          BotToast.closeAllLoading();
                          return GestureDetector(
                            onTap: () {
                              controller.Login();
                            },
                            child: Customtext(
                                text: 'LOG IN NOW',
                                styleType: TextStyleType.BODY,
                                textColor: Colors.white),
                          );
                        }
                      }),
                    ),
                    InkWell(
                      onTap: () {
                        controller.LogFacebook();
                      },
                      child: CustomContainerSign(
                        text: 'LOG IN WITH FACEBOOK',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
