




import 'package:book_library/core/error/data_state.dart';
import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:book_library/features/book/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchBookByNameUseCase {
  final BookRepository repository;

  SearchBookByNameUseCase(this.repository);

Future<Either<DataFailed, DataState<List<BookModel>>>> call({required String bookName})async{
  return await repository.searchBookByName(query: bookName);
}}