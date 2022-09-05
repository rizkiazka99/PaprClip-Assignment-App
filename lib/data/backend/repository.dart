import 'package:paprclipassignmentapp/data/backend/api_provider.dart';
import 'package:paprclipassignmentapp/data/models/security_performance_response.dart';
import 'package:paprclipassignmentapp/data/models/security_response.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<SecurityResponse> getSecurity() async {
    final response = await apiProvider.getSecurity();
    return SecurityResponse.fromJson(response);
  }

  Future<List<SecurityPerformanceResponse>> getSecurityPerformance() async {
    final response = await apiProvider.getSecurityPerformance();
    return (response as List).map((e) => SecurityPerformanceResponse.fromJson(e)).toList();
  }
}