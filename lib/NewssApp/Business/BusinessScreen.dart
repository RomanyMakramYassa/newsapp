import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../NewsApp/cubit.dart';
import '../../NewsApp/states.dart';
import '../../shared/coponanet/coponanet.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var LList = NewsCubit.get(context).businesss;
          return ConditionalBuilder(
              condition: LList.length > 0,
              builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      NewsArticleItem(LList[index], context),
                  separatorBuilder: (context, index) => Container(
                        height: 3.00,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                  itemCount: 10),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        });
  }
}
