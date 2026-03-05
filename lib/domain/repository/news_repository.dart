
import '../model/source.dart';

abstract class NewsRepository{
  Future<List<Source>> loadSources(String categoryName);
}