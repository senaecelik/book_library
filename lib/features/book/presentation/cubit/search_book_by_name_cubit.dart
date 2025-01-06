import 'package:bloc/bloc.dart';
import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:book_library/features/book/domain/usecases/search_book_by_name.dart';
import 'package:meta/meta.dart';

part 'search_book_by_name_state.dart';

class SearchBookByNameCubit extends Cubit<SearchBookByNameState> {


    final SearchBookByNameUseCase _searchBookByNameUseCase;

  SearchBookByNameCubit(SearchBookByNameUseCase searchBookByNameUseCase) : 
  _searchBookByNameUseCase = searchBookByNameUseCase,
  
  super(SearchBookByNameInitial());



  Future<void> getBookByName({required String query}) async {
    emit(SearchBookByNameLoading());

    final result = await _searchBookByNameUseCase(bookName: query);
    result.fold(
      (failure) => emit(SearchBookByNameError(errorMessage: failure.error.toString())),
      (books) => emit(SearchBookByNameDone(bookList: books.data!))
    );
  }

}
