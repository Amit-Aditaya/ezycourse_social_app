import 'package:ezy_course/core/utils/globals/globals.dart';
import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:ezy_course/data/data_source/remote/comment/comment_remote_datasource.dart';
import 'package:ezy_course/data/repository/comment/comment_repository_impl.dart';
import 'package:ezy_course/domain/entities/comment/comment.dart';
import 'package:ezy_course/domain/use_cases/comment/add_comment_use_case.dart';
import 'package:ezy_course/domain/use_cases/comment/get_comment_use_case.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/state/bloc/comment_bloc.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/state/bloc/comment_event.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/state/bloc/comment_state.dart';
import 'package:ezy_course/presentation/widgets/components/comment_widget.dart';
import 'package:ezy_course/presentation/widgets/textfields/comment_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class CommentsBottomSheet extends StatelessWidget {
  final int feedId;

  const CommentsBottomSheet({super.key, required this.feedId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc(
          addCommentUseCase: AddCommentsUseCase(
              repository: CommentRepositoryImpl(
                  remoteDataSource: CommentRemoteDataSourceImpl(
                      client: http.Client(), baseUrl: ApiEndpoints.baseUrl))),
          getCommentsUseCase: GetCommentsUseCase(
              repository: CommentRepositoryImpl(
                  remoteDataSource: CommentRemoteDataSourceImpl(
                      client: http.Client(), baseUrl: ApiEndpoints.baseUrl))))
        ..add(SetCommentParameters(token: Globals.token!, feedId: feedId))
        ..add(FetchComments()),
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CommentLoaded) {
            return CommentSection(
              comments: state.comments,
              // comments: [
              //   CommentUI(
              //     username: state.comments[0].username,
              //     content:
              //         '4 cup toakie my name is Amit and this is my first comment, hope you are are doing well. I am jsut testing is a really really really long comment',
              //     timeAgo: '22d',
              //     likes: 1,
              //     replies: [
              //       CommentUI(
              //         username: 'User2',
              //         content: 'Hhh...',
              //         timeAgo: '22d',
              //         likes: 0,
              //         replies: [
              //           CommentUI(
              //             username: 'User3',
              //             content: 'Nested reply',
              //             timeAgo: '21d',
              //             likes: 2,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              //   CommentUI(
              //     username: 'AnotherUser',
              //     content: 'Parent comment',
              //     timeAgo: '1d',
              //     likes: 3,
              //   ),
              // ],
            );
          } else if (state is CommentError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container(
              color: Colors.teal,
            );
          }
        },
      ),
    );
  }
}

class CommentUI {
  final String username;
  final String content;
  final String timeAgo;
  final int likes;
  final List<CommentUI> replies;

  CommentUI({
    required this.username,
    required this.content,
    required this.timeAgo,
    required this.likes,
    this.replies = const [],
  });
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  final TextEditingController controller = TextEditingController();

  CommentSection({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: .025.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "You and 2 others",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: .025.sh,
            ),
            if (comments.isEmpty)
              const Expanded(
                child: Center(
                  child: Text('No comments yet'),
                ),
              )
            else
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return CommentWidget(
                            createdAt: comments[index].createdAt,
                            likeCount: comments[index].likeCount,
                            replyCount: comments[index].replyCount,
                            userName: comments[index].username,
                            comment: comments[index].commentText);
                      }),
                ),
              ),
            CommentTextField(
              controller: controller,
              onTap: () {
                context
                    .read<CommentBloc>()
                    .add(AddComment(comment: controller.text));

                context.read<CommentBloc>().add(RefreshComments());
              },
            ),
          ],
        ),
      ),
    );
  }
}
