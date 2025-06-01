import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/product_model.dart';
import '../widgets/CustomDropdownField.dart';
import '../widgets/CustomTextField.dart';

class CreateProductsTabletScreen extends StatefulWidget {
  const CreateProductsTabletScreen({super.key});

  @override
  State<CreateProductsTabletScreen> createState() =>
      _CreateProductsDesktopScreenState();
}

class _CreateProductsDesktopScreenState
    extends State<CreateProductsTabletScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imagesUrlController = TextEditingController();
  final statusController = TextEditingController();

  String? selectedCategoryId;
  String? selectedBrandId;
  bool isFeatured = false;

  Future<void> _submitProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        final categoryRef = FirebaseFirestore.instance
            .collection('Categories')
            .doc(selectedCategoryId);

        final brandRef = FirebaseFirestore.instance
            .collection('Brands')
            .doc(selectedBrandId);

        final product = ProductModel(
          id: '',
          categoryRef: categoryRef,
          brandRef: brandRef,
          name: nameController.text.trim(),
          description: descriptionController.text.trim(),
          status: statusController.text.trim(),
          isFeatured: isFeatured,
          imagesUrl: imagesUrlController.text
              .split(',')
              .map((url) => url.trim())
              .toList(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await FirebaseFirestore.instance
            .collection('Products')
            .add(product.toJson());

        Get.snackbar('Success', 'Product created successfully');
        _formKey.currentState!.reset();
        setState(() {
          selectedCategoryId = null;
          selectedBrandId = null;
          isFeatured = false;
        });
      } catch (e) {
        Get.snackbar('Error', 'Failed to create product: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const TBreadcrumbWithHeading(
            returnToPreviousScreen: true,
            heading: 'Create Products',
            breadcrumbItems: ['Create Products'],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  label: 'Product Name',
                  controller: nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter product name' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                CustomTextField(
                  label: 'Description',
                  controller: descriptionController,
                  maxLines: 3,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter description' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                FirestoreDropdownField(
                  label: 'Category',
                  collectionPath: 'Categories',
                  value: selectedCategoryId,
                  onChanged: (value) {
                    setState(() {
                      selectedCategoryId = value!;
                    });
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                FirestoreDropdownField(
                  label: 'Brand',
                  collectionPath: 'Brands',
                  value: selectedBrandId,
                  onChanged: (value) {
                    setState(() {
                      selectedBrandId = value!;
                    });
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                CustomTextField(
                  label: 'Status',
                  controller: statusController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter status' : null,
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    const Text('Is Featured?'),
                    Checkbox(
                      value: isFeatured,
                      onChanged: (val) =>
                          setState(() => isFeatured = val ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                CustomTextField(
                  label: 'Image URLs (comma-separated)',
                  controller: imagesUrlController,
                  validator: (value) => value!.isEmpty
                      ? 'Please enter at least one image URL'
                      : null,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                ElevatedButton(
                  onPressed: _submitProduct,
                  child: const Text('Create Product'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
