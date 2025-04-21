import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // بحدد انا جوا الصفحه دي بعمل ايه لكن مش بحدد بيعمله ازاي

  //بحدد كمان لو في حاله الفشل او النجاح
//  Future<List<BookModel>> fetchBestSellerBooks( ); //كده اول method
  Future<Either<Failure, List<BookModel>>> //l =>failed   R=> success
      fetchNewsetBooks(); //كده اول method

  //لو حصل ايرور هيعمل return to ServerFailure

  Future<Either<Failure, List<BookModel>>> fetchFeatcheredBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
