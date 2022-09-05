import 'package:get/get.dart';
import 'package:paprclipassignmentapp/data/backend/repository.dart';
import 'package:paprclipassignmentapp/data/models/security_performance_response.dart';
import 'package:paprclipassignmentapp/data/models/security_response.dart';

class HomeController extends GetxController {
  Repository repository = Repository();

  RxBool _securityDataLoading = false.obs;
  RxBool _securityPerformanceDataLoading = false.obs;
  Rxn<SecurityResponse> _securityData = Rxn<SecurityResponse>();
  RxList<SecurityPerformanceResponse> _securityPerformanceData = 
      <SecurityPerformanceResponse>[].obs;

  bool get securityDataLoading => _securityDataLoading.value;
  bool get securityPerformanceDataLoading => _securityPerformanceDataLoading.value;
  SecurityResponse? get securityData => _securityData.value;
  List<SecurityPerformanceResponse> get securityPerformanceData => 
      _securityPerformanceData.value;

  set securityDataLoading(bool securityDataLoading) =>
      this._securityDataLoading.value = securityDataLoading;
  set securityPerformanceDataLoading(bool securityPerformanceDataLoading) =>
      this._securityPerformanceDataLoading.value = securityPerformanceDataLoading;
  set securityData(SecurityResponse? securityData) =>
      this._securityData.value = securityData;
  set securityPerformanceData(List<SecurityPerformanceResponse> securityPerformanceData) =>
      this._securityPerformanceData.value = securityPerformanceData;

  @override
  void onInit() {
    getSecurity();
    getSecurityPerformance();
    super.onInit();
  }

  Future<SecurityResponse?> getSecurity() async {
    securityDataLoading = true;
    SecurityResponse res = await repository.getSecurity();
    securityData = res;
    securityDataLoading = false;
    return securityData;
  }

  Future<List<SecurityPerformanceResponse?>> getSecurityPerformance() async {
    securityPerformanceDataLoading = true;
    List<SecurityPerformanceResponse> res = await repository.getSecurityPerformance();
    securityPerformanceData = res;
    securityPerformanceDataLoading = false;
    return securityPerformanceData;
  }
}