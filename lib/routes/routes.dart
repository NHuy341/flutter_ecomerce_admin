class TRoutes {
  static const login = '/login';
  static const forgetPassword = '/forget-password/';
  static const resetPassword = '/reset-password';
  static const dashboard = '/dashboard';
  static const media = '/media';

  static const products = '/products';
  static const createProduct = '/create-product';
  static const editProduct = '/edit-product';

  static const categories = '/categories';
  static const createCategory = '/create-category';
  static const editCategory = '/edit-category';

  static const customers = '/customers';
  static const createCustomer = '/createCustomer';
  static const customerDetails = '/customerDetails';

  static const orders = '/orders';

  static List sideBarMenuItems = [
    dashboard,
    categories,
    products,
    customers,
    orders,
  ];
}
