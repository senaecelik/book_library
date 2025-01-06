import 'package:bloc/bloc.dart';
import 'package:book_library/features/book/data/model/book_detail_model.dart';
import 'package:book_library/features/book/domain/usecases/search_book_by_isbn.dart';


part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {

  final SearchBookByIsbnUseCase _searchBookByIsbnUseCase;

  SearchBookCubit(SearchBookByIsbnUseCase searchBookByIsbnUseCase) :
  _searchBookByIsbnUseCase=searchBookByIsbnUseCase, 
   super(SearchBookInitial());

Future<void> getBookIsbn({required String query}) async {
    emit(SearchBookLoading());

    final result = await _searchBookByIsbnUseCase(isbn: "=isbn:$query");
    result.fold(
      (failure) => emit(SearchBookError(errorMessage: failure.error.toString())),
      (result) => emit(SearchBookDone(book: result.data!.items!.first.volumeInfo! ))
    );
  }



}
