import 'package:http/http.dart' as http;
class GithubHttpClient{

  static const _yourPersonalAccessToken = 'TODO';

  static const _search = r'''
query ($freeWord : String !){
  search(query:$freeWord, type:REPOSITORY,first : 10){
  codeCount 
  edges {
  ... on Repository{
    name nameWithOwner
    stargazers {
    totalCOunt
      }
    }
    }
  }
}
  ''';
  final HttpLink _httpLink = HttpLink(
    uri:'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AUthLink(
    getToken:() async => 'Bearer $_yourPersonalAccessToken',
  )

  Future<SearchResultDto> fetch(String freeWord) async {
    final Link _link = _authLink.concat(_httpLink);
    final GraphQLClient _client = GrapgQLClient(
      cache : InMemoryCache(),
      link: _link,
    );

    final QueryOptions options = QueryOptions(
      document:_search,
      variables:<String,dynamic>{
        'freeWord':freeWord,
      },
    );
    final QueryResult result = await _client.query(options);

    if(result.hasErros){
      return Future.error(result.errors);
    }
    return SearchResultDto.fromJson(result.data['search']);
  }
}