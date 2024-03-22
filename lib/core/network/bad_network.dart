import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class BadNetwork extends StatelessWidget {
  const BadNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(
                height: 10.h,
              ),
              Icon(Icons.warning,color:  ApxColors.errorColor,size: 50.w,),
              Text(
                "No Internet Connection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ApxColors.primaryColor,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                "Please check your connection and try again,"
                    ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ApxColors.primaryColor,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 0, right: 0.0, top: 15.0, bottom: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ApxColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: ApxColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}