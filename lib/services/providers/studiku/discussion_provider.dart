import 'package:kampus_gratis/models/studiku/discussion_detail_model.dart';
import 'package:kampus_gratis/models/studiku/discussion_model.dart';
import 'package:kampus_gratis/services/repository/studiku/discussion_repository.dart';

class DiscussionProvider {
  final DiscussionRepository _discussionRepository;

  DiscussionProvider(this._discussionRepository);

  Future<List<DiscussionModel>?> getAllDiscussionById(
      String paramIdSession) async {
    var response =
        await _discussionRepository.getAllDiscussionById(paramIdSession);

    ResponseResultDiscussion responseResult =
        ResponseResultDiscussion.fromJson(response);

    List<DiscussionModel> result = responseResult.data;

    return result;
  }

  Future<DetailDiscussionModel?> getDetailDiscussionById(
      String paramIdDf) async {
    var response =
        await _discussionRepository.getDetailDiscussionById(paramIdDf);


    ResponseResultDetailDiscussion responseResult =
        ResponseResultDetailDiscussion.fromJson(response);

    DetailDiscussionModel result = responseResult.data;

    return result;
  }

  Future postCommentDf(String paramIdDiscussion, String content) async {
    var response = await _discussionRepository.postCommentDf(
      paramIdDiscussion,
      content,
    );

    return response;
  }

  Future postReplyCommentDf(String paramIdComment, String content) async {
    var response = await _discussionRepository.postReplyCommentDf(
      paramIdComment,
      content,
    );

    return response;
  }

  Future putLikeDf(String paramIdDiscussion) async {
    var response =
        await _discussionRepository.putLikeDiscussion(paramIdDiscussion);

    return response;
  }

  Future putLikeComment(String paramIdComment) async {
    var response = await _discussionRepository.putLikeComment(paramIdComment);

    return response;
  }

  Future putLikeReplyComment(String paramIdComment) async {
    var response =
        await _discussionRepository.putLikeReplyComment(paramIdComment);

    return response;
  }
}
