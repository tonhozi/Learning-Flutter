import 'package:clean_architecture_tdd_course/core/platform/network_info.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks(
    [NumberTriviaRemoteDatasource, NumberTriviaLocalDatasource, NetworkInfo])
void main() {
  NumberTriviaRepositoryImpl repository;
  final mockNumberTriviaRemoteDatasource = MockNumberTriviaRemoteDatasource();
  final mockNumberTriviaLocalDatasource = MockNumberTriviaLocalDatasource();
  final mockNetworkInfo = MockNetworkInfo();
  repository = NumberTriviaRepositoryImpl(
    remoteDatasource: mockNumberTriviaRemoteDatasource,
    localDatasource: mockNumberTriviaLocalDatasource,
    networkInfo: mockNetworkInfo,
  );
}
