import 'package:auto_route/auto_route.dart';
import 'package:customappbar/customappbar.dart';
import 'package:flipper/data/main_database.dart';
import 'package:flipper/domain/redux/app_actions/actions.dart';
import 'package:flipper/domain/redux/app_state.dart';
import 'package:flipper/generated/l10n.dart';
import 'package:flipper/presentation/home/common_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum CategoriesEnum { beverage, drinks, ikawa }

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  Wrap _getCategoriesWidgets(
      List<CategoryTableData> categories, CommonViewModel vm) {
    final List<Widget> list = <Widget>[];
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].name != 'custom') {
        list.add(
          GestureDetector(
            onTap: () {
              for (var y = 0; y < categories.length; y++) {
                vm.database.categoryDao
                    .updateCategory(categories[y].copyWith(focused: false));
              }
              vm.database.categoryDao.updateCategory(
                  categories[i].copyWith(focused: !categories[i].focused));
            },
            child: ListTile(
              title: Text(
                categories[i].name,
                style: const TextStyle(color: Colors.black),
              ),
              // ignore: always_specify_types
              trailing: Radio(
                value: categories[i].id,
                groupValue: categories[i].focused ? categories[i].id : 0, onChanged: (Object value) {  },
                // onChanged: (int categoryId) {},
              ),
            ),
          ),
        );
      }
      list.add(Center(
        child: Container(
          width: 400,
          child: Divider(
            color: Colors.black,
          ),
        ),
      ));
    }
    return Wrap(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CommonViewModel>(
      distinct: true,
      converter: CommonViewModel.fromStore,
      builder: (BuildContext context, CommonViewModel vm) {
        return Scaffold(
          appBar: CommonAppBar(
            onPop: () {
              ExtendedNavigator.of(context).pop();
            },
            showActionButton: false,
            title: S.of(context).category,
            icon: Icons.close,
            multi: 3,
            bottomSpacer: 52,
          ),
          body: Wrap(
            children: <Widget>[
              Center(
                child: Container(
                  width: 400,
                  child: const Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  StoreProvider.of<AppState>(context).dispatch(
                    CreateEmptyTempCategoryAction(name: 'tmp'),
                  );
                 
                  // Router.navigator.pushNamed(Router.createCategoryInputScreen);
                },
                child: ListTile(
                  title: const Text('Create Category',
                      style: TextStyle(color: Colors.black)),
                  trailing: Wrap(
                    children: <Widget>[Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ),
              // ignore: always_specify_types
              StreamBuilder(
                stream: vm.database.categoryDao.getCategoriesStream(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<CategoryTableData>> snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }
                  return _getCategoriesWidgets(snapshot.data, vm);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
