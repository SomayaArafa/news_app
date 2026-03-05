import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/remote_source.dart';

@Injectable(as:NewsLocalDataSource)
class NewsLocalDataSourceImpl extends NewsLocalDataSource {
  @override
  Future<List<RemoteSource>?> loadSources(String categoryName) async {
    var box = await Hive.openBox("news");
    return box.get(categoryName) as List<RemoteSource>?;
  }

  Future<void> saveSources(String category, List<RemoteSource> sources) async {
    var box = await Hive.openBox("news");
    box.put(category, sources);
  }
}

class NewsLocalDataSourceImpl2 extends NewsLocalDataSource {
  Future<List<RemoteSource>?> loadSources(String categoryName) async {}

  Future<void> saveSources(String category, List<RemoteSource> sources) async {}
}

abstract class NewsLocalDataSource {
  Future<List<RemoteSource>?> loadSources(String categoryName);

  Future<void> saveSources(String category, List<RemoteSource> sources);
}




class SourceAdapter extends TypeAdapter<RemoteSource> {
  @override
  RemoteSource read(BinaryReader reader) {
    return RemoteSource.fromJson(reader.read());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, RemoteSource obj) {
    writer.write(obj.toJson());
  }
}