import 'dart:convert';

import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late NumberTriviaRemoteDatasourceImpl datasource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    datasource = NumberTriviaRemoteDatasourceImpl(client: mockClient);
  });

  void setUpMockClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
  }

  void setUpMockClientFailure404() {
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    test(
      '''should perform a GET request on a URL with number being the 
      endpoint and with application/json header''',
      () async {
        // arrange
        setUpMockClientSuccess200();
        // act
        datasource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(
          mockClient.get(
            Uri.parse("https://numbersapi.com/$tNumber"),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
      },
    );
    test(
      'should return NumberTrivia when response code is 200',
      () async {
        // arrange
        setUpMockClientSuccess200();
        // act
        final result = await datasource.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response is 404 or other',
      () async {
        // arrange
        setUpMockClientFailure404();
        // act
        final call = datasource.getConcreteNumberTrivia;
        // assert
        expect(
            () => call(tNumber), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    test(
      '''should perform a GET request on a URL with random number being the 
      endpoint and with application/json header''',
      () async {
        // arrange
        setUpMockClientSuccess200();
        // act
        datasource.getRandomNumberTrivia();
        // assert
        verify(
          mockClient.get(
            Uri.parse("https://numbersapi.com/random"),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
      },
    );
    test(
      'should return NumberTrivia when response code is 200',
      () async {
        // arrange
        setUpMockClientSuccess200();
        // act
        final result = await datasource.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response is 404 or other',
      () async {
        // arrange
        setUpMockClientFailure404();
        // act
        final call = datasource.getRandomNumberTrivia;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  // group('getLastNumberTrivia', () {
  //   final tNumberTriviaModel =
  //       NumberTriviaModel.fromJson(json.decode(fixture('trivia_local.json')));
  //   test(
  //     'should return NumberTriviaModel from SharedPreferences when there is one in the cache',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any))
  //           .thenReturn(fixture('trivia_local.json'));
  //       // act
  //       final result = await datasource.getLastNumberTrivia();
  //       // assert
  //       verify(mockSharedPreferences.getString('CACHED_NUMBER_TRIVIA'));
  //       expect(result, equals(tNumberTriviaModel));
  //     },
  //   );

  //   test(
  //     'should throw a CacheException when there is nothing in the cache',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any)).thenReturn(null);
  //       // act
  //       final call = datasource.getLastNumberTrivia;
  //       // assert
  //       expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
  //     },
  //   );
  // });

  // group('cacheNumberTrivia', () {
  //   const tNumberTriviaModel = NumberTriviaModel(text: 'Test test', number: 1);
  //   test(
  //     'should call SharedPreferences to cache the data',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.setString(any, any))
  //           .thenAnswer((_) => Future.value(true));
  //       // act
  //       datasource.cacheNumberTrivia(tNumberTriviaModel);
  //       // assert
  //       final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
  //       verify(mockSharedPreferences.setString(
  //         cachedNumberTrivia,
  //         expectedJsonString,
  //       ));
  //     },
  //   );
  // });
}
