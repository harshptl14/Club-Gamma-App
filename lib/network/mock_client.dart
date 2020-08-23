// *  Not needed as of now
import 'dart:convert';
import 'index.dart';

class MockClient implements IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders}) async {
    var resultClass;
    //String rawString;

    //? For Teams Hardcoded Data
    //  if (resourcePath == HomeProvider.kConstGetTeamsUrl) {
    //   if (Injector().currentDataMode == DataMode.DART) {
    //     //rawString = jsonEncode(TeamsData(teams: teams));
    //   } else {
    //     rawString = await rootBundle.loadString(ClubGamma.teamsAssetJson);
    //   }
    //   resultClass = await compute(jsonParserIsolate, rawString);
    // }

    return MappedNetworkServiceResponse<T>(
        mappedResult: resultClass,
        networkServiceResponse: NetworkServiceResponse<T>(success: true));
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, data,
      {bool customHeaders = false}) {
    return null;
  }

  // * JSON Decoding using Isolates
  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
}
