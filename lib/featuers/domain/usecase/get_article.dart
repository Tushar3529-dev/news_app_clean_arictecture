import 'package:news_app_clean_arictecture/core/resources/data_state.dart';
import 'package:news_app_clean_arictecture/core/usecases/usecase.dart';
import 'package:news_app_clean_arictecture/featuers/domain/entites/article.dart';
import 'package:news_app_clean_arictecture/featuers/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final AcrticleRepository _acrticleRepository;

  GetArticleUseCase(this._acrticleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _acrticleRepository.getNewsArticles();
  }
}
