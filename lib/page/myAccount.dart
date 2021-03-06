import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../global.dart';
import '../component/infoBar.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> with CommonInterface{
  @override
  Widget build(BuildContext context) {
    String me = cUser(context);
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
          color: Color(0xf0eff5ff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: PersonInfoBar(infoMap: cUsermodal(context)),
              margin: EdgeInsets.only(top: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  ModifyItem(text: 'Nickname', keyName: 'nickName', owner: me),
                  ModifyItem(text: 'Avatar', keyName: 'avatar', owner: me),
                  ModifyItem(text: 'Password', keyName: 'passWord', owner: me, useBottomBorder: true)
                ],
              ),
            ),
            Container(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 45),
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 45
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    border: Border(top: borderStyle, bottom: borderStyle)
                  ),
                  child: Text('Log Out', style: TextStyle(color: Colors.red)),
                ),
                onTap: quit,
              ) 
            )
          ],
        )
      )
    );
  }

  void quit() {
    Provider.of<UserModle>(context).isLogin = false;
  }
}

var borderStyle = BorderSide(color: Color(0xffd4d4d4), width: 1.0);

class ModifyItem extends StatelessWidget {
  ModifyItem({this.text, this.keyName, this.owner, this.useBottomBorder = false, });
  final String text;
  final String keyName;
  final String owner;
  final bool useBottomBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.centerLeft,
        //  有了color就不能使用decoration属性，这二者二选一
        //color: Color(0xffffffff),
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 45
        ),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border(top: borderStyle, bottom: useBottomBorder ? borderStyle: BorderSide.none)
        ),
        padding: EdgeInsets.only(left: 10),
        child: Text(text),
      ),
      onTap: () => modify(context, text, keyName, owner),
    );
  }
}

void modify(BuildContext context, String text, String keyName, String owner) {
  Navigator.pushNamed(context, 'modify', arguments: {'text': text, 'keyName': keyName, 'owner': owner });
}