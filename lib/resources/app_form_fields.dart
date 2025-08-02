import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzia/resources/app_colors.dart';
import 'package:quizzia/resources/app_images.dart';
import 'package:quizzia/resources/app_strings.dart';

class CustomAppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool optional;
  final bool autofocus;
  final bool enabled;
  final TextCapitalization? textCapitalization;
  final bool hasBottomPadding;

  const CustomAppTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.enabled = true,
    this.optional = false,
    this.textCapitalization,
    this.hasBottomPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 58,
            child: TextFormField(
              enabled: enabled,
              autofocus: autofocus,
              cursorColor: AppColors.black,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: enabled ? AppColors.primary50 : AppColors.grey200,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: suffixWidget,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 21),
                hintStyle: const TextStyle(
                  color: AppColors.grey200,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                      color: AppColors.transparent, width: 2.0),
                ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;

  const CustomSearchTextFormField({
    super.key,
    this.controller,
    this.labelText = '',
    this.hintText = '',
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        autofocus: autofocus,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4, left: 10, right: 10),
          hintText: hintText ?? AppStrings.searchForAnything,
          hintStyle: const TextStyle(
            color: AppColors.grey200,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 36, maxWidth: 36),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 36, maxWidth: 36),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: AppImages.svgSearchIcon,
          ),
        ),
        inputFormatters: inputFormatters,
        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}

class CustomAppLongTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;
  final TextCapitalization? textCapitalization;

  const CustomAppLongTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.minLines = 5,
    this.maxLines,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.enabled = true,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            enabled: enabled,
            autofocus: autofocus,
            cursorColor: AppColors.black,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: enabled ? AppColors.primary50 : AppColors.grey200,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: suffixWidget,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 21),
              hintStyle: const TextStyle(
                color: AppColors.grey200,
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: AppColors.transparent, width: 2.0),
              ),
            ),
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
          ),
        ],
      ),
    );
  }
}
