import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Custom_App_Bar.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Featured_Books_List_View.dart';
import 'package:flutter/material.dart';

import 'Best_Seller_List_View.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newset Books',
                    style: Styles.TextStyle18,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // const SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 30),
        //     child: BestSellerListView(),
        //   ),
        // )
        const SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
