import 'package:admin/features/shop/controllers/category/category_controller.dart';
import 'package:admin/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../../../data/repositories/category/category_repository.dart';

class EditCategoryForm extends StatefulWidget {
  const EditCategoryForm({super.key, required this.category});

  final CategoryModel category;

  @override
  _EditCategoryFormState createState() => _EditCategoryFormState();
}

class _EditCategoryFormState extends State<EditCategoryForm> {
  final _nameController = TextEditingController();
  final _parentCateController = TextEditingController();
  final _imageUrlController = TextEditingController(); // Đường dẫn ảnh
  bool _isFeatured = false;

  final CategoryRepository _categoryRepository = Get.find();

  @override
  void initState() {
    super.initState();
    // Khởi tạo giá trị từ category hiện tại
    _nameController.text = widget.category.name;
    _parentCateController.text = widget.category.parentCate;
    _imageUrlController.text = widget.category.imageUrl;
    _isFeatured = widget.category.isFeatured;
  }

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.sm),
            Text(
              'Update Category',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Tên danh mục
            TextFormField(
              controller: _nameController,
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(
                labelText: 'Category Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Danh mục cha
            TextFormField(
              controller: _parentCateController,
              decoration: const InputDecoration(
                labelText: 'Parent Category',
                prefixIcon: Icon(Iconsax.bezier),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            // Đường dẫn ảnh
            TextFormField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                hintText: 'Enter image URL or local path',
                prefixIcon: Icon(Iconsax.image),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            // Featured Checkbox
            CheckboxListTile(
              title: const Text('Featured'),
              value: _isFeatured,
              onChanged: (bool? value) {
                setState(() {
                  _isFeatured = value ?? false;
                });
              },
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            // Nút update
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await _updateCategory();
                },
                child: const Text('Update'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }

  Future<void> _updateCategory() async {
    // Lấy dữ liệu từ các trường
    String name = _nameController.text;
    String parentCate = _parentCateController.text;
    String imageUrl = _imageUrlController.text;
    bool isFeatured = _isFeatured;

    // Kiểm tra xem ID có hợp lệ không
    if (widget.category.id.isEmpty) {
      Get.snackbar('Error', 'Invalid category ID');
      return;
    }

    // Tạo đối tượng CategoryModel với dữ liệu mới
    CategoryModel updatedCategory = widget.category.copyWith(
      name: name,
      parentCate: parentCate,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      updatedAt: DateTime.now(),
    );

    try {
      // Gửi dữ liệu cập nhật lên Firestore
      await _categoryRepository.updateCategory(updatedCategory);
      Get.snackbar('Success', 'Category updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update category: $e');
    }
  }
}
