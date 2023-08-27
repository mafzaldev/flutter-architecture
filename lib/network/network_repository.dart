import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/domain/failure/network_failure.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {
  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }
}
