import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:flutter_riverpod_base/src/models/git_repo_model.dart';

import 'package:flutter_riverpod_base/src/res/endpoints.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

final gitRepoProvider = Provider((ref){
  final api = ref.watch(apiProvider);
  return GitRepo(api: api);
});

class GitRepo {
  final API _api;
  GitRepo({required API api}) : _api = api;

  FutureEither<List<Item>> getProducts() async {
    final result = await _api.getRequest(url: Endpoints.getProducts, requireAuth: false);

    return result.fold(
      (Failure failure) {
        print("----------------->>");
        print(failure.message);
        log(failure.message, name: LogLabel.git);
        return Left(failure);
      },
      (Response response) {
        print("-<<-------------->>");
        try{
          final data = jsonDecode(response.body);
          GetGitRepoModel getGitRepoModel =GetGitRepoModel.fromJson(data);
          return Right(getGitRepoModel.items);
        }catch (e, stktrc) {
          print(e);
          log(FailureMessage.jsonParsingFailed, name: LogLabel.git);
          return Left(Failure(message: FailureMessage.jsonParsingFailed, stackTrace: stktrc,));
        }
      },
    );
  }
}
