import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/remote_source.dart';
import 'package:news_app/domain/model/source.dart';
@injectable
class SourcesMapper{
 Source toSource(RemoteSource remoteSource){
    return Source(remoteSource.name??'', remoteSource.id??'');
  }
 List<Source> toSources(List<RemoteSource> remoteSources) {
   return remoteSources.map((remoteSource) => toSource(remoteSource)).toList();
 }
}