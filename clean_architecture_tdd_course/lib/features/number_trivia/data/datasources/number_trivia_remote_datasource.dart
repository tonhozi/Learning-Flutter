import '../../domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDatasource {
  /// Calls the https://numbersapo.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  /// Calls the https://numbersapo.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTrivia> getRandomNumberTrivia();
}
