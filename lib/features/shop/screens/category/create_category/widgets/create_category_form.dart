import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../../../data/repositories/category/category_repository.dart';
import '../../../../../../features/shop/models/category_model.dart';
import '../../../../controllers/category/category_controller.dart';

class CreateCategoryForm extends StatefulWidget {
  const CreateCategoryForm({super.key});

  @override
  _CreateCategoryFormState createState() => _CreateCategoryFormState();
}

class _CreateCategoryFormState extends State<CreateCategoryForm> {
  final _nameController = TextEditingController();
  final _parentCateController = TextEditingController();
  final _imageUrlController = TextEditingController(); // Đường dẫn ảnh
  bool _isFeatured = false; // Kiểm tra Featured

  final CategoryRepository _categoryRepository = Get.find();
  final CategoryController _categoryController =
      Get.find(); // Lấy CategoryController để cập nhật dữ liệu sau khi tạo mới

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
              'Create New Category',
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

            // Nút tạo
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Tạo category mới và lưu vào Firestore
                  await _createCategory();
                },
                child: const Text('Create'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }

  Future<void> _createCategory() async {
    // Lấy dữ liệu từ các trường
    String name = _nameController.text;
    String parentCate = _parentCateController.text;
    String imageUrl = _imageUrlController.text;
    bool isFeatured = _isFeatured;

    // Tạo đối tượng CategoryModel
    CategoryModel newCategory = CategoryModel(
      id: '', // Firestore sẽ tự động sinh ID
      name: name,
      imageUrl: imageUrl,
      parentCate: parentCate,
      isFeatured: isFeatured,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Gửi dữ liệu lên Firestore
    try {
      // Thêm danh mục vào Firestore
      await _categoryRepository.createCategory(newCategory);

      // Sau khi thêm thành công, gọi fetchData để cập nhật lại danh sách danh mục
      await _categoryController.fetchData();

      // Hiển thị thông báo thành công
      Get.snackbar('Success', 'Category created successfully');
    } catch (e) {
      // Hiển thị thông báo lỗi nếu có lỗi xảy ra
      Get.snackbar('Error', 'Failed to create category: $e');
    }
  }
}
