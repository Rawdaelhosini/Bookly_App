import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/Service_locator.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/Presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/Presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementaion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(  //مش احس استخدام وفيها عيوب كتير جدا
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: kPrimaryColor,
    //     textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    //   ),
    //   home: const SplashView(),
    // );

    return MultiBlocProvider(
      // عشان يقفل الصفحه بعد اما اخلصها شيهه صفحه البحث
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchNewestBooks())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
