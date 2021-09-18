import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialTextInputWidget extends StatelessWidget {
  const MaterialTextInputWidget({
    Key? key,
    this.icon,
    this.title,
    this.inputType,
    this.formatters,
    this.onTextChanged,
    this.validator,
    this.maxLength,
    this.initalValue,
    this.controller,
    this.label,
    this.obsecureText = false,
    this.readonly = false,
  }) : super(key: key);
  final String? title;
  final IconData? icon;
  final Widget? label;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatters;
  final void Function(String?)? onTextChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final String? initalValue;
  final bool readonly;
  final bool obsecureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        color: Colors.blueGrey.withAlpha(40),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: TextFormField(
          autofocus: true,
          onChanged: onTextChanged,
          minLines: 1,
          controller: controller,
          readOnly: readonly,
          initialValue: initalValue,
          maxLength: maxLength,
          validator: validator,
          keyboardType: inputType,
          obscureText: obsecureText,
          inputFormatters: formatters,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: '',
            labelText: title,
            label: label,
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(DiagnosticsProperty<IconData?>('icon', icon));
    properties.add(DiagnosticsProperty<TextInputType?>('inputType', inputType));
    properties.add(ObjectFlagProperty<void Function(String? p1)>.has('onTextChanged', onTextChanged));
    properties.add(IterableProperty<TextInputFormatter>('formatters', formatters));
    properties.add(ObjectFlagProperty<String? Function(String? p1)>.has('validator', validator));
    properties.add(IntProperty('maxLength', maxLength));
    properties.add(StringProperty('initalValue', initalValue));
    properties.add(DiagnosticsProperty<bool>('readonly', readonly));
    properties.add(DiagnosticsProperty<TextEditingController?>('controller', controller));
    properties.add(DiagnosticsProperty<bool>('obsecureText', obsecureText));
  }
}
