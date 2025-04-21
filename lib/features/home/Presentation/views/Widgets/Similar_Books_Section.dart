import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/Presentation/views/Widgets/Similar_Books-List_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.TextStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListview(),
      ],
    );
  }
}
