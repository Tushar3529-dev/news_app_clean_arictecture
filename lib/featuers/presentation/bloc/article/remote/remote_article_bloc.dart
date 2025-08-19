// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_arictecture/core/resources/data_state.dart';

import 'package:news_app_clean_arictecture/featuers/domain/entites/article.dart';
import 'package:news_app_clean_arictecture/featuers/domain/usecase/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(
    this._getArticleUseCase,
  ) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  FutureOr<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
