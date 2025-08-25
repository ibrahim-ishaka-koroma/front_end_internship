// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_otp_rest_starter/app/controllers/home_controller.dart';
import 'package:flutter_otp_rest_starter/app/data/repositories/user_repository.dart';
import 'package:flutter_otp_rest_starter/app/data/models/user_model.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late HomeController homeController;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    homeController = HomeController(repository: mockUserRepository);
  });

  test('getUsers calls UserRepository.getUsers', () async {
    when(
      mockUserRepository.getUsers(),
    ).thenAnswer((_) async => [UserModel(id: '1', name: 'Test', data: {})]);
    await homeController.fetchUsers();
    verify(mockUserRepository.getUsers()).called(1);
    expect(homeController.users.isNotEmpty, true);
  });
}
