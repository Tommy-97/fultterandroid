import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_app/constants.dart'; // Подключите файл с константами

class ApiService {
  static const String baseUrl = Constants.apiUrl;

  // Метод для выполнения GET-запросов
  static Future<Map<String, dynamic>> getRequest(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);
    return _processResponse(response);
  }

  // Метод для выполнения POST-запросов
  static Future<Map<String, dynamic>> postRequest(String endpoint, dynamic body, {Map<String, String>? headers}) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), body: jsonEncode(body), headers: headers);
    return _processResponse(response);
  }

  // Метод для выполнения PUT-запросов
  static Future<Map<String, dynamic>> putRequest(String endpoint, dynamic body, {Map<String, String>? headers}) async {
    final response = await http.put(Uri.parse('$baseUrl/$endpoint'), body: jsonEncode(body), headers: headers);
    return _processResponse(response);
  }

  // Метод для выполнения DELETE-запросов
  static Future<Map<String, dynamic>> deleteRequest(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: headers);
    return _processResponse(response);
  }

  // Метод для обработки ответа
  static Future<Map<String, dynamic>> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw NotFoundException('Resource not found');
    } else {
      throw ServerException('Server error: ${response.statusCode}');
    }
  }


  // Примеры методов для работы с пользователями
  static Future<Map<String, dynamic>> fetchUserById(int id) async {
    return await getRequest('api/admin/users/$id');
  }

  static Future<void> updateUserById(int id, Map<String, dynamic> data) async {
    await putRequest('api/admin/users/$id', data);
  }

  static Future<void> blockUser(int id, bool lockState) async {
    await putRequest('api/admin/users/blockUser/$id/$lockState', {});
  }

  static Future<void> createUser(Map<String, dynamic> data) async {
    await postRequest('api/admin/users/create', data);
  }


  static Future<Map<String, dynamic>> fetchAllUsers() async {
    final response = await getRequest('api/admin/users'); // замените на свой эндпоинт для получения списка пользователей
    return response['data'];
  }

  // Примеры методов для работы с песнями
  static Future<Map<String, dynamic>> fetchAllSongs() async {
    return await getRequest('api/admin/media');
  }

  static Future<Map<String, dynamic>> fetchSongById(int id) async {
    return await getRequest('api/songs/$id');
  }

  static Future<void> uploadSong(int id, Map<String, dynamic> data) async {
    await putRequest('api/admin/media/upload/$id', data);
  }

  static Future<void> createSong(Map<String, dynamic> data) async {
    await postRequest('api/admin/media/upload', data);
  }
}

void main() async {
  // Пример использования ApiService для получения данных о пользователе по ID
  try {
    Map<String, dynamic> user = await ApiService.fetchUserById(1);
    print('User: $user');
  } catch (e) {
    print('Error fetching user: $e');
  }

  // Пример использования ApiService для получения списка всех пользователей
  try {
    List<dynamic> users = await ApiService.fetchAllUsers();
    print('Users: $users');
  } catch (e) {
    print('Error fetching users: $e');
  }
}


