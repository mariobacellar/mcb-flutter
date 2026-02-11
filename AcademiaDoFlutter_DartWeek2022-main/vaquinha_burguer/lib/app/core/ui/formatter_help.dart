//esta classe utiliza o package intl

import 'package:intl/intl.dart';

class FormatterHelp {
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: r'R$',
  );
  FormatterHelp._();

  static String formatCurrency(double value) {
    return _currencyFormat.format(value);
  }
}
