import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/Provider/AchievementProvider.dart';
import 'package:scoreboard/Provider/PrizeProvider.dart';
import 'package:scoreboard/Provider/UserProvider.dart';
import 'package:scoreboard/screens/Undeveloped.dart';
import 'package:scoreboard/screens/leaderboard.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider<UserProvider>(create:(_) => UserProvider()),
    ChangeNotifierProvider<PrizeProvider>(create: (_) => PrizeProvider()),
    ChangeNotifierProvider<AchievementProvider>(create: (_) => AchievementProvider())
  ],
  child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Score Board',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: '/leaderboard',
          routes: {
            '/leaderboard' : (context) => const LeaderBoard(),
            '/notdeveloped': (context) => const Undeveloped()
          },
        );
      }
    );
  }
}