# dart_ipfs_client

A client library for the IPFS HTTP API, implemented in Dart.

## Usage

Requires running IPFS daemon.

```
import 'package:dart_ipfs_client/dart_ipfs_client.dart';

void main(List<String> arguments) async {
  var ipfs = Ipfs(url: 'http://127.0.0.1:5001');
  var addRes = await ipfs.add(utf8.encode('Hello World!'));
  print(addRes.body.toJson());

  var catRes = await ipfs.cat(addRes.body.hash);
  print(catRes.body.toJson());
}
```

Outputs:

```
{
  Bytes: null,
  Hash: Qmf1rtki74jvYmGeqaaV51hzeiaa6DyWc98fzDiuPatzyy,
  Name: Qmf1rtki74jvYmGeqaaV51hzeiaa6DyWc98fzDiuPatzyy,
  Size: 20
}
{Body: Hello World!}
```
