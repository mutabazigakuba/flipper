import 'package:auto_route/auto_route_annotations.dart';
import 'package:flipper/debug.dart';
import 'package:flipper/home/add_category_screen.dart';
import 'package:flipper/home/add_note_screen.dart';
import 'package:flipper/home/add_product_screen.dart';
import 'package:flipper/home/add_unit_type.dart';
import 'package:flipper/home/add_variation_screen.dart';
import 'package:flipper/home/camera/camera_preview.dart';
import 'package:flipper/home/cart/cart_details_screen.dart';
import 'package:flipper/home/category/create_category_input_screen.dart';
import 'package:flipper/home/edit_item_title.dart';
import 'package:flipper/home/products/all_item_screen.dart';
import 'package:flipper/home/products/edit_variation_screen.dart';
import 'package:flipper/home/products/view_products_screen.dart';
import 'package:flipper/home/products/view_single_item_screen.dart';
import 'package:flipper/home/receive_stock.dart';
import 'package:flipper/home/reports/date_screen.dart';
import 'package:flipper/home/reports/report_screen.dart';
import 'package:flipper/home/selling/change_quantity_selling.dart';
import 'package:flipper/home/setting_up_application_screen.dart';
import 'package:flipper/home/transactions/transaction_screen.dart';
import 'package:flipper/home/unit/edit_unit_screen.dart';
import 'package:flipper/home/widget/category/edit_category_screen.dart';
import 'package:flipper/presentation/business/create_business_screen.dart';
import 'package:flipper/presentation/business/sign_up_screen.dart';
import 'package:flipper/presentation/home/dash_board.dart';
import 'package:flipper/presentation/login/auth_webview.dart';
import 'package:flipper/presentation/login/login_screen.dart';
import 'package:flipper/presentation/selling/complete_sale_screen.dart';
import 'package:flipper/presentation/selling/tender_screen.dart';
import 'package:flipper/presentation/splash/aftersplash.dart';
import 'package:flipper/presentation/splash/splash_screen.dart';
import 'package:flipper/presentation/subscription.dart';

@MaterialAutoRouter(
  // ignore: always_specify_types
  routes: <AutoRoute>[
   // ignore: always_specify_types
   MaterialRoute(page: SplashScreen, initial: true),
   // ignore: always_specify_types
   MaterialRoute(page: DashBoard),
   // ignore: always_specify_types
   MaterialRoute(page: LoginScreen),
   // ignore: always_specify_types
   MaterialRoute(page: AfterSplash,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AddNoteScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: SettingUpApplicationScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: SignUpScreen,fullscreenDialog: true),
   
   // ignore: always_specify_types
   MaterialRoute(page: CreateBusinessScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AddProductScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: EditItemTitle,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AddVariationScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AddUnitTypeScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AddCategoryScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: CreateCategoryInputScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: ReceiveStockScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: ChangeQuantityForSelling,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: CartDetailsScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AllItemScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: ViewProductsScreen),
   // ignore: always_specify_types
   MaterialRoute(page: ViewSingleItemScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: EditVariationScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: EditCategoryScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: EditUnitTypeScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: TransactionScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: AuthWebView,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: ReportScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: TenderScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: DateScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: CompleteSaleScreen,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: Subscription,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: CameraPreview,fullscreenDialog: true),
   // ignore: always_specify_types
   MaterialRoute(page: Debug,fullscreenDialog: true),
])
class $Routing {}


