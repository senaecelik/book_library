part of 'search_book_by_name_cubit.dart';

abstract class SearchBookByNameState {}

final class SearchBookByNameInitial extends SearchBookByNameState {}
final class SearchBookByNameLoading extends SearchBookByNameState {}
final class SearchBookByNameDone extends SearchBookByNameState {
 final List<BookModel> bookList;

  SearchBookByNameDone({required this.bookList});
}
final class SearchBookByNameError extends SearchBookByNameState {
  final String errorMessage;

  SearchBookByNameError({required this.errorMessage});
}

