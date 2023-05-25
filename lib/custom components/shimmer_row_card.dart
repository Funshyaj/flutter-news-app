import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRowCard extends StatelessWidget {
  const ShimmerRowCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.0,
        child: Shimmer.fromColors(
            period: const Duration(milliseconds: 1000),
            direction: ShimmerDirection.ttb,
        baseColor: Colors.grey,
        highlightColor: Colors.white38,
      child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 230,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                )
              ),
            ]
        )
    )
    );
  }
}
