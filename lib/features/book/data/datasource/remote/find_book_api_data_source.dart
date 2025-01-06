import 'package:book_library/features/book/data/model/book_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'find_book_api_data_source.g.dart';


@RestApi(baseUrl: "https://www.googleapis.com/books/v1/")
abstract class FindBookApiDataSource{
  factory FindBookApiDataSource(Dio dio) = _FindBookApiDataSource;

 @GET('/volumes')
  Future<HttpResponse<BookModel>> getBook({
    @Query("q") String? query, // Arama sorgusu
    @Query("key") String? apiKey, // API anahtarı (gerekirse)
    // Diğer isteğe bağlı parametreler buraya eklenebilir
  });


 @GET('/volumes')
  Future<HttpResponse<List<BookModel>>> getBooks({
    @Query("q") String? query, // Arama sorgusu
    @Query("key") String? apiKey, // API anahtarı (gerekirse)
    // Diğer isteğe bağlı parametreler buraya eklenebilir
  });
}
