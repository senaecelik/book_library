


import 'package:book_library/core/error/data_state.dart';
import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:book_library/features/book/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchBookByIsbnUseCase{
  final BookRepository repository;

  SearchBookByIsbnUseCase(this.repository);

Future<Either<DataFailed, DataState<BookModel>>> call({required String isbn})async{
  return await repository.searchBookByIsbn(isbn: isbn);
}}