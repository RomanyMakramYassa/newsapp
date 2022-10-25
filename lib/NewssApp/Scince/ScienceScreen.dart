import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/coponanet/coponanet.dart';
import '../../NewsApp/cubit.dart';
import '../../NewsApp/states.dart';

//import '../../layout/NewsApp/cubit.dart';
//import '../../layout/NewsApp/states.dart';
//import '../../shared/coponanet/coponanet.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var llist = NewsCubit.get(context).Science;
          return ConditionalBuilder(
            condition: llist.length > 0,
            builder: (BuildContext context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    NewsArticleItem(llist[index], context),
                separatorBuilder: (context, index) => Container(
                      height: 3.00,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                itemCount: 5),
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          );
        });
  }
}
