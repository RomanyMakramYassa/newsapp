import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/NewsApp/states.dart';

import '../../shared/coponanet/coponanet.dart';
import '../NewssApp/SEARCH/SEARCH.dart';
import '../shared/cubit/cubit.dart';
import 'cubit.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bbbb()));
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_medium_rounded),
                onPressed: () {
                  AppCubit.getApp(context).changmode();
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.Botonc,
            onTap: (index) {
              cubit.cnangboton(index);
            },
            currentIndex: cubit.Curentboton,
          ),
          body: cubit.Screen[cubit.Curentboton],
        );
      },
    );
  }
}
