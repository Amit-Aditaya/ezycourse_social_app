import 'package:ezy_course/domain/use_cases/comment/get_comment_use_case.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/state/bloc/comment_event.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/state/bloc/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsUseCase getCommentsUseCase;
  String? _token;
  int? _feedId;

  CommentBloc({required this.getCommentsUseCase}) : super(CommentInitial()) {
    on<SetCommentParameters>(_onSetParameters);
    on<FetchComments>(_onFetchComments);
    on<RefreshComments>(_onRefreshComments);
  }

  void _onSetParameters(
    SetCommentParameters event,
    Emitter<CommentState> emit,
  ) {
    _token = event.token;
    _feedId = event.feedId;
  }

  Future<void> _onFetchComments(
    FetchComments event,
    Emitter<CommentState> emit,
  ) async {
    if (_token == null || _feedId == null) {
      emit(CommentError(message: 'Token or FeedId not set'));
      return;
    }

    emit(CommentLoading());
    try {
      final comments = await getCommentsUseCase.execute(_token!, _feedId!);

      emit(CommentLoaded(comments: comments));
    } catch (e) {
      emit(CommentError(message: e.toString()));
    }
  }

  Future<void> _onRefreshComments(
    RefreshComments event,
    Emitter<CommentState> emit,
  ) async {
    if (_token == null || _feedId == null) {
      emit(CommentError(message: 'Token or FeedId not set'));
      return;
    }

    try {
      final comments = await getCommentsUseCase.execute(_token!, _feedId!);
      emit(CommentLoaded(comments: comments));
    } catch (e) {
      emit(CommentError(message: e.toString()));
    }
  }
}
