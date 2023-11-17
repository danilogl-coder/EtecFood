import 'package:etecfood/models/base_model.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.section});

  final BaseModel section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "${section.name}",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
      ),
    );
  }
}
