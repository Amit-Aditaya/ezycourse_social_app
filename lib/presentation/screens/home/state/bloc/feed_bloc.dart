import 'package:ezy_course/domain/use_cases/feed/get_feed_use_case.dart';
import 'package:ezy_course/presentation/screens/home/state/bloc/feed_event.dart';
import 'package:ezy_course/presentation/screens/home/state/bloc/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetFeedsUseCase getFeedsUseCase;
  String? _token;

  FeedBloc({required this.getFeedsUseCase}) : super(FeedInitial()) {
    on<SetToken>(_onSetToken);
    on<FetchFeeds>(_onFetchFeeds);
    on<RefreshFeeds>(_onRefreshFeeds);
  }

  void _onSetToken(SetToken event, Emitter<FeedState> emit) {
    _token = event.token;
  }

  Future<void> _onFetchFeeds(
    FetchFeeds event,
    Emitter<FeedState> emit,
  ) async {
    if (_token == null) {
      emit(FeedError(message: 'Token not set'));
      return;
    }

    emit(FeedLoading());
    try {
      final feeds = await getFeedsUseCase.execute(_token!);
      emit(FeedLoaded(feeds: feeds));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }

  Future<void> _onRefreshFeeds(
    RefreshFeeds event,
    Emitter<FeedState> emit,
  ) async {
    if (_token == null) {
      emit(FeedError(message: 'Token not set'));
      return;
    }

    try {
      final feeds = await getFeedsUseCase.execute(_token!);
      emit(FeedLoaded(feeds: feeds));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}
