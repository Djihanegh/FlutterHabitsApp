import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pavlok_test/bloc/time_bloc.dart';
import 'package:pavlok_test/main.dart';

import '../../../utils/app_style.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*BlocBuilder<TimeCubit, Time>(
          builder: (context, state) { */
            
     // final time = ref.watch(timeProvider);

       AutoSizeText(
        "Over your sleep goal ( 8hrs )",
        style: TextStyles.medium.copyWith(color: Colors.black, fontSize: 14),
      );
    
  }
}
