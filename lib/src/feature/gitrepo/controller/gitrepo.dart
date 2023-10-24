import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/gitrepo/repository/git_repo.dart';
import 'package:flutter_riverpod_base/src/models/git_repo_model.dart';

import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:flutter_riverpod_base/src/utils/snackbar_service.dart';

final productControllerProvider = Provider((ref) {
  final repo = ref.watch(gitRepoProvider);
  return GitRepoController(repo: repo);
});

class GitRepoController {
  final GitRepo _repo;
  GitRepoController({required GitRepo repo}) : _repo = repo;

  Future<List<Item>?> getProducts({ BuildContext? context }) async {
    final result = await _repo.getProducts();
    print(result);
    return result.fold(
      (failure){
        print("faiked");
        if(AppConfig.devMode && context!=null){
          SnackBarService.showSnackBar(context: context, message: SnackBarMessages.productLoadFailed);
        }
        return null;
      },
      (products){
        print("---pr");
        
        return products;
      },
    );
  }
}
