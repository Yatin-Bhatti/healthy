import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  final String title;
  final String asset;
  final Color tileColor;
  final VoidCallback? onTap;

  const FeatureTile({
    super.key,
    required this.title,
    required this.asset,
    required this.tileColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 116,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 105,
              width: 116,
              child: Image.asset(asset, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
