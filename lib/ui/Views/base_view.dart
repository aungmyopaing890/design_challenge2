// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:design_challenge2/core/viewmodels/base_model.dart';
import 'package:design_challenge2/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;

  BaseView({
    required this.builder,
    required this.onModelReady,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  initState() {
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
