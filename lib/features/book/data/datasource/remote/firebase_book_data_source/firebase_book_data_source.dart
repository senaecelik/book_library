import 'package:book_library/features/book/domain/entities/book_detail_entity.dart';

abstract class RemoteBookDataSource {
  Future<void> createBook(BookEntityDetail book);
}
