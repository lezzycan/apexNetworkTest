import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/apx_textfield.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40.w,
                        width: 40.w,
                        decoration: BoxDecoration(
                            // color: ApxColors.greyColor[100],
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                width: 1.0,
                                color: ApxColors.containerBorderColor)),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ).apxTouchable(() {
                        Get.back();
                      }),
                      const ApxSpacing.mediumHeight(),
                      Text.rich(
                        TextSpan(
                          text: 'Hey there! tell us a bit \nabout',
                          style: textTheme.titleSmall?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: ApxColors.buttonColor),
                          children: [
                            TextSpan(
                              text: ' yourself',
                              style: textTheme.titleLarge?.copyWith(
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: ApxColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const ApxSpacing.xxLargeHeight(),
                      ApxTextFormFieldWidget(
                        hintText: 'Full name',
                        controller: PersonalScreenController
                            .instance.fullNameController,
                      ),
                      const ApxSpacing.mediumHeight(),
                      ApxTextFormFieldWidget(
                        hintText: 'User name',
                        controller: PersonalScreenController
                            .instance.userNameController,
                      ),
                      const ApxSpacing.mediumHeight(),
                      ApxTextFormFieldWidget(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                setState(() {
                                  PersonalScreenController
                                      .instance
                                      .countryController
                                      .text = country.name;
                                  PersonalScreenController.instance.image =
                                      country.flagEmoji;
                                      PersonalScreenController.instance.countryCode = country.countryCode;
                                  // PersonalScreenController.instance.update();
                                  
                                });
                              });
                        },
                        
                       // enabled: false,
                        redOnly: true,
                        hintText: 'country',
                        prefix: PersonalScreenController.instance.image == null
                            ? const SizedBox.shrink()
                            : Text(
                                '${PersonalScreenController.instance.image}'),
                        controller:
                            PersonalScreenController.instance.countryController,
                        suffixIcon: const Icon(Icons.expand_more),
                      ),
                       const ApxSpacing.mediumHeight(),
                      GetBuilder<PersonalScreenController>(
                        builder: (personalCtrl) => ApxTextFormFieldWidget(
                          hintText: 'Password',
                          obscureText: personalCtrl.showEye,
                          validator: context.validateFieldNotEmpty,
                          maxLines: 1,
                          controller: personalCtrl.passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              personalCtrl.updateEye();
                            },
                            icon: Icon(personalCtrl.showEye
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: ApxColors.greyColor[400],
                          ),
                        ),
                      ),
                     
                      const ApxSpacing.xxLargeHeight(),
                      CustomButton(
                        width: double.infinity,
                        onPressed: () {
                          PersonalScreenController.instance.createAccount(context);
                        },
                        child: Text('Continue',
                            style: textTheme.headlineMedium?.copyWith(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700,
                                color: ApxColors.whiteColor,
                                fontSize: 16.sp)),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
