import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(16.r)),
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.26),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Image.asset(
                    "assets/icons/biggear.png",
                    height: 47.h,
                    width: 47.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "How it works",
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 21.h,
                      color: const Color(0xFFC1C1C1),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 27.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 7.h,
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "At the bottom of the page you can access the ",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                        TextSpan(
                            text: "Prizes & Point system",
                            style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFFFC852),
                                fontSize: 12.spMax,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: ".",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                      ])),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 7.h,
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "The points will be given as per the point system and the prizes will be given as per ranks achieved.",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                      ])),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 7.h,
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "You can see several personal & public Awards & Challenges that can be unlocked in “",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                        TextSpan(
                            text: " My Status and Awards ",
                            style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFFFC852),
                                fontSize: 12.spMax,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "” page.",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                      ])),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 7.h,
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Points will be given to unlocked Awards & challenges accepted, & successfully completed.",
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.white, fontSize: 12.spMax)),
                      ])),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
