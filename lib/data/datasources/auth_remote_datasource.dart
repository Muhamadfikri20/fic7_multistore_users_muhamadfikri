import 'package:fic7_multistore_users_muhamadfikri/common/global_variables.dart';
import 'package:fic7_multistore_users_muhamadfikri/data/models/auth_response_model.dart';
import 'package:fic7_multistore_users_muhamadfikri/data/models/request/register_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(RegisterRequestModel model) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
        Uri.parse(
          '${GlobalVariables.baseUrl}/api/register',
        ),
        headers: headers,
        body: model.toJson());

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}