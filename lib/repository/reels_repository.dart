import 'package:dio/dio.dart';
import '../models/reel.dart';

class ReelsRepository {
  final Dio _dio = Dio();

  Future<List<Reel>> getReels() async {
    final response = await _dio.get('https://api.sawalef.app/api/v1/reels');
    final data = response.data['data'] as List;
    return data.map((json) => Reel.fromJson(json)).toList();
  }

  Future<List<Reel>> getMoreReels() async {

    final response = await _dio.get('https://api.sawalef.app/api/v1/reels?page=2');
    final data = response.data['data'] as List;
    return data.map((json) => Reel.fromJson(json)).toList();
  }
}
