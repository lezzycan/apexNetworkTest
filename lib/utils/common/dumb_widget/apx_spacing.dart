import 'package:apex/utils/constants/apx_dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApxSpacing extends StatelessWidget {
  const ApxSpacing({super.key})
      : height = ApxDimensions.zero,
        width = ApxDimensions.zero;
  const ApxSpacing.xxxLargeWidth({Key? key})
      : this.width(ApxDimensions.xxxLarge, key: key);

  const ApxSpacing.xxLargeWidth({Key? key})
      : this.width(ApxDimensions.xxLarge, key: key);

  const ApxSpacing.xLargeWidth({Key? key})
      : this.width(ApxDimensions.xLarge, key: key);

  const ApxSpacing.largeWidth({Key? key})
      : this.width(ApxDimensions.large, key: key);

  const ApxSpacing.bigWidth({Key? key})
      : this.width(ApxDimensions.big, key: key);

  const ApxSpacing.mediumWidth({Key? key})
      : this.width(ApxDimensions.medium, key: key);

  const ApxSpacing.smallWidth({Key? key})
      : this.width(ApxDimensions.small, key: key);

  const ApxSpacing.xxxSmallWidth({Key? key})
      : this.width(ApxDimensions.xxxSmall, key: key);

  const ApxSpacing.xxSmallWidth({Key? key})
      : this.width(ApxDimensions.xxSmall, key: key);

  const ApxSpacing.xSmallWidth({Key? key})
      : this.width(ApxDimensions.xSmall, key: key);

  const ApxSpacing.tinyWidth({Key? key})
      : this.width(ApxDimensions.tiny, key: key);
  const ApxSpacing.xxxLargeHeight({Key? key})
      : this.height(ApxDimensions.xxxLarge, key: key);

  const ApxSpacing.xxLargeHeight({Key? key})
      : this.height(ApxDimensions.xxLarge, key: key);

  const ApxSpacing.xLargeHeight({Key? key})
      : this.height(ApxDimensions.xLarge, key: key);

  const ApxSpacing.largeHeight({Key? key})
      : this.height(ApxDimensions.large, key: key);

  const ApxSpacing.bigHeight({Key? key})
      : this.height(ApxDimensions.big, key: key);

  const ApxSpacing.mediumHeight({Key? key})
      : this.height(ApxDimensions.medium, key: key);

  const ApxSpacing.smallHeight({Key? key})
      : this.height(ApxDimensions.small, key: key);

  const ApxSpacing.xSmallHeight({Key? key})
      : this.height(ApxDimensions.xSmall, key: key);

  const ApxSpacing.xxSmallHeight({Key? key})
      : this.height(ApxDimensions.xxSmall, key: key);

  const ApxSpacing.xxxSmallHeight({Key? key})
      : this.height(ApxDimensions.xxxSmall, key: key);

  const ApxSpacing.tinyHeight({Key? key})
      : this.height(ApxDimensions.tiny, key: key);

  const ApxSpacing.width(this.width, {super.key}) : height = ApxDimensions.zero;

  const ApxSpacing.height(this.height, {super.key})
      : width = ApxDimensions.zero;

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(key: super.key, height: height.h ,width: width.w,);
  }
}
