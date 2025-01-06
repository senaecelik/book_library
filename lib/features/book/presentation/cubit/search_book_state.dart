part of 'search_book_cubit.dart';

abstract class SearchBookState {}

final class SearchBookInitial extends SearchBookState {}
final class SearchBookLoading extends SearchBookState {}
final class SearchBookDone extends SearchBookState {
final  BookModelDetail book;

  SearchBookDone({required this.book});
}
final class SearchBookError extends SearchBookState {
  final String errorMessage;

  SearchBookError({required this.errorMessage});
}

