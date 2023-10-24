import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/gitrepo/view/git_repo.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.black26,
        title: const Text(AppStrings.appName),
      ),
      body: const GitRepoList(),
    );
  }
}
