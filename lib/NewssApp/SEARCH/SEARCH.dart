//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../NewsApp/cubit.dart';
import '../../NewsApp/states.dart';
import '../../shared/coponanet/coponanet.dart';

//import '../../layout/NewsApp/cubit.dart';

class bbbb extends StatelessWidget {
  // bbbb({Key? key}) : super(key: key);
  var searchcontrolee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, NewsStates states) {
          var lost = NewsCubit.get(context).Search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.00),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchcontrolee,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'add search';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      NewsCubit.get(context).GetSearch(val);
                    },
                    decoration: InputDecoration(
                      label: Text('Search'),
                      prefix: Icon(Icons.search),
                    ),
                    //   controller: searchcontrolee,
                    // : TextInputType.text,
                    // onchanget: (val) {
                    //
                    // },
                    //onsubmitt: () {},
                    //ontap: () {},
                    // label: 'Search',
                    // icn: Icons.search,
                  ),
                ),
                Expanded(
                  child: BuldSearchitem(lost, context, issearch: true),
                  /*  child: Padding(
                    padding: EdgeInsetsDirectional.all(
                      10.00,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          //${Article['urlToImage']}
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(8.00),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10.00,
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                  ' title',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                Text(
                                  ' publishedAt',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.00),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, NewsStates states) {});
  }
}
