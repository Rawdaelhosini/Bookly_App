import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();
  List<Object> get props => [];
}

class NewestBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}

class NewestBooksSuccess extends NewsetBooksState {
  //لو هعرض الالبيانات جوا list هحطها هنا
// لو لا هعرضها في الcubit
  final List<BookModel> books;

  const NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewsetBooksState {
  final String errMessage;

  const NewestBooksFailure(this.errMessage);
}
