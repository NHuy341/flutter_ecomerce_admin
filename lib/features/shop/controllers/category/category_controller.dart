import 'package:admin/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/data_table.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/category/category_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxBool isLoading = true.obs;
  RxList<CategoryModel> allItems = <CategoryModel>[].obs;
  RxList<CategoryModel> filteredItems = <CategoryModel>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;

  //sort
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;

  final searchTextController = TextEditingController();

  final _categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      List<CategoryModel> fetchedItems = [];
      if (allItems.isEmpty) {
        fetchedItems = await _categoryRepository.getAllCategories();
      }

      allItems.assignAll(fetchedItems);
      filteredItems.assignAll(allItems);
      selectedRows.assignAll(List.generate(allItems.length, (_) => false));

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  sortByName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  sortByParentName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  searchQuery(String query) {
    filteredItems.assignAll(
      allItems.where(
          (item) => item.name.toLowerCase().contains(query.toLowerCase())),
    );
  }

  confirmAndDeleteItem(CategoryModel category) {
    // Show a confirmation dialog
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('Are you sure you want to delete this item?'),
      confirm: SizedBox(
        width: 60,
        child: ElevatedButton(
          onPressed: () async => await deleteOnConfirm(category),
          style: OutlinedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5)),
          ),
          child: const Text('Ok'),
        ), // ElevatedButton
      ), // SizedBox
      cancel: SizedBox(
        child: OutlinedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5),
            ),
          ),
          child: const Text('Cancel'),
        ),
      ), // SizedBox
    );
  }

  deleteOnConfirm(CategoryModel category) async {
    try {
      TFullScreenLoader.stopLoading();
      TFullScreenLoader.popUpCircular();
      await _categoryRepository.deleteCategory(category.id);
      removeItemFromLists(category);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Item Delete', message: 'Hoàn thành');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Opps', message: e.toString());
    }
  }

  /// Method for removing an item from the lists.
  void removeItemFromLists(CategoryModel item) {
    allItems.remove(item);
    filteredItems.remove(item);
    selectedRows.assignAll(List.generate(
        allItems.length, (index) => false)); // Initialize selected rows

    update(); // Trigger UI update
  }
}
