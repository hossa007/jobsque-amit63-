import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/apply_job/view_model/job_cubit.dart';



import 'package:sizer/sizer.dart';


import 'app_core/bloc_observer.dart';
import 'app_core/database/local_database/cache_helper.dart';
import 'app_core/database/remoteDatabase/DioHelper.dart';
import 'app_core/router/app_router.dart';
import 'app_features/apply_job/view_model/job_cubit.dart';
import 'app_features/create_account/view_model/register_cubit.dart';
import 'app_features/forgot_password/view_model/forget_password_cubit.dart';
import 'app_features/home/view_model/home_cubit.dart';
import 'app_features/home_layout/view_model/layout_cubit.dart';
import 'app_features/login/view_model/login_cubit.dart';
import 'app_features/onboarding/view_model/onboarding_cubit.dart';
import 'app_features/profile/view_model/profile_cubit.dart';
import 'app_features/saved_job/view_model/favourite_cubit.dart';
import 'app_features/search/view_model/search_cubit.dart';
import 'features/splash/view/screens/splash_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(


     const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LayoutCubit>(
              create: (context) => LayoutCubit(),
            ),
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
            ),
            BlocProvider<ForgetPasswordCubit>(
              create: (context) => ForgetPasswordCubit(),
            ),
            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit()
                ..getAllRecentJobs()..getAllSuggestJobs()..getFavouriteJobs(),
            ),
            BlocProvider(
              create: (context) => JobCubit(),
            ),
            BlocProvider(
              create: (context) => FavouriteCubit(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit()
                ..getProfileDetailsAndPortfolios()..getProfileNameAndEmail()

            ),
            BlocProvider(
              create: (context) => OnboardingCubit(),
            ),


          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'SFProDisplay',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: onGenerateRouter,
            // home: SplashScreen(),

          ),
        );
      },

    );
  }
}



