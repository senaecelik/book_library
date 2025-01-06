


import 'package:book_library/core/error/data_state.dart';
import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<DataFailed, DataSuccess<BookModel>>> searchBookByIsbn({required String isbn});

  Future<Either<DataFailed, DataSuccess<List<BookModel>>>> searchBookByName({required String query});



}