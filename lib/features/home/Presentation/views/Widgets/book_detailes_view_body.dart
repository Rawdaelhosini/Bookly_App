import 'package:bookly_app/features/home/Presentation/views/Widgets/Book_Detailes_Section.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Custom_Book_Detailes_App_Bar.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Similar_Books_Section.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookmodel});
  final BookModel bookmodel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //بيملي المساحه الفاضيه في الcustom
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const CustomBookDetailesAppBar(),
                BookDetailesSection(
                  book: bookmodel,
                ),
                const Expanded(
                  child: const SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
