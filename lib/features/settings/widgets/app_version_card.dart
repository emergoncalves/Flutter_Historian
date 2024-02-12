import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppVersionCard extends StatelessWidget {
  const AppVersionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).buttonTheme.colorScheme!.background,
        borderRadius: BorderRadius.circular(4),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.content_paste,
            color: Colors.teal,
            size: 22,
          ),
          const SizedBox(width: 8),
          Text(
            'Historian v0.1',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }
}