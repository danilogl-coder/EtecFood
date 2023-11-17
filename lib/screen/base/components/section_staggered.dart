import 'package:etecfood/models/base_model.dart';
import 'package:etecfood/screen/base/components/item_tile.dart';
import 'package:etecfood/screen/base/components/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class SectionStaggered extends StatelessWidget {
  const SectionStaggered({super.key, required this.section});

  final BaseModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SectionHeader(section: section),
          MasonryGridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: section.items!.length,
          itemBuilder: (context, index) {
          return ItemTile(item: section.items![index]);
          }
          
          ,)
        ],
      ),
    );
  }
}
