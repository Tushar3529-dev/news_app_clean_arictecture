import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_arictecture/featuers/data/data_source/local/app_database.dart';
import 'package:news_app_clean_arictecture/featuers/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_arictecture/featuers/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_arictecture/featuers/domain/repository/article_repository.dart';
import 'package:news_app_clean_arictecture/featuers/domain/usecase/get_article.dart';
import 'package:news_app_clean_arictecture/featuers/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
// Creating The DataBase
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

//Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependiences
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<AcrticleRepository>(ArticleRepositoryImpl(sl()));

  //Usecase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
