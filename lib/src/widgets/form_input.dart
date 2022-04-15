import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    this.inputTitle = 'Título',
    this.placeHolder = 'Escribe aquí.',
    required this.onChanged,
  }) : super(key: key);

  final String inputTitle;
  final String placeHolder;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          style: Theme.of(context).textTheme.bodyText2,
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
            counter: const Offstage(),
            hintText: placeHolder,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEBEBEB),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 10.0,
            ),
            errorMaxLines: 3,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
