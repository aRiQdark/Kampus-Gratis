import 'package:kampus_gratis/models/discussion_global/discussion_global_model.dart';
import 'package:kampus_gratis/services/repository/discussion_global/discussion_global_repository.dart';

class DiscussionGlobalProvider {
  final DiscussionGlobalRepository _discussionGlobalRepository;

  DiscussionGlobalProvider(this._discussionGlobalRepository);

  Future<List<DiscussionGlobalModel>?> getAllDiscussionGlobal() async {
    var response = await _discussionGlobalRepository.getAllDiscussionGlobal();

    ResponseResultDiscussionGlobal responseResult =
        ResponseResultDiscussionGlobal.fromJson(response);

    List<DiscussionGlobalModel> result = responseResult.data;

    return result;
  }

  Future postMakeDf(String title, String content) async {
    print('init prov');
    // JSON body = {
    //   "title": title,
    //   "content": content,
    //   "session_id": null,
    // };

    final request =
        await _discussionGlobalRepository.postMakeDf(title, content);

    print('send prov');

    return request;
  }
}
