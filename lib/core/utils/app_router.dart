// ignore_for_file: constant_identifier_names

import 'package:bookly_app/core/utils/Service_locator.dart';
import 'package:bookly_app/features/home/Presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/Presentation/views/book_detailes_view.dart';
import 'package:bookly_app/features/home/Presentation/views/home_view.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementaion.dart';
import 'package:bookly_app/features/search/Presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/Presentation/Views/Splash_View.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
// GoRouter configuration

  static const KHomeView = '/homeView';
  static const KBookDetailesView = '/bookDetailesView';
  static const KSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', //دي نقطه البدايه بتاعته
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: KBookDetailesView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailesView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
