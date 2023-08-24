import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class DiscussionRepository {
  final ApiService _apiService;

  DiscussionRepository(this._apiService);

  Future<JSON> getAllDiscussionById(String paramIdSession) async {
    var response = await _apiService.get(
      endpoint: '/forum/discussionforum/session/$paramIdSession',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> getDetailDiscussionById(String paramIdDf) async {
    var response = await _apiService.get(
      endpoint: '/forum/discussionforum/allcontent/$paramIdDf',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> getCommentDf(String paramIdDiscussion) async {
    var response = await _apiService.get(
      endpoint: '/forum/commentondf/$paramIdDiscussion',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> postCommentDf(String paramIdDiscussion, String content) async {
    var response = await _apiService.post(
        endpoint: '/forum/comment/create',
        requiresAuthToken: true,
        body: {
          "df_id": paramIdDiscussion,
          "content": content,
        });

    return response;
  }

  Future<JSON> postReplyCommentDf(String paramIdComment, String content) async {
    var response = await _apiService.post(
      endpoint: '/forum/reply/create',
      requiresAuthToken: true,
      body: {
        "comment_id": paramIdComment,
        "content": content,
      },
    );

    return response;
  }

  // /forum/like?type=df / comment&id=80518cbf-7d51-4972-9db1-5de04d378c2a

  Future<JSON> putLikeDiscussion(String paramIdDiscussion) async {
    var response = await _apiService.put(
      endpoint: '/forum/like?type=df&id=$paramIdDiscussion',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> putLikeComment(String paramIdComment) async {
    var response = await _apiService.put(
      endpoint: '/forum/like?type=comment&id=$paramIdComment',
      requiresAuthToken: true,
    );

    return response;
  }

  Future<JSON> putLikeReplyComment(String paramIdComment) async {
    var response = await _apiService.put(
      endpoint: '/forum/like?type=reply&id=$paramIdComment',
      requiresAuthToken: true,
    );

    return response;
  }
}
