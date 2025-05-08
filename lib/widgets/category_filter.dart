import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            'Sort by',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(10),
          SvgPicture.asset('assets/svgs/select.svg'),
          Spacer(),
          SvgPicture.asset('assets/svgs/filter.svg'),
          Gap(10),
          Text(
            'Filter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(10),
          SvgPicture.asset('assets/svgs/grid.svg'),
          Gap(10),
          SvgPicture.asset('assets/svgs/groups.svg'),
        ],
      ),
    );
  }
}
