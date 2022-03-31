// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:italms/utils/CardItem.dart';
import 'package:italms/utils/CustomAppBarWidget.dart';
import 'package:italms/utils/FunctinsData.dart';

// ignore: must_be_immutable
class OnlineExaminationHome extends StatefulWidget {
  var _titles;
  var _images;
  var id;

  OnlineExaminationHome(this._titles, this._images, {this.id});

  @override
  _HomeState createState() => _HomeState(_titles, _images);
}

class _HomeState extends State<OnlineExaminationHome> {
  bool isTapped;
  int currentSelectedIndex;
  var _titles;
  var _images;

  _HomeState(this._titles, this._images);

  @override
  void initState() {
    super.initState();
    isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Online Exam'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          itemCount: _titles.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return CustomWidget(
              index: index,
              isSelected: currentSelectedIndex == index,
              onSelect: () {
                setState(() {
                  currentSelectedIndex = index;
                  AppFunction.getOnlineExaminationDashboardPage(
                      context, _titles[index],
                      id: widget.id);
                });
              },
              headline: _titles[index],
              icon: _images[index],
            );
          },
        ),
      ),
    );
  }
}
