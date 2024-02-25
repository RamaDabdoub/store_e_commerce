
import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_container.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';
import 'package:empty_code/ui/views/sign_view/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
 SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/pngs/main_background.png',
                // width: size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: screenWidth(2.2),
                right:screenWidth(2.2),
                child:
                 Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: screenWidth(13),
                    ),
                    child: InkWell(
                       onTap: () {
                      controller.Login();
                    },
                      child: Customtext(
                          text: 'LOG IN',
                          styleType: TextStyleType.SUBTITLE,
                          textColor:  Color.fromRGBO(255, 255, 255, 0.5)),
                    ),
                  ),
                  Customtext(
                      text: 'SIGN UP',
                      styleType: TextStyleType.SUBTITLE,
                      textColor:AppColors.whiteColor),
                ],
              ),
              ),
              Positioned(
                 top: screenWidth(1.2),
              left: screenWidth(5),
                child: Form(
                  key:controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth(1.25),
                        child: CustomTextField(
                          obscureText: false,
                           hintText: 'Username',
                           controller: controller.usernameController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter Username";
                            else if (!isUsernameValid(value))
                              return "Please enter Valid Username";
                          },
                        ),
                      ),
                      Obx(()=>
                      SizedBox(
                          width: screenWidth(1.25),
                          child: CustomTextField(
                            obscureText: controller.obscureText.value,
                            controller: controller.passwordController,
                             suffixIcon: IconButton(
                                icon: Icon(
                                  size:17,
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
                     
                          
                    
                     Obx(()=>
                      SizedBox(
                          width: screenWidth(1.25),
                          child: CustomTextField(
                            obscureText: controller.obscureText.value,
                            controller: controller.passwordController,
                             suffixIcon: IconButton(
                                icon: Icon(
                                  size:17,
                                  controller.obscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controller.toggleObscureText();
                                },
                              ),
                            hintText: 'Confirm Password',
                           
                            validator: (value) {
                                //   if (value!.isEmpty)
                                // return "Please enter password";
                            if (value != controller.passwordController.text)
                              return 'Passwords not matched';
                          },
                            
                          )),
                    ),
                          
                       
                      Padding(
                padding: EdgeInsetsDirectional.only(
                  top: screenWidth(16),
                  start: screenWidth(20),
                  bottom: screenWidth(15),
                ),
                child: Obx(() {
                  
                    if (controller.isLoading.value) {
                          customLoader();
                          return SizedBox();
                        } else {
                          BotToast.closeAllLoading();
                          return GestureDetector(
                            onTap: () {
                              controller.SignUp();
                            },
                      child: Customtext(
                        text: 'SIGN UP NOW',
                        styleType: TextStyleType.BODY,
                        textColor: AppColors.whiteColor,
                      ),
                    );
                  
                }
   } )
   ),
                      InkWell(
                        onTap: () {
                          controller.SignFacebook();
                        },
                        child: CustomContainerSign(
                          text: 'SIGN UP IN WITH FACEBOOK',
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
