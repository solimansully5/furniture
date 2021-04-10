import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/utilities/colors.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final bool centered;
  final IconData iconData;
  final Function() onPress;
  const AuthButton({
    Key key, this.text, this.iconData, this.onPress, this.centered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      color: AppColors.main,
      shape: GFButtonShape.pills,
      fullWidthButton: true,
      size: GFSize.LARGE,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: centered == false
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: <Widget>[
              iconData == null
                  ? SizedBox.shrink()
                  : Icon(iconData, color: Colors.white, size: 20,),
              SizedBox(width: iconData == null ? 0 : 25,),
              Text(text)
            ],
          ),
        ),
      ),
      onPressed: onPress,
    );
  }
}
