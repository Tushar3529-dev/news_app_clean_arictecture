import 'package:news_app_clean_arictecture/core/resources/data_state.dart';
import 'package:news_app_clean_arictecture/featuers/domain/entites/article.dart';

abstract class AcrticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
