// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../debug.dart';
import '../home/add_category_screen.dart';
import '../home/add_note_screen.dart';
import '../home/add_product_screen.dart';
import '../home/add_unit_type.dart';
import '../home/add_variation_screen.dart';
import '../home/camera/camera_preview.dart';
import '../home/cart/cart_details_screen.dart';
import '../home/category/create_category_input_screen.dart';
import '../home/edit_item_title.dart';
import '../home/products/all_item_screen.dart';
import '../home/products/edit_variation_screen.dart';
import '../home/products/view_products_screen.dart';
import '../home/products/view_single_item_screen.dart';
import '../home/receive_stock.dart';
import '../home/reports/date_screen.dart';
import '../home/reports/report_screen.dart';
import '../home/selling/change_quantity_selling.dart';
import '../home/setting_up_application_screen.dart';
import '../home/transactions/transaction_screen.dart';
import '../home/unit/edit_unit_screen.dart';
import '../home/widget/category/edit_category_screen.dart';
import '../model/cart.dart';
import '../presentation/business/create_business_screen.dart';
import '../presentation/business/sign_up_screen.dart';
import '../presentation/home/dash_board.dart';
import '../presentation/login/auth_webview.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/selling/complete_sale_screen.dart';
import '../presentation/selling/tender_screen.dart';
import '../presentation/splash/aftersplash.dart';
import '../presentation/splash/splash_screen.dart';
import '../presentation/subscription.dart';

class Routes {
  static const String splashScreen = '/';
  static const String dashBoard = '/dash-board';
  static const String loginScreen = '/login-screen';
  static const String afterSplash = '/after-splash';
  static const String addNoteScreen = '/add-note-screen';
  static const String settingUpApplicationScreen =
      '/setting-up-application-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String createBusinessScreen = '/create-business-screen';
  static const String createBusinessScreen = '/create-business-screen';
  static const String addProductScreen = '/add-product-screen';
  static const String editItemTitle = '/edit-item-title';
  static const String addVariationScreen = '/add-variation-screen';
  static const String addUnitTypeScreen = '/add-unit-type-screen';
  static const String addCategoryScreen = '/add-category-screen';
  static const String createCategoryInputScreen =
      '/create-category-input-screen';
  static const String receiveStockScreen = '/receive-stock-screen';
  static const String changeQuantityForSelling = '/change-quantity-for-selling';
  static const String cartDetailsScreen = '/cart-details-screen';
  static const String allItemScreen = '/all-item-screen';
  static const String viewProductsScreen = '/view-products-screen';
  static const String viewSingleItemScreen = '/view-single-item-screen';
  static const String editVariationScreen = '/edit-variation-screen';
  static const String editCategoryScreen = '/edit-category-screen';
  static const String editUnitTypeScreen = '/edit-unit-type-screen';
  static const String editUnitTypeScreen = '/edit-unit-type-screen';
  static const String transactionScreen = '/transaction-screen';
  static const String authWebView = '/auth-web-view';
  static const String reportScreen = '/report-screen';
  static const String tenderScreen = '/tender-screen';
  static const String dateScreen = '/date-screen';
  static const String completeSaleScreen = '/complete-sale-screen';
  static const String subscription = '/Subscription';
  static const String cameraPreview = '/camera-preview';
  static const String debug = '/Debug';
  static const all = <String>{
    splashScreen,
    dashBoard,
    loginScreen,
    afterSplash,
    addNoteScreen,
    settingUpApplicationScreen,
    signUpScreen,
    createBusinessScreen,
    addProductScreen,
    editItemTitle,
    addVariationScreen,
    addUnitTypeScreen,
    addCategoryScreen,
    createCategoryInputScreen,
    receiveStockScreen,
    changeQuantityForSelling,
    cartDetailsScreen,
    allItemScreen,
    viewProductsScreen,
    viewSingleItemScreen,
    editVariationScreen,
    editCategoryScreen,
    editUnitTypeScreen,
    transactionScreen,
    authWebView,
    reportScreen,
    tenderScreen,
    dateScreen,
    completeSaleScreen,
    subscription,
    cameraPreview,
    debug,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.dashBoard, page: DashBoard),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.afterSplash, page: AfterSplash),
    RouteDef(Routes.addNoteScreen, page: AddNoteScreen),
    RouteDef(Routes.settingUpApplicationScreen,
        page: SettingUpApplicationScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.createBusinessScreen, page: CreateBusinessScreen),
    RouteDef(Routes.createBusinessScreen, page: CreateBusinessScreen),
    RouteDef(Routes.addProductScreen, page: AddProductScreen),
    RouteDef(Routes.editItemTitle, page: EditItemTitle),
    RouteDef(Routes.addVariationScreen, page: AddVariationScreen),
    RouteDef(Routes.addUnitTypeScreen, page: AddUnitTypeScreen),
    RouteDef(Routes.addCategoryScreen, page: AddCategoryScreen),
    RouteDef(Routes.createCategoryInputScreen, page: CreateCategoryInputScreen),
    RouteDef(Routes.receiveStockScreen, page: ReceiveStockScreen),
    RouteDef(Routes.changeQuantityForSelling, page: ChangeQuantityForSelling),
    RouteDef(Routes.cartDetailsScreen, page: CartDetailsScreen),
    RouteDef(Routes.allItemScreen, page: AllItemScreen),
    RouteDef(Routes.viewProductsScreen, page: ViewProductsScreen),
    RouteDef(Routes.viewSingleItemScreen, page: ViewSingleItemScreen),
    RouteDef(Routes.editVariationScreen, page: EditVariationScreen),
    RouteDef(Routes.editCategoryScreen, page: EditCategoryScreen),
    RouteDef(Routes.editUnitTypeScreen, page: EditUnitTypeScreen),
    RouteDef(Routes.editUnitTypeScreen, page: EditUnitTypeScreen),
    RouteDef(Routes.transactionScreen, page: TransactionScreen),
    RouteDef(Routes.authWebView, page: AuthWebView),
    RouteDef(Routes.reportScreen, page: ReportScreen),
    RouteDef(Routes.tenderScreen, page: TenderScreen),
    RouteDef(Routes.dateScreen, page: DateScreen),
    RouteDef(Routes.completeSaleScreen, page: CompleteSaleScreen),
    RouteDef(Routes.subscription, page: Subscription),
    RouteDef(Routes.cameraPreview, page: CameraPreview),
    RouteDef(Routes.debug, page: Debug),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      final args = data.getArgs<SplashScreenArguments>(
        orElse: () => SplashScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(key: args.key),
        settings: data,
      );
    },
    DashBoard: (data) {
      final args = data.getArgs<DashBoardArguments>(
        orElse: () => DashBoardArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashBoard(key: args.key),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    AfterSplash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AfterSplash(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AddNoteScreen: (data) {
      final args = data.getArgs<AddNoteScreenArguments>(
        orElse: () => AddNoteScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddNoteScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    SettingUpApplicationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingUpApplicationScreen(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    SignUpScreen: (data) {
      final args = data.getArgs<SignUpScreenArguments>(
        orElse: () => SignUpScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(
          key: args.key,
          token: args.token,
          email: args.email,
          name: args.name,
          avatar: args.avatar,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CreateBusinessScreen: (data) {
      final args = data.getArgs<CreateBusinessScreenArguments>(
        orElse: () => CreateBusinessScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateBusinessScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AddProductScreen: (data) {
      final args = data.getArgs<AddProductScreenArguments>(
        orElse: () => AddProductScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddProductScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    EditItemTitle: (data) {
      final args = data.getArgs<EditItemTitleArguments>(
        orElse: () => EditItemTitleArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditItemTitle(
          key: args.key,
          productId: args.productId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AddVariationScreen: (data) {
      final args = data.getArgs<AddVariationScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddVariationScreen(
          key: args.key,
          retailPrice: args.retailPrice,
          supplyPrice: args.supplyPrice,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AddUnitTypeScreen: (data) {
      final args = data.getArgs<AddUnitTypeScreenArguments>(
        orElse: () => AddUnitTypeScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddUnitTypeScreen(
          key: args.key,
          productId: args.productId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AddCategoryScreen: (data) {
      final args = data.getArgs<AddCategoryScreenArguments>(
        orElse: () => AddCategoryScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCategoryScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CreateCategoryInputScreen: (data) {
      final args = data.getArgs<CreateCategoryInputScreenArguments>(
        orElse: () => CreateCategoryInputScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateCategoryInputScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ReceiveStockScreen: (data) {
      final args = data.getArgs<ReceiveStockScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReceiveStockScreen(
          key: args.key,
          variationId: args.variationId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ChangeQuantityForSelling: (data) {
      final args =
          data.getArgs<ChangeQuantityForSellingArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangeQuantityForSelling(
          key: args.key,
          productId: args.productId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CartDetailsScreen: (data) {
      final args = data.getArgs<CartDetailsScreenArguments>(
        orElse: () => CartDetailsScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CartDetailsScreen(
          key: args.key,
          carts: args.carts,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AllItemScreen: (data) {
      final args = data.getArgs<AllItemScreenArguments>(
        orElse: () => AllItemScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AllItemScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ViewProductsScreen: (data) {
      final args = data.getArgs<ViewProductsScreenArguments>(
        orElse: () => ViewProductsScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewProductsScreen(key: args.key),
        settings: data,
      );
    },
    ViewSingleItemScreen: (data) {
      final args = data.getArgs<ViewSingleItemScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewSingleItemScreen(
          key: args.key,
          productId: args.productId,
          itemName: args.itemName,
          itemColor: args.itemColor,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    EditVariationScreen: (data) {
      final args = data.getArgs<EditVariationScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditVariationScreen(
          key: args.key,
          variationId: args.variationId,
          productId: args.productId,
          unitId: args.unitId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    EditCategoryScreen: (data) {
      final args = data.getArgs<EditCategoryScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditCategoryScreen(
          key: args.key,
          productId: args.productId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    EditUnitTypeScreen: (data) {
      final args = data.getArgs<EditUnitTypeScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditUnitTypeScreen(
          key: args.key,
          itemId: args.itemId,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    TransactionScreen: (data) {
      final args = data.getArgs<TransactionScreenArguments>(
        orElse: () => TransactionScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TransactionScreen(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
    AuthWebView: (data) {
      final args = data.getArgs<AuthWebViewArguments>(
        orElse: () => AuthWebViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthWebView(
          key: args.key,
          url: args.url,
          authType: args.authType,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ReportScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportScreen(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    TenderScreen: (data) {
      final args = data.getArgs<TenderScreenArguments>(
        orElse: () => TenderScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TenderScreen(
          key: args.key,
          cashReceived: args.cashReceived,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    DateScreen: (data) {
      final args = data.getArgs<DateScreenArguments>(
        orElse: () => DateScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DateScreen(
          key: args.key,
          title: args.title,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CompleteSaleScreen: (data) {
      final args = data.getArgs<CompleteSaleScreenArguments>(
        orElse: () => CompleteSaleScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CompleteSaleScreen(
          key: args.key,
          cashReceived: args.cashReceived,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    Subscription: (data) {
      final args = data.getArgs<SubscriptionArguments>(
        orElse: () => SubscriptionArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Subscription(
          key: args.key,
          name: args.name,
          avatar: args.avatar,
          email: args.email,
          token: args.token,
          authType: args.authType,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CameraPreview: (data) {
      final args = data.getArgs<CameraPreviewArguments>(
        orElse: () => CameraPreviewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CameraPreview(
          key: args.key,
          image: args.image,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    Debug: (data) {
      final args = data.getArgs<DebugArguments>(
        orElse: () => DebugArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Debug(key: args.key),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

/// DashBoard arguments holder class
class DashBoardArguments {
  final Key key;
  DashBoardArguments({this.key});
}

/// AddNoteScreen arguments holder class
class AddNoteScreenArguments {
  final Key key;
  AddNoteScreenArguments({this.key});
}

/// SignUpScreen arguments holder class
class SignUpScreenArguments {
  final Key key;
  final String token;
  final String email;
  final String name;
  final String avatar;
  SignUpScreenArguments(
      {this.key, this.token, this.email, this.name, this.avatar});
}

/// CreateBusinessScreen arguments holder class
class CreateBusinessScreenArguments {
  final Key key;
  CreateBusinessScreenArguments({this.key});
}

/// AddProductScreen arguments holder class
class AddProductScreenArguments {
  final Key key;
  AddProductScreenArguments({this.key});
}

/// EditItemTitle arguments holder class
class EditItemTitleArguments {
  final Key key;
  final String productId;
  EditItemTitleArguments({this.key, this.productId});
}

/// AddVariationScreen arguments holder class
class AddVariationScreenArguments {
  final Key key;
  final double retailPrice;
  final double supplyPrice;
  AddVariationScreenArguments(
      {this.key, @required this.retailPrice, @required this.supplyPrice});
}

/// AddUnitTypeScreen arguments holder class
class AddUnitTypeScreenArguments {
  final Key key;
  final String productId;
  AddUnitTypeScreenArguments({this.key, this.productId});
}

/// AddCategoryScreen arguments holder class
class AddCategoryScreenArguments {
  final Key key;
  AddCategoryScreenArguments({this.key});
}

/// CreateCategoryInputScreen arguments holder class
class CreateCategoryInputScreenArguments {
  final Key key;
  CreateCategoryInputScreenArguments({this.key});
}

/// ReceiveStockScreen arguments holder class
class ReceiveStockScreenArguments {
  final Key key;
  final String variationId;
  ReceiveStockScreenArguments({this.key, @required this.variationId});
}

/// ChangeQuantityForSelling arguments holder class
class ChangeQuantityForSellingArguments {
  final Key key;
  final String productId;
  ChangeQuantityForSellingArguments({this.key, @required this.productId});
}

/// CartDetailsScreen arguments holder class
class CartDetailsScreenArguments {
  final Key key;
  final List<Cart> carts;
  CartDetailsScreenArguments({this.key, this.carts});
}

/// AllItemScreen arguments holder class
class AllItemScreenArguments {
  final Key key;
  AllItemScreenArguments({this.key});
}

/// ViewProductsScreen arguments holder class
class ViewProductsScreenArguments {
  final Key key;
  ViewProductsScreenArguments({this.key});
}

/// ViewSingleItemScreen arguments holder class
class ViewSingleItemScreenArguments {
  final Key key;
  final String productId;
  final String itemName;
  final String itemColor;
  ViewSingleItemScreenArguments(
      {this.key,
      @required this.productId,
      @required this.itemName,
      @required this.itemColor});
}

/// EditVariationScreen arguments holder class
class EditVariationScreenArguments {
  final Key key;
  final String variationId;
  final String productId;
  final String unitId;
  EditVariationScreenArguments(
      {this.key,
      @required this.variationId,
      @required this.productId,
      this.unitId});
}

/// EditCategoryScreen arguments holder class
class EditCategoryScreenArguments {
  final Key key;
  final String productId;
  EditCategoryScreenArguments({this.key, @required this.productId});
}

/// EditUnitTypeScreen arguments holder class
class EditUnitTypeScreenArguments {
  final Key key;
  final String itemId;
  EditUnitTypeScreenArguments({this.key, @required this.itemId});
}

/// TransactionScreen arguments holder class
class TransactionScreenArguments {
  final Key key;
  TransactionScreenArguments({this.key});
}

/// AuthWebView arguments holder class
class AuthWebViewArguments {
  final Key key;
  final String url;
  final String authType;
  AuthWebViewArguments({this.key, this.url, this.authType});
}

/// TenderScreen arguments holder class
class TenderScreenArguments {
  final Key key;
  final int cashReceived;
  TenderScreenArguments({this.key, this.cashReceived});
}

/// DateScreen arguments holder class
class DateScreenArguments {
  final Key key;
  final String title;
  DateScreenArguments({this.key, this.title});
}

/// CompleteSaleScreen arguments holder class
class CompleteSaleScreenArguments {
  final Key key;
  final int cashReceived;
  CompleteSaleScreenArguments({this.key, this.cashReceived});
}

/// Subscription arguments holder class
class SubscriptionArguments {
  final Key key;
  final String name;
  final String avatar;
  final String email;
  final String token;
  final String authType;
  SubscriptionArguments(
      {this.key,
      this.name,
      this.avatar,
      this.email,
      this.token,
      this.authType});
}

/// CameraPreview arguments holder class
class CameraPreviewArguments {
  final Key key;
  final dynamic image;
  CameraPreviewArguments({this.key, this.image});
}

/// Debug arguments holder class
class DebugArguments {
  final Key key;
  DebugArguments({this.key});
}
