import 'package:flutter/material.dart';
import 'dart:async';

class InfiniteScroll extends StatefulWidget{
  final List<Widget> children;
  InfiniteScroll({this.children});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfiniteScrollState();
  }
}

class _InfiniteScrollState extends State<InfiniteScroll>{
  List<Widget> children;
  ScrollController s;
  int _pos;

  @override
  void initState() {
    _pos=1;
    children = [widget.children[widget.children.length - 1]];
    for (int i = 0; i < widget.children.length; ++i) {
      children.add(widget.children[i]);
    }
    if (widget.children.length > 1) {
      children.add(children[1]);
    }
    s = PageController();
    super.initState();
     WidgetsBinding.instance
        .addPostFrameCallback((_){
          s.jumpTo(MediaQuery.of(context).size.width);
        });
 
  }
  


  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: s,
      onPageChanged: (int i) {
        setState(() {
          _pos=i+1;
        });
        if (i == children.length - 1) {
          Timer(Duration(milliseconds: 400), () {
            s.jumpTo(MediaQuery.of(context).size.width);
          });
          setState(() {
          _pos=1;
        });

        } else if (i == 0) {
          Timer(Duration(milliseconds: 400), () {
            s.jumpTo(MediaQuery.of(context).size.width * (children.length - 2));
          });
          setState(() {
            _pos=children.length-2;
          });
        }
        
      },
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      itemCount: children.length,
    );
  }
}
