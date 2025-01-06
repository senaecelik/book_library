

import 'dart:io';

import 'package:book_library/app/environment/index.dart';
import 'package:book_library/core/error/data_state.dart';
import 'package:book_library/features/book/data/datasource/remote/find_book_api_data_source.dart';
import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:book_library/features/book/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BookRepository)
class BookRepositoryImpl extends BookRepository{

  final FindBookApiDataSource _dataSource;

  BookRepositoryImpl(this._dataSource);
  
  @override
  Future<Either<DataFailed, DataSuccess<BookModel>>> searchBookByIsbn({required String isbn})async {
  try {
      final httpResponse = await _dataSource.getBook(
        apiKey: ProdEnv().apiKey,
        query: isbn
      );

     if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(DataSuccess(httpResponse.data));
      } else {
        return Left(DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage)));
      }
    } on DioException catch(e) {
      return Left(DataFailed(e));
    }
  }
  
  @override
  Future<Either<DataFailed, DataSuccess<List<BookModel>>>> searchBookByName({required String query})async {
    try {
      final httpResponse = await _dataSource.getBooks(
        apiKey: ProdEnv().apiKey,
        query: query
      );

     if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Right(DataSuccess(httpResponse.data));
      } else {
        return Left(DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage)));
      }
    } on DioException catch(e) {
      return Left(DataFailed(e));
    }
  }
 

 
}