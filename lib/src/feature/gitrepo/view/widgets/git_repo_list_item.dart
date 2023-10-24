import 'package:flutter/material.dart';

import '../../../../models/git_repo_model.dart';

class GitRepoListItem extends StatelessWidget {
  const GitRepoListItem({super.key, required this.gitrepo});

  final Item gitrepo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(gitrepo.owner.avatarUrl??""),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gitrepo.fullName??"",
              // maxLines: 1,overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(gitrepo.description ?? "Not provided",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey[700]),),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [Icon(Icons.star_rate,color: Colors.grey[600],size: 14,),
                Text(
                  gitrepo.stargazersCount.toString(),
                  style: TextStyle(color: Colors.grey[600],fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
