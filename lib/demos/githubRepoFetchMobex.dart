import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import "package:flutter_demos/demos/components/github_store.dart";

class GithubPage extends StatefulWidget {
  @override
  GithubExampleState createState() => GithubExampleState();
}

class GithubExampleState extends State<GithubPage> {
  final GithubStore store = GithubStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch User Github Repo"),
      ),
      body: Column(
        children: <Widget>[
          UserInput(store),
          ShowError(store),
          LoadingCircularIcon(store),
          RepositoryListView(store)
        ],
      ),
    );
  }
}

class RepositoryListView extends StatelessWidget {
  RepositoryListView(this.store);

  final GithubStore store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return Container();
          }
          if (store.repo.isEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('We could not find any repos for user: '),
                Text(
                  store.user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            );
          }
          return ListView.builder(
            itemCount: store.repo.length,
            itemBuilder: (_, int index) {
              final repo = store.repo[index];
              return ListTile(
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        repo.name,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(' (${repo.stargazersCount} ⭐️)'),
                  ],
                ),
                subtitle: Text(
                  repo.description ?? "",
                  overflow: TextOverflow.fade,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//UserInput Widget
class UserInput extends StatelessWidget {
  final GithubStore store;

  const UserInput(this.store);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextField(
              autocorrect: false,
              autofocus: true,
              decoration:
                  InputDecoration(hintText: "Enter Github User Name Only"),
              onSubmitted: (String user) {
                store.setUser(user);
                store.fetchRepos();
              },
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: store.fetchRepos,
        ),
      ],
    );
  }
}

class ShowError extends StatelessWidget {
  final GithubStore store;
  const ShowError(this.store);

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => store.fetchReposFuture.status == FutureStatus.rejected
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Icon(
                Icons.warning,
                color: Colors.redAccent,
              ),
              Container(
                width: 8,
              ),
              const Text(
                'oops Somthing Went Wrong',
                style: TextStyle(color: Colors.deepOrange),
              ),
              Text(
                store.user,
                style: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              )
            ])
          : Container());
}

class LoadingCircularIcon extends StatelessWidget {
  LoadingCircularIcon(this.store);
  final GithubStore store;
  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => store.fetchReposFuture.status == FutureStatus.pending
            ? Center(
                child: const LinearProgressIndicator(
                backgroundColor: Colors.blue,
              ))
            : Container(),
      );
}
