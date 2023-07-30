import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/Provider/AchievementProvider.dart';

import '../../Modals/Achievements.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  List<Widget> makeList(List<Achievement> datalist) {
    
    List<Widget> list = datalist
        .map((e) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: GoogleFonts.plusJakartaSans(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          e.subtitle != null
                              ? Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: Text(
                                    e.subtitle!,
                                    style: GoogleFonts.plusJakartaSans(
                                        color: const Color(0xFFADAEB6),
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                      Text(
                        e.points.toString(),
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: const Divider(
                      color: Color(0xFFDDDDDD),
                      thickness: 1,
                    ),
                  )
                ],
              ),
            ))
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Earn more points to level up",
          style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFFADAEB6),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 35.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Achievements",
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Points",
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: 35.h,
        ),
        Text(
          "Only Once",
          style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF3473E4),
              fontSize: 13.sp,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          children: makeList(context.read<AchievementProvider>().onceaDay),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "My Network",
          style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF3473E4),
              fontSize: 13.sp,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          children: makeList(context.read<AchievementProvider>().myNetwork),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Once a Day",
          style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF3473E4),
              fontSize: 13.sp,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          children: makeList(context.read<AchievementProvider>().onceaDay),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Unlimited",
          style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF3473E4),
              fontSize: 13.sp,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          children: makeList(context.read<AchievementProvider>().unlimited),
        ),
      ],
    );
  }
}
