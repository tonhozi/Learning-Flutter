import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDatasource {
  /// Get the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Calls the https://numbersapo.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<bool> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
