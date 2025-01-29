import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ezy_course/core/utils/globals/globals.dart';
import 'package:ezy_course/domain/use_cases/post/create_post_use_case.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePostUseCase createPostUseCase;
  String? _token;

  PostBloc(this.createPostUseCase) : super(CreatePostLoadingState()) {
    on<CreatePost>(_createPost);
  }

  FutureOr<void> _createPost(CreatePost event, Emitter<PostState> emit) async {
    emit(CreatePostLoadingState());
    final result =
        await createPostUseCase.execute(Globals.token!, event.content);
    if (result) {
      emit(CreatePostSuccessState());
    } else {
      emit(CreatePostFailedState());
    }
  }
}
