import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_arictecture/core/constants/constants.dart';
import 'package:news_app_clean_arictecture/core/resources/data_state.dart';
import 'package:news_app_clean_arictecture/featuers/data/data_source/remote/news_api_services.dart';
import 'package:news_app_clean_arictecture/featuers/data/models/article.dart';
import 'package:news_app_clean_arictecture/featuers/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements AcrticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: ApiKey,
        category: categoryQuery,
        country: countryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
