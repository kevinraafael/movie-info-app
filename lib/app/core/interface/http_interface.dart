abstract class HttpInterface {
  Future get(
    String endpoint, {
    required Map<String, dynamic> queryParameters,
  });
  // Future put(String endpoint, {required Map<String, dynamic> data});
  // Future post(String endpoint, {required Map<String, dynamic> data});
  // Future delete(String endpoint, {required Map<String, dynamic> data});
}
