import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoreboard/screens/components/AchievementPage.dart';
import 'package:scoreboard/screens/components/PrizePage.dart';


class PrizePoints extends StatefulWidget {
  const PrizePoints({Key? key}) : super(key: key);

  @override
  State<PrizePoints> createState() => _PrizePointsState();
}

class _PrizePointsState extends State<PrizePoints> {
  double x = 0;
  int index = 0;
  PageController controller = PageController();

  void ChangePosition(double a) {
    setState(() {
      x = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  ChangePosition(0.w);
                  setState(() {
                    index = 0;
                  });
                  controller.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  "Prizes",
                  style: index == 0
                      ? GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF3473E4),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800)
                      : GoogleFonts.plusJakartaSans(
                          color: const Color(0xFFADAEB6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  ChangePosition(70.w);
                  setState(() {
                    index = 1;
                  });
                  controller.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Text(
                  "Points",
                  style: index == 1
                      ? GoogleFonts.plusJakartaSans(
                          color: const Color(0xFF3473E4),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800)
                      : GoogleFonts.plusJakartaSans(
                          color: const Color(0xFFADAEB6),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: x),
            child: Container(
              margin: EdgeInsets.zero,
              height: 7.h,
              width: 47.w,
              decoration: BoxDecoration(
                  color: Color(0xFF3473E4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
            ),
          ),
          const Divider(
            endIndent: null,
            height: 1,
            color: Color(0xFF3473E4),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: index == 0 ? 414.h : 1247.h,
            child: PageView(
                onPageChanged: (_) {
                  setState(() {
                    index = _;
                  });
                  if (_ == 0) {
                    ChangePosition(0.w);
                  } else {
                    ChangePosition(70.w);
                  }
                },
                controller: controller,
                children: const [PrizePage(), AchievementsPage()]),
          ),
          SizedBox(
            height: 50.h,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Made with Golden 💛",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636575)),
              )),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
