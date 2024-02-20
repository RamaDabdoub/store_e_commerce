import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/token_info.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';





// class AuthRepository {
//   Future<Either<String, TokenInfo>> login({
//     required String username,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route: 'auth/login',
//         body: {
//           "username": username,
//           "password": password,
//         },
//       ).then((value) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
class AuthRepository {
Future<Either<String, TokenInfo>> login({
  required String username,
  required String password,
}) async {
  try {
    return NetworkUtil.sendRequest(
      type: RequestType.POST,
      route: 'auth/login',
      body: {
        "username": username,
        "password": password,
      },
    ).then((value) {
      // Check if the value is of the expected type (Map<String, dynamic>)
      if (value is Map<String, dynamic>) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          // Check if the response contains error message
          if (value['response'] != null &&
              value['response']['message'] != null) {
            return Left(value['response']['message']);
          } else {
            // Handle generic error message
            return Left(commonResponse.message);
          }
        }
      } else {
        // If the value is not of the expected type, consider it as an error message
        return Left("Unexpected response from server");
      }
    });
  } catch (e) {
    return Left(e.toString());
  }
}
}




