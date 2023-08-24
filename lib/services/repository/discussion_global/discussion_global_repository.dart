import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class DiscussionGlobalRepository {
  final ApiService _apiService;

  DiscussionGlobalRepository(this._apiService);

  Future<JSON> getAllDiscussionGlobal() async {
    var response = await _apiService.get(
      endpoint: '/forum/discussionforum/global',
      requiresAuthToken: true,
    );

    return response;
  }

  // Future<JSON> postCommentDf(String paramIdDiscussion, String content) async {
  //   var response = await _apiService.post(
  //       endpoint: '/forum/comment/create',
  //       requiresAuthToken: true,
  //       body: {
  //         "df_id": paramIdDiscussion,
  //         "content": content,
  //       });

  //   return response;
  // }

  // JSON body = {

  // };

  Future postMakeDf(String title, String content) async {
    print('init repo');
    var request = await _apiService.post(
      endpoint: '/forum/discussionforum/create',
      requiresAuthToken: true,
      body: {
        "title": title,
        "content": content,
        "session_id": null,
      },
    );
    print('send repo');

    return request;
  }

  // Future postMakeDf(JSON body) async {
  //   print('init repo');
  //   var request = await _apiService.post(
  //     endpoint: '/forum/discussionforum/create',
  //     body: body,
  //   );
  //   print('send repo');

  //   return request;
  // }

}
