import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/gitrepo/controller/gitrepo.dart';
import 'package:flutter_riverpod_base/src/feature/gitrepo/view/widgets/git_repo_list_item.dart';

class GitRepoList extends ConsumerWidget {
  const GitRepoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gitController = ref.watch(productControllerProvider);
    return FutureBuilder(
      future: gitController.getProducts(context: context),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error Loading Data"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (data != null) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GitRepoListItem(gitrepo: data[index]);
              },
            );
          } else {
            return const Center(
              child: Text("Error Loading Data"),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
