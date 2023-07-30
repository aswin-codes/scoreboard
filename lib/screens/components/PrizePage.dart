import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Modals/Prize.dart';
import '../../Provider/PrizeProvider.dart';

class PrizePage extends StatelessWidget {
  const PrizePage({super.key});

  List<Widget> makePrizeList(BuildContext context) {
    List<Prize> prizeList = context.read<PrizeProvider>().prizeList;
    List<Widget> list = prizeList
        .map((e) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  e.iconUrl,
                                  height: 25.h,
                                  width: 25.h,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  e.position,
                                  style: GoogleFonts.plusJakartaSans(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Image.asset(
                              e.prizeIconUrl,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        e.prizeType,
                        style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFFADAEB6),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        e.prizeAmount,
                        style: GoogleFonts.plusJakartaSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFDDDDDD),
                    thickness: 1,
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
          "Be the first in your gang to grow up in ranks",
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
              "Rank",
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Prizes",
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Wrap(
          children: makePrizeList(context),
        ),
      ],
    );
  }
}
