import 'package:bookly_app/features/home/Presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/book_detailes_view_body.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailesView extends StatefulWidget {
  const BookDetailesView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailesView> createState() => _BookDetailesViewState();
}

class _BookDetailesViewState extends State<BookDetailesView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailesViewBody(
        bookmodel: widget.bookModel,
      )),
    );
  }
}
