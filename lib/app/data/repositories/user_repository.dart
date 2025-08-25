import '../providers/api_provider.dart';
import '../models/user_model.dart';

class UserRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<UserModel>> getUsers() async {
    return await _apiProvider.fetchObjects();
  }

  Future<UserModel> createUser(UserModel user) async {
    return await _apiProvider.createObject(user);
  }

  Future<UserModel> updateUser(UserModel user) async {
    return await _apiProvider.updateObject(user);
  }

  Future<void> deleteUser(String id) async {
    await _apiProvider.deleteObject(id);
  }

  Future<UserModel?> getUserById(String id) async {
    final users = await _apiProvider.fetchObjects();
    return users.firstWhere(
      (u) => u.id == id,
      orElse: () => UserModel(id: '', name: '', data: {}),
    );
  }
}
