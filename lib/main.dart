import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arictecture/config/theme/app_themes.dart';
import 'package:news_app_clean_arictecture/featuers/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_arictecture/featuers/presentation/pages/home/daily_news.dart';
import 'package:news_app_clean_arictecture/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide both status bar (top) and navigation bar (bottom)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
          theme: theme(),
          debugShowCheckedModeBanner: false,
          home: const DailyNews()),
    );
  }
}
