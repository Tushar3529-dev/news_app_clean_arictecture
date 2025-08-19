import 'package:dio/dio.dart';
import 'package:news_app_clean_arictecture/core/constants/constants.dart';
import 'package:news_app_clean_arictecture/featuers/data/models/article.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart'; // <-- IMPORTANT for HttpResponse

part 'news_api_services.g.dart';

@RestApi(baseUrl: newsApiBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
