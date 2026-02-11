import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/core/ui/formatter_help.dart';
import 'package:vaquinha_burguer/app/core/ui/widgets/vaquinha_rounded_button.dart';

class PlusMinusButton extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  //parametros que recebem função
  final VoidCallback minusCallBack;
  final VoidCallback plusCallBack;
  final bool calculateTotal;

  const PlusMinusButton({
    Key? key,
    required this.quantity,
    required this.price,
    required this.minusCallBack,
    required this.plusCallBack,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //se for null ele passa vazio
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                VaquinhaRoundedButton(
                  onpressed: minusCallBack,
                  label: '-',
                ),
                Text('$quantity'),
                VaquinhaRoundedButton(
                  onpressed: plusCallBack,
                  label: '+',
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 5),
              constraints: const BoxConstraints(minWidth: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FormatterHelp.formatCurrency(
                      calculateTotal ? price * quantity : price,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
