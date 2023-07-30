import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/Provider/UserProvider.dart';
import 'package:scoreboard/screens/components/DialogBox.dart';
import 'package:scoreboard/screens/components/PrizePoints.dart';

import '../Modals/User.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  bool blur = false;

  List<Padding> makeList() {
    List<User> users = context.read<UserProvider>().users;
    users = users
        .where((element) => element.position > 3 && element.position <= 10)
        .toList();
    List<Padding> list = users
        .map((e) => Padding(
            padding: EdgeInsets.only(bottom: 8.h), child: ScorePlate(user: e)))
        .toList();
    return list;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 20) {
        setState(() {
          blur = true;
        });
      } else {
        setState(
          () => blur = false,
        );
      }
    });
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user2 = context.read<UserProvider>().getUserByPosition(2);
    User user1 = context.read<UserProvider>().getUserByPosition(1);
    User user3 = context.read<UserProvider>().getUserByPosition(3);
    User localUser = context.read<UserProvider>().getUserById(11);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blur ? const Color(0xFF2E2B69) : Colors.transparent,
        title: Text(
          "Leader Board",
          style: GoogleFonts.plusJakartaSans(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: Size(428.w, 42.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
            height: 42.h,
            decoration: BoxDecoration(
                color: const Color(0xFF1E0082),
                borderRadius: BorderRadius.circular(50.r)),
            margin: EdgeInsets.symmetric(horizontal: 30.h),
            child: TabBar(
                unselectedLabelColor: Colors.white.withOpacity(0.80),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'This Week',
                  ),
                  Tab(
                    text: 'This Month',
                  ),
                  Tab(
                    text: 'Last Month',
                  ),
                ]),
          ),
        ),
        actions: [
          Center(
              child: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Align(                        
                        alignment: Alignment.bottomCenter,
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                          child: DialogBox(),
                        ),
                      );
                    });
              },
              child: Row(
                children: [
                  Text(
                    "How it works",
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Image.asset(
                    "assets/icons/gear.png",
                    height: 26.h,
                    width: 26.h,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 500.h,
                            width: 428.w,
                            padding: EdgeInsets.only(
                                top: 120.h, left: 7.w, right: 6.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.r),
                                    bottomRight: Radius.circular(40.r)),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/background_image.png'),
                                    fit: BoxFit.cover)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      user2.position.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFBBB2D9)),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Image.asset(
                                      'assets/icons/green_up.png',
                                      height: 7.h,
                                      width: 9.w,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF4B19C3),
                                            Color(0xFF1F0293),
                                            Color(0xFF1B0290),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(7),
                                      child: ClipOval(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 43,
                                          backgroundImage:
                                              AssetImage(user2.imageURL),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      user2.points.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF99B6FF),
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          user2.name,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        user2.isVerified
                                            ? Image.asset(
                                                "assets/icons/blue_tick.png",
                                                height: 22.h,
                                                width: 22.h,
                                              )
                                            : SizedBox()
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 40),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF2A12CC),
                                                  Color(0xFF1A018B),
                                                ],
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: ClipOval(
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 75,
                                                backgroundImage:
                                                    AssetImage(user1.imageURL),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 75.h,
                                          child: Image.asset(
                                            "assets/icons/crown.png",
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      user1.points.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF99B6FF),
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          user1.name,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        user1.isVerified
                                            ? Image.asset(
                                                "assets/icons/blue_tick.png",
                                                height: 22.h,
                                                width: 22.h,
                                              )
                                            : SizedBox()
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      user3.position.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFBBB2D9)),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Image.asset(
                                      user3.isUp
                                          ? 'assets/icons/green_up.png'
                                          : 'assets/icons/red_down.png',
                                      height: 7.h,
                                      width: 9.w,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF4F5BEC),
                                            Color(0xFF3542DF),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(7),
                                      child: ClipOval(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 43,
                                          backgroundImage:
                                              AssetImage(user2.imageURL),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      user3.points.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                          color: const Color(0xFF99B6FF),
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          user3.name,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        user2.isVerified
                                            ? Image.asset(
                                                user3.isUp
                                                    ? 'assets/icons/green_up.png'
                                                    : 'assets/icons/red_down.png',
                                                height: 22.h,
                                                width: 22.h,
                                              )
                                            : SizedBox()
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 17.w,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            offset: Offset(-4, 0),
                                            spreadRadius: 0,
                                            blurRadius: 8,
                                            color:
                                                Colors.black.withOpacity(0.25)),
                                        BoxShadow(
                                            offset: Offset(4, 4),
                                            spreadRadius: 0,
                                            blurRadius: 8,
                                            color:
                                                Colors.black.withOpacity(0.25))
                                      ]),
                                      child: ScorePlate(user: localUser)),
                                  Container(height: 30.h, color: Colors.amber)
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 113.w,
                                child: GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(
                                        context, '/notdeveloped')
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 161.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1E0082),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        border: Border.all(
                                            color: Colors.white, width: 8),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 4),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                              color: Colors.black
                                                  .withOpacity(0.25))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "My Status & Awards",
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.white,
                                          size: 12,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Wrap(
                    children: makeList(),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  PrizePoints()
                ],
              ),
            ),
          ),
          const Center(
              child: Text(
            "Not Developed",
            style: TextStyle(color: Colors.red),
          )),
          const Center(
              child: Text(
            "Not Developed",
            style: TextStyle(color: Colors.red),
          )),
        ],
      ),
    );
  }
}

class ScorePlate extends StatelessWidget {
  User user;
  ScorePlate({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.h,
      width: 389.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECFF),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.position.toString(),
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.black,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 1.h),
            Image.asset(
              user.isUp
                  ? "assets/icons/green_up.png"
                  : "assets/icons/red_down.png",
              height: 10.h,
              width: 10.h,
            )
          ],
        ),
        SizedBox(
          width: 14.w,
        ),
        user.isVerified
            ? Stack(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 2.h),
                      height: 53.h,
                      width: 69.w,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.asset(
                            user.imageURL,
                            height: 53.h,
                            width: 53.w,
                          ),
                        ),
                      )),
                  Positioned(
                    right: 0,
                    child: Image.asset("assets/icons/blue_tick.png",
                        height: 22.h, width: 22.h, fit: BoxFit.cover),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  user.imageURL,
                  height: 53.h,
                  width: 53.w,
                ),
              ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          user.name,
          style: GoogleFonts.plusJakartaSans(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp),
        ),
        Spacer(),
        Text(
          user.points.toString(),
          style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w300,
              fontSize: 21.sp,
              color: Colors.black),
        )
      ]),
    );
  }
}
