import 'package:flipper/domain/redux/app_actions/actions.dart';
import 'package:flipper/domain/redux/app_state.dart';
import 'package:flipper/model/item.dart';
import 'package:flipper/model/key_pad.dart';
import 'package:flipper/presentation/home/common_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

class KeyPadButtons extends StatefulWidget {
  KeyPadButtons({Key key}) : super(key: key);

  @override
  _KeyPadButtonsState createState() => _KeyPadButtonsState();
}

class _KeyPadButtonsState extends State<KeyPadButtons> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CommonViewModel>(
      distinct: true,
      converter: CommonViewModel.fromStore,
      builder: (context, vm) {
        return Container(
          child: Container(
              child: Wrap(
            children: _buildButtons(vm),
          )),
        );
      },
    );
  }

  List<Widget> _buildButtons(CommonViewModel vm) {
    List<int> list = new List<int>();
    list.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
    List<Widget> widget = new List<Widget>();

    for (var i = 1; i < list.length; i++) {
      widget.add(
        SingleKey(
          keypadValue: i.toString(),
          vm: vm,
        ),
      );
    }
    widget.add(SingleKey(
      keypadValue: "0",
      vm: vm,
    ));
    widget.add(SingleKey(
      keypadValue: "C",
      vm: vm,
    ));
    widget.add(SingleKey(
      keypadValue: "+",
      vm: vm,
    ));
    return widget;
  }
}

class SingleKey extends StatelessWidget {
  const SingleKey({
    Key key,
    @required this.keypadValue,
    this.vm,
  }) : super(key: key);

  final String keypadValue;
  final CommonViewModel vm;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136.99,
      child: InkWell(
        enableFeedback: false,
        onTap: () async {
          HapticFeedback.vibrate();
          if (keypadValue == "C") {
            StoreProvider.of<AppState>(context).dispatch(CleanKeyPad());
            return;
          }
          if (keypadValue == "+") {
            Item cartItem = Item(
              (b) => b
                ..id = vm.customItem.id
                ..name = vm.customItem.name
                ..branchId = vm.customItem.branchId
                ..unitId = vm.customItem.unitId
                ..price = 200 //todo: change this
                ..parentName = vm.customItem.name
                ..categoryId = vm.customItem.categoryId
                ..color = vm.customItem.color
                ..count = 1,
            );

            StoreProvider.of<AppState>(context).dispatch(
              AddItemToCartAction(cartItem: cartItem),
            );
            StoreProvider.of<AppState>(context).dispatch(SaveCartCustom());
            //push into cart items and dispatch SaveCart
            //save carts
            //add to sale and clear the keypad
            StoreProvider.of<AppState>(context).dispatch(CleanKeyPad());
          } else {
            StoreProvider.of<AppState>(context).dispatch(
              KayPadAction(
                keyPad: KeyPad((k) => k
                  ..amount = vm.keypad == null
                      ? int.parse(keypadValue)
                      : int.parse(vm.keypad.amount.toString() + keypadValue)
                  ..note = "note"),
              ),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              width: 0.5,
            ),
          ),
          padding: EdgeInsets.fromLTRB(55, 21, 20, 20),
          child: Text(keypadValue.toString(),
              style: TextStyle(fontSize: 40, fontFamily: "Heebo-Thin")),
        ),
      ),
    );
  }
}