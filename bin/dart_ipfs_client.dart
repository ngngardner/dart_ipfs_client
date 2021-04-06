import 'package:logging/logging.dart';

import 'package:dart_ipfs_client/dart_ipfs_client.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}: ${event.time}: ${event.message}');
  });
}

void main(List<String> arguments) async {
  _setupLogging();
  var ipfs = Ipfs();
  var addRes = await ipfs.add('Hello World!');
  print(addRes.body.toJson());

  var catRes = await ipfs.cat(addRes.body.hash);
  print(catRes.body.toJson());
}
