import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/users_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/models/user.dart';

class UsersService {
  Future<List<User>> getUsuarios() async {
    try {
      String? token = await AuthService.getToken();

      final resp = await http.get(
        Uri.parse('${Environments.apiUrl}/users'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': token.toString()
        },
      );

      final usersResponse = usersResponseFromJson(resp.body);

      return usersResponse.users;
    } catch (e) {
      return [];
    }
  }
}
