import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/create_account.dart';
import '../ui/error_page.dart';
import '../ui/home_screen.dart';
import '../ui/more_info.dart';
import '../ui/payment.dart';
import '../ui/personal_info.dart';
import '../ui/signin_info.dart';
import '../constants.dart';
import '../login_state.dart';
import '../ui/login.dart';
import '../ui/details.dart';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        //اسم گذاری روت با نام root
        name: rootRouteName,
        //ادرس  دهی روت home
        path: '/',
        redirect: (state) =>
            // برو به صفحه home با پارامتر ورودی
            // مقدار tab برابر است با shop
            // یعنی به صورت پیش فرض در bottom navigation تب shop برو
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        //اسم گذاری روت با نام لاگین login
        name: loginRouteName,
        //ادرس  دهی روت login
        path: '/login',
        // صفحه لاگین رو بساز
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام create-account
        name: createAccountRouteName,
        //ادرس  دهی روت create-account
        path: '/create-account',
        // صفحه create account رو بساز
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateAccount(),
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام home
        name: homeRouteName,
        //ادرس  دهی روت با نام home
        //که پارامتر ورودی tab میتونه یکی از
        //مقادیرshop|cart|profile داشته باشد
        path: '/home/:tab(shop|cart|profile)',
        pageBuilder: (context, state) {
          final tab = state.params['tab']!;
          // صفحه home رو بساز
          // با مقداری که از tab میاد
          return MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(tab: tab),
          );
        },
        routes: [
          GoRoute(
            //اسم گذاری روت با نام shop-details
            name: subDetailsRouteName,
            //ادرس  دهی روت  shop-details
            // با پارامتر وردی item
            path: 'details/:item',
            // صفحه shop-details رو بساز
            // با مقداری که از item میاد
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: Details(description: state.params['item']!),
            ),
          ),
          GoRoute(
            //اسم گذاری روت با نام profile-personal
            name: profilePersonalRouteName,
            //ادرس  دهی روت profile-personal
            path: 'personal',
            // صفحه profile-personal رو بساز
            //بدون پارامتر ورودی
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const PersonalInfo(),
            ),
          ),
          GoRoute(
            //اسم گذاری روت با نام profile-payment
            name: profilePaymentRouteName,
            //ادرس  دهی روت profile-payment
            path: 'payment',
            // صفحه profile-payment رو بساز
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Payment(),
            ),
          ),
          GoRoute(
            //اسم گذاری روت با نام profile-signin
            name: profileSigninInfoRouteName,
            //ادرس  دهی روت profile-signin
            path: 'signin-info',
            // صفحه profile-signin رو بساز
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SigninInfo(),
            ),
          ),
          GoRoute(
            //اسم گذاری روت با نام profile-moreInfo
            name: profileMoreInfoRouteName,
            //ادرس  دهی روت profile-moreInfo
            path: 'more-info',
            // صفحه profile-moreInfo رو بساز
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const MoreInfo(),
            ),
          ),
        ],
      ),
      // forwarding routes to remove the need to put the 'tab' param in the code
      //اگه این ادرس رو صدا زدیم میریم به ادرس home
      GoRoute(
        //ادرس  دهی روت بدون نام
        //ادرس  دهی روت shop
        path: '/shop',
        redirect: (state) =>
            // برو به صفحه home با پارامتر
            //ورودی tab  با مقدار shop
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        path: '/cart',
        // برو به صفحه home با پارامتر
        // ورودی tab و لا مقدار cart
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'cart'}),
      ),
      GoRoute(
        //ادرس  دهی روت profile
        path: '/profile',
        // برو به صفحه home با پارامتر
        // ورودی tab و لا مقدار profile
        redirect: (state) => state.namedLocation(homeRouteName, params: {'tab': 'profile'}),
      ),
      GoRoute(
        //اسم گذاری روت با تام details
        name: detailsRouteName,
        //ادرس  دهی روت details
        //با پارامتر ورودی item
        path: '/details-redirector/:item',
        // برو به صفحه shop-details با پارامتر
        // ورودی tab و با مقدار shop
        //همچنین ورودی item و با مقدار که پاس داده میشود
        redirect: (state) => state.namedLocation(
          subDetailsRouteName,
          params: {'tab': 'shop', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام personal
        name: personalRouteName,
        //ادرس  دهی روت personal
        path: '/profile-personal',
        // برو به صفحه profile-personal با پارامتر
        // ورودی tab و با مقدار profile
        redirect: (state) => state.namedLocation(
          profilePersonalRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام payment
        name: paymentRouteName,
        //ادرس  دهی روت payment
        path: '/profile-payment',
        // برو به صفحه profile-payment با پارامتر
        // ورودی tab و با مقدار profile
        redirect: (state) => state.namedLocation(
          profilePaymentRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام signin
        name: signinInfoRouteName,
        //ادرس  دهی روت signin
        path: '/profile-signin-info',
        // برو به صفحه profile-signin با پارامتر
        // ورودی tab و با مقدار profile
        redirect: (state) => state.namedLocation(
          profileSigninInfoRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام moreInfo
        name: moreInfoRouteName,
        //ادرس  دهی روت moreInfo
        path: '/profile-more-info',
        // برو به صفحه profile-moreInfo با پارامتر
        // ورودی tab و با مقدار profile
        redirect: (state) => state.namedLocation(
          profileMoreInfoRouteName,
          params: {'tab': 'profile'},
        ),
      ),
    ],

    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),

    // redirect to the login page if the user is not logged in
    redirect: (state) {
      //ادرس صفحه لاگین
      final loginLoc = state.namedLocation(loginRouteName);
      //آیا صفحه ای که لان قرار داریم - صفحه لاگین هست
      final loggingIn = state.subloc == loginLoc;
      //ادرس صفحه رجیستر
      final createAccountLoc = state.namedLocation(createAccountRouteName);
      //آیا صفحه ای که لان قرار داریم - صفحه رجیستر هست
      final creatingAccount = state.subloc == createAccountLoc;
      //ایا از قبل لاگین انجام شده
      final loggedIn = loginState.loggedIn;
      //ادرس صفحه اصلی
      final rootLoc = state.namedLocation(rootRouteName);

      //اگه صفحه لاگین و صفحه رجستر نبودیم و لاگین نشده بود از قبل برو به صفحه لاگین
      if (!loggedIn && !loggingIn && !creatingAccount) return loginLoc;
      if (loggedIn && (loggingIn || creatingAccount)) return rootLoc;
      return null;
    },
  );
}
