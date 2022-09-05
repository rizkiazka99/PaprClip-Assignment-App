import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ApiProvider {
  String baseUrl = 'https://api.stockedge.com/Api/SecurityDashboardApi/';
  Dio dio = Dio();

  getResponse(statusCode, error, message, data) {
    return {
      'status_code' : statusCode,
      'error' : error,
      'message' : message,
      'data' : data
    };
  }

  handleError(error) {
    String errorDescription = '';
    DioError? dioError;

    if (error is DioError) {
      dioError = error as DioError;
      switch(dioError.type) {
        case DioErrorType.cancel:
          errorDescription = 'Request to the server was cancelled';
          break;
        case DioErrorType.connectTimeout:
          errorDescription = 'Connection timeout to the server';
          break;
        case DioErrorType.other:
          errorDescription = 'Unknown error occurred';
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'Send timeout in connection to the server';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'Receive timeout in connection to the server';
          break;
        case DioErrorType.response:
          errorDescription = "${dioError.response!.data['status']}";
          break;
      }
    } else {
      errorDescription = 'Unexpected error occurred';
    }

    return getResponse(
      dioError!.response!.statusCode,
      true, 
      errorDescription, 
      dioError.response!.data['error_data']
    );
  }

  Future dioGet(url) async {
    try {
      final response = await dio.get(
        baseUrl + url,
        options: Options(
          headers: {
            'Content-Type' : 'application/json; charset=utf-8',
            'Charset': 'utf-8'
          },
          contentType: 'application/json',
          validateStatus: (status) {
            if (status == HttpStatus.ok ||
                status == HttpStatus.accepted ||
                status == HttpStatus.created) {
              return true;
            } else {
              return false;
            }
          }
        )
      );

      return response.data;
    } catch (error) {
      handleError(error);
    }
  }

  Future getSecurity() async {
    return await dioGet('GetCompanyEquityInfoForSecurity/5051?lang=en');
  }

  Future getSecurityPerformance() async {
    return await dioGet('GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en');
  }
}