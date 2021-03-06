// Mocks generated by Mockito 5.0.16 from annotations
// in clean_architecture_tdd_course/test/features/number_trivia/data/repositories/number_trivia_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:clean_architecture_tdd_course/core/network/network_info.dart'
    as _i7;
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_local_datasource.dart'
    as _i6;
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart'
    as _i4;
import 'package:clean_architecture_tdd_course/features/number_trivia/data/models/number_trivia_model.dart'
    as _i3;
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeNumberTrivia_0 extends _i1.Fake implements _i2.NumberTrivia {}

class _FakeNumberTriviaModel_1 extends _i1.Fake
    implements _i3.NumberTriviaModel {}

/// A class which mocks [NumberTriviaRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaRemoteDatasource extends _i1.Mock
    implements _i4.NumberTriviaRemoteDatasource {
  MockNumberTriviaRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.NumberTrivia> getConcreteNumberTrivia(int? number) =>
      (super.noSuchMethod(Invocation.method(#getConcreteNumberTrivia, [number]),
              returnValue:
                  Future<_i2.NumberTrivia>.value(_FakeNumberTrivia_0()))
          as _i5.Future<_i2.NumberTrivia>);
  @override
  _i5.Future<_i2.NumberTrivia> getRandomNumberTrivia() => (super.noSuchMethod(
          Invocation.method(#getRandomNumberTrivia, []),
          returnValue: Future<_i2.NumberTrivia>.value(_FakeNumberTrivia_0()))
      as _i5.Future<_i2.NumberTrivia>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NumberTriviaLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberTriviaLocalDatasource extends _i1.Mock
    implements _i6.NumberTriviaLocalDatasource {
  MockNumberTriviaLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.NumberTriviaModel> getLastNumberTrivia() =>
      (super.noSuchMethod(Invocation.method(#getLastNumberTrivia, []),
              returnValue: Future<_i3.NumberTriviaModel>.value(
                  _FakeNumberTriviaModel_1()))
          as _i5.Future<_i3.NumberTriviaModel>);
  @override
  _i5.Future<bool> cacheNumberTrivia(_i3.NumberTriviaModel? triviaToCache) =>
      (super.noSuchMethod(
          Invocation.method(#cacheNumberTrivia, [triviaToCache]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  String toString() => super.toString();
}
