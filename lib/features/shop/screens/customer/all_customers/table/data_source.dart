import 'package:admin/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:admin/features/authentication/models/user_model.dart';
import 'package:admin/utils/constants/colors.dart';
import 'package:admin/utils/constants/enums.dart';
import 'package:admin/utils/constants/image_strings.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:admin/common/widgets/images/t_rounded_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/routes.dart';
import '../../../../controllers/customer/customer_controller.dart';

class CustomerRows extends DataTableSource {
  final CustomerController controller = Get.put(CustomerController());

  @override
  DataRow? getRow(int index) {
    if (index >= controller.users.length) return null;

    final user = controller.users[index];

    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.sm,
                image: user.avatarUrl.isNotEmpty
                    ? user.avatarUrl
                    : TImages.defaultImage,
                imageType: ImageType.network,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  user.fullName,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(user.email)),
        DataCell(Text(user.formattedPhoneNo)),
        DataCell(Text(user.formattedDate)),
        DataCell(
          TTableActionButtons(
            view: true,
            edit: false,
            onViewPressed: () =>
                Get.toNamed(TRoutes.customerDetails, arguments: user),
            onDeletePressed: () async {
              final confirm = await Get.defaultDialog<bool>(
                title: 'Confirm Delete',
                middleText: 'Are you sure you want to delete ${user.fullName}?',
                textCancel: 'Cancel',
                textConfirm: 'Delete',
                confirmTextColor: Colors.white,
                onConfirm: () => Get.back(result: true),
                onCancel: () => Get.back(result: false),
              );
              if (confirm == true) {
                await controller.deleteUserById(user.id!);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.users.length;

  @override
  int get selectedRowCount => 0;
}
