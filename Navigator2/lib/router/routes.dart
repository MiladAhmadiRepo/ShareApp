
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
        //اسم گذاری روت با نام روت
        name: rootRouteName,
        //ادرس  دهی روت اصلی
        path: '/',
        redirect: (state) =>
            // برو به صفحه home با پارامتر ورودی
            // مقدار tab برابر است با shop
            // یعنی به صورت پیش فرض در bottom navigation تب shop برو
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        //اسم گذاری روت با نام لاگین روت
      name: loginRouteName,
        //ادرس  دهی روت لاگین
        path: '/login',
        // صفحه لاگین رو بساز
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام ساخت حساب
      name: createAccountRouteName,
        //ادرس  دهی روت ساخت حساب
        path: '/create-account',
        // صفحه ساخت حساب رو بساز
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateAccount(),
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام صفحه ابتدایی
      name: homeRouteName,
        //ادرس  دهی روت با نام صفحه ابتدایی
        //که پارامتر ورودی tab میتونه یکی از
        //مقادیرshop|cart|profile داشته باشد
        path: '/home/:tab(shop|cart|profile)',
        pageBuilder: (context, state) {
          final tab = state.params['tab']!;
          // صفحه ابتدایی رو بساز
          // با مقداری که از tab میاد
          return MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(tab: tab),
          );
        },
        routes: [
          GoRoute(
            name: subDetailsRouteName,
            path: 'details/:item',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: Details(description: state.params['item']!),
            ),
          ),
          GoRoute(
            name: profilePersonalRouteName,
            path: 'personal',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const PersonalInfo(),
            ),
          ),
          GoRoute(
            name: profilePaymentRouteName,
            path: 'payment',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Payment(),
            ),
          ),
          GoRoute(
            name: profileSigninInfoRouteName,
            path: 'signin-info',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SigninInfo(),
            ),
          ),
          GoRoute(
            name: profileMoreInfoRouteName,
            path: 'more-info',
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
        path: '/shop',
        redirect: (state) =>
            // برو به صفحه home با پارامتر
            //ورودی tab  با مقدار shop
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        path: '/cart',
        redirect: (state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'cart'}),
      ),
      GoRoute(
        path: '/profile',
        redirect: (state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'profile'}),
      ),
      GoRoute(
        //اسم گذاری روت با نامdetails
        name: detailsRouteName,
        path: '/details-redirector/:item',
        redirect: (state) => state.namedLocation(
          subDetailsRouteName,
          params: {'tab': 'shop', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام personal
        name: personalRouteName,
        path: '/profile-personal',
        redirect: (state) => state.namedLocation(
          profilePersonalRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام payment
        name: paymentRouteName,
        path: '/profile-payment',
        redirect: (state) => state.namedLocation(
          profilePaymentRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام signinInfo
        name: signinInfoRouteName,
        path: '/profile-signin-info',
        redirect: (state) => state.namedLocation(
          profileSigninInfoRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        //اسم گذاری روت با نام moreInfo
      name: moreInfoRouteName,
        path: '/profile-more-info',
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
