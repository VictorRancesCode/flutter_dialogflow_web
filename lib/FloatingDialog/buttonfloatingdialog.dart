import 'package:flutter_web/material.dart';

class ButtonFloatingDialog extends StatefulWidget {
  ButtonFloatingDialog({
    Key key,
    @required this.child,
    this.childButton,
    this.widthCard,
    this.heightCard,
    this.decorationCard,
    this.duration,
    this.paddingCard,
    this.marginCard,
  }) : super(key: key);

  Widget child;
  Widget childButton;
  double heightCard;
  double widthCard;
  BoxDecoration decorationCard;
  Duration duration;
  EdgeInsets paddingCard;
  EdgeInsets marginCard;

  @override
  _ButtonFloatingDialog createState() => new _ButtonFloatingDialog();
}

class _ButtonFloatingDialog extends State<ButtonFloatingDialog> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AnimatedOpacity(
            opacity: open ? 1 : 0,
            duration: widget.duration ?? Duration(milliseconds: 500),
            child: new Container(
              height: widget.heightCard ?? 400.0,
              width: widget.widthCard ?? 250.0,
              margin: widget.marginCard ?? EdgeInsets.only(bottom: 4.0, right: 40.0),
              padding: widget.paddingCard ?? EdgeInsets.all(10.0),
              decoration: widget.decorationCard ??
                  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
              child: widget.child,
            ),
          ),
          new FloatingActionButton(
            onPressed: () {
              setState(() {
                open = !open;
              });
            },
            child: widget.childButton ?? open? Icon(Icons.close): Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
