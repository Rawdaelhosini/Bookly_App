import 'package:bookly_app/core/Widgets/cusom_error.dart';
import 'package:bookly_app/core/Widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/Presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/Presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Book_List_View_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewsetBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
            // shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    BookListViewItem(
                      bookModel: state.books[index],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            });
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(
          errMessage: state.errMessage,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
