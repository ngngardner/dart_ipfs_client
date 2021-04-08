import 'package:chopper/chopper.dart';

import 'package:dart_ipfs_client/src/service/ipfs_service.dart';
import 'package:dart_ipfs_client/src/response/add.dart';
import 'package:dart_ipfs_client/src/response/cat.dart';

class Ipfs {
  IpfsService _service;

  Ipfs({String url = 'http://127.0.0.1:5001'}) {
    _service = IpfsService.create(url);
  }

  IpfsService ipfs() {
    return _service;
  }

  Future<Response<Add>> add(List<int> contents) {
    return _service.add(contents);
  }

  Future<Response<Cat>> cat(String arg) {
    return _service.cat(arg);
  }
}
