import 'package:etecfood/models/base_model.dart';
import 'package:etecfood/screen/base/components/item_tile.dart';
import 'package:etecfood/screen/base/components/section_header.dart';
import 'package:flutter/material.dart';

class SectionList extends StatelessWidget {
  const SectionList({super.key, required this.section});

  final BaseModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section: section),
          SizedBox(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemTile(
                    item: section.items![index]
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 4.0,
                    ),
                itemCount: section.items!.length),
          )
        ],
      ),
    );
  }
}
