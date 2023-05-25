import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBoxCard extends StatelessWidget {
  const ShimmerBoxCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 180,
      width: width * 0.83,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
              direction: ShimmerDirection.ttb,
              baseColor: Colors.grey,
              highlightColor: Colors.white24,
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         width: double.infinity,
                         decoration:  BoxDecoration(
                           color: Colors.grey[400],
                           borderRadius: const BorderRadius.all(Radius.circular(10)),
                         ),
                       ),
                     ),
                   ],
                 )
          ),
    );
  }
}