import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: .75,
                backgroundColor: AppColors.chartSecondary,
                valueColor: 
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(child: Text('75%', style: AppTextStyles.heading)),
        ],
      ),
    );
  }
}
