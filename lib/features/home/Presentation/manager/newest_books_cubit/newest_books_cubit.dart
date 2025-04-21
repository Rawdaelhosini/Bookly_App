import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/Presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

class NewestBooksCubit extends Cubit<NewsetBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
