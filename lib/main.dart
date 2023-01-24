import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'layout/news_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  // عشان خليت main بقت async
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(BlocProvider(
    create: (context) =>NewsCubit() ,
    child:   MyApp(),
  ));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return MaterialApp(

          themeMode: ThemeMode.dark ,

          theme: ThemeData(
            primaryColor: Colors.deepOrange,
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              color: Colors.white,
              elevation: 0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),

            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20,
            ),

            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          darkTheme: ThemeData(
            primaryColor: Colors.deepOrange,
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: const Color(0xff333739),
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              color: Color(0xff333739),
              elevation: 0,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xff333739),
                statusBarIconBrightness: Brightness.light,
              ),
            ),

            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              elevation: 20,
              backgroundColor: Color(0xff333739),
            ),

            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),


          debugShowCheckedModeBanner: false,
          home: const Directionality(
              textDirection: TextDirection.ltr,
              child: NewsLayout()),
        );
      },
    );
  }
}
