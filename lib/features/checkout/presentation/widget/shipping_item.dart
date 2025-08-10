import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Container(
            padding: const EdgeInsets.only(
              top: 16,
              left: 13,
              right: 28,
              bottom: 16,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0x33D9D9D9),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.transparent),
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isSelected
                      ? ActiveShippindItemDot()
                      : InActiveShippindItemDot(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.semiBold13),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.regular13
                            .copyWith(color: AppColors.gray400),
                      )
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "$price جنية",
                      style: AppTextStyles.bold13
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class InActiveShippindItemDot extends StatelessWidget {
  const InActiveShippindItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E),
          ),
        ),
      ),
    );
  }
}

class ActiveShippindItemDot extends StatelessWidget {
  const ActiveShippindItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: AppColors.green1_500,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: Colors.white),
        ),
      ),
    );
  }
}
