import 'package:admin/dashboard/dashboard.dart';
import 'package:admin/features/shop/screens/category/edit_category/edit_category.dart';
import 'package:admin/features/shop/screens/customer/all_customers/customer.dart';
import 'package:admin/features/shop/screens/customer/customer_detail/customer_detail.dart';
import 'package:admin/features/shop/screens/product/all_products/products.dart';
import 'package:admin/features/shop/screens/product/create_product/responsive_screens/create_products_desktop.dart';
import 'package:admin/routes/routes.dart';
import 'package:admin/routes/routes_middleware.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/forget_password/forget_password.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/reset_password/reset_password.dart';
import '../features/shop/screens/category/all_categories/categories.dart';
import '../features/shop/screens/category/create_category/create_category.dart';
import '../features/shop/screens/order/all_orders/orders.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: TRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: TRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: TRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: TRoutes.dashboard,
      page: () => const DashboardScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    //Category
    GetPage(
      name: TRoutes.categories,
      page: () => CategoriesScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.createCategory,
      page: () => CreateCategoriesScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.editCategory,
      page: () => EditCategoryScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    //Product
    GetPage(
      name: TRoutes.products,
      page: () => ProductsScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.createProduct,
      page: () => CreateProductsDesktopScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.editProduct,
      page: () => EditCategoryScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    //customer
    GetPage(
      name: TRoutes.customers,
      page: () => CustomerScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
    GetPage(
      name: TRoutes.customerDetails,
      page: () => CustomerDetailScreen(),
      middlewares: [TRoutesMiddleware()],
    ),

    //Orders
    GetPage(
      name: TRoutes.orders,
      page: () => OrdersScreen(),
      middlewares: [TRoutesMiddleware()],
    ),
  ];
}
