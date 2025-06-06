import 'package:admin/common/widgets/containers/rounded_container.dart';
import 'package:admin/common/widgets/texts/section_heading.dart';
import 'package:admin/utils/constants/colors.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:iconsax/iconsax.dart';

class TDashboardCard extends StatelessWidget {
  const TDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = TColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(TSizes.lg),
      child: Column(
        children: [
          TSectionHeading(title: title, textColor: TColors.textSecondary),
          const SizedBox(height: TSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subTitle, style: Theme.of(context).textTheme.headlineMedium),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(icon, color: color, size: TSizes.iconSm),
                        Text(
                          '$stats%',
                          style: Theme.of(context).textTheme.titleLarge!.apply(color: color, overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 135,
                    child: Text(
                      'Compared to Dec 2025',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}