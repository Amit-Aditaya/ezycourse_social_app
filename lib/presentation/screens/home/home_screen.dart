import 'package:ezy_course/core/utils/globals/globals.dart';
import 'package:ezy_course/data/data_source/api_endpoints.dart';
import 'package:ezy_course/data/data_source/remote/feed/feed_remote_datasource.dart';
import 'package:ezy_course/data/repository/feed_repository_impl.dart';
import 'package:ezy_course/domain/use_cases/feed/get_feed_use_case.dart';
import 'package:ezy_course/presentation/screens/create_post/create_post_screen.dart';
import 'package:ezy_course/presentation/screens/home/state/bloc/feed_bloc.dart';
import 'package:ezy_course/presentation/screens/home/state/bloc/feed_event.dart';
import 'package:ezy_course/presentation/screens/home/state/bloc/feed_state.dart';
import 'package:ezy_course/presentation/screens/home/widgets/post_widget.dart';
import 'package:ezy_course/presentation/screens/home/widgets/social_post.dart';
import 'package:ezy_course/presentation/widgets/bottom_nav_bars/primary_bottom_nav_bar.dart';
import 'package:ezy_course/presentation/widgets/scaffolds/primary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeAgo;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBloc(
          getFeedsUseCase: GetFeedsUseCase(
              repository: FeedRepositoryImpl(
                  remoteDataSource: FeedRemoteDataSourceImpl(
                      client: http.Client(), baseUrl: ApiEndpoints.baseUrl))))
        ..add(SetToken(Globals.token!))
        ..add(FetchFeeds()),
      child: PrimaryScaffold(
        bottomNavigationBar: const PrimaryBottomNavBar(),
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is FeedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FeedLoaded) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: .025.sh,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CreatePostScreen()))
                            .then((value) {
                          context.read<FeedBloc>().add(RefreshFeeds());
                        });
                      },
                      child: const PostWidget()),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.feeds.length,
                      itemBuilder: (context, index) {
                        return SocialPost(
                            username: state.feeds[index].username,
                            userImage: state.feeds[index].userProfilePic,
                            timeAgo:
                                timeAgo.format(state.feeds[index].publishDate),
                            content: state.feeds[index].feedText,
                            imageUrl: state.feeds[index].postImage ?? '',
                            likes: state.feeds[index].likeCounter,
                            feedId: state.feeds[index].feedId,
                            comments: state.feeds[index].commentCounter);
                      })
                ],
              );
            } else if (state is FeedError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
