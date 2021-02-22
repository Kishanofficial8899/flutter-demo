import 'package:github/github.dart';
import 'package:mobx/mobx.dart';

//Import Store Here
part "github_store.g.dart";

class GithubStore = _GithubStore with _$GithubStore;

abstract class _GithubStore with Store {
  final GitHub client = GitHub();

  List<Repository> repo = [];

  // Empty Reponse first
  static ObservableFuture<List<Repository>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Repository>> fetchReposFuture = emptyResponse;

  // User Intial Value
  @observable
  String user = '';

  @computed
  bool get hasResults =>
      fetchReposFuture != emptyResponse &&
      fetchReposFuture.status == FutureStatus.fulfilled;

  Future<List<Repository>> fetchRepos() async {
    repo = [];

    final future = client.repositories.listUserRepositories(user).toList();
    fetchReposFuture = ObservableFuture(future);
    return repo = await future;
  }

  @action
  void setUser(String text) {
    fetchReposFuture = emptyResponse;
    user = text;
  }
}
