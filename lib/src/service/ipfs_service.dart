import 'package:chopper/chopper.dart';

import 'json_to_type_converter.dart';
import '../response/add.dart';
import '../response/cat.dart';

part 'ipfs_service.chopper.dart';

@ChopperApi()
abstract class IpfsService extends ChopperService {
  @Post(path: '/api/v0/add')
  @multipart
  Future<Response<Add>> add(@PartFile('path') List<int> file);

  @Post(path: '/api/v0/cat', optionalBody: true)
  Future<Response<Cat>> cat(@Query('arg') String arg);

  static IpfsService create(String url) {
    final client = ChopperClient(
        baseUrl: url,
        services: [_$IpfsService()],
        converter: JsonToTypeConverter({
          Add: (jsonData) => Add.fromJson(jsonData),
          Cat: (jsonData) => Cat.fromJson(jsonData),
        }),
        interceptors: [HttpLoggingInterceptor()]);

    return _$IpfsService(client);
  }
}
