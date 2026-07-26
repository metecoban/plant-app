import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView<B extends BlocBase<S>, S> extends StatelessWidget {
  const BaseView({
    required this.create,
    required this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    super.key,
  });

  final B Function(BuildContext context) create;
  final Widget Function(BuildContext context, S state) builder;
  final void Function(BuildContext context, S state)? listener;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocListenerCondition<S>? listenWhen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: create,
      child: listener == null
          ? BlocBuilder<B, S>(buildWhen: buildWhen, builder: builder)
          : BlocConsumer<B, S>(
              buildWhen: buildWhen,
              listenWhen: listenWhen,
              listener: listener!,
              builder: builder,
            ),
    );
  }
}
