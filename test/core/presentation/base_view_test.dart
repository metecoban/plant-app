import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/core/presentation/base_view.dart';

enum _TestStatus { initial, listened }

class _TestState {
  const _TestState({this.value = 0, this.status = _TestStatus.initial});

  final int value;
  final _TestStatus status;

  _TestState copyWith({int? value, _TestStatus? status}) {
    return _TestState(
      value: value ?? this.value,
      status: status ?? this.status,
    );
  }
}

class _TestCubit extends Cubit<_TestState> {
  _TestCubit() : super(const _TestState());

  void increment() => emit(state.copyWith(value: state.value + 1));

  void markListened() => emit(state.copyWith(status: _TestStatus.listened));
}

void main() {
  testWidgets('BaseView creates bloc from create callback', (tester) async {
    var created = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BaseView<_TestCubit, _TestState>(
          create: (_) {
            created = true;
            return _TestCubit();
          },
          builder: (context, state) => Text('value:${state.value}'),
        ),
      ),
    );

    expect(created, isTrue);
    expect(find.text('value:0'), findsOneWidget);
  });

  testWidgets('BaseView builder rebuilds when state changes', (tester) async {
    late _TestCubit cubit;

    await tester.pumpWidget(
      MaterialApp(
        home: BaseView<_TestCubit, _TestState>(
          create: (_) => cubit = _TestCubit(),
          builder: (context, state) => Text('value:${state.value}'),
        ),
      ),
    );

    cubit.increment();
    await tester.pump();

    expect(find.text('value:1'), findsOneWidget);
  });

  testWidgets('BaseView listener is triggered on state change', (tester) async {
    late _TestCubit cubit;
    var listenCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: BaseView<_TestCubit, _TestState>(
          create: (_) => cubit = _TestCubit(),
          listener: (_, _) => listenCount++,
          builder: (context, state) => Text('status:${state.status.name}'),
        ),
      ),
    );

    cubit.increment();
    await tester.pump();

    expect(listenCount, 1);
  });

  testWidgets('BaseView buildWhen limits builder rebuilds', (tester) async {
    late _TestCubit cubit;
    var buildCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: BaseView<_TestCubit, _TestState>(
          create: (_) => cubit = _TestCubit(),
          buildWhen: (previous, current) => previous.value != current.value,
          builder: (context, state) {
            buildCount++;
            return Text('value:${state.value}');
          },
        ),
      ),
    );

    expect(buildCount, 1);

    cubit.markListened();
    await tester.pump();
    expect(buildCount, 1);

    cubit.increment();
    await tester.pump();
    await tester.pump();

    expect(buildCount, 2);
  });

  testWidgets('BaseView listenWhen limits listener calls', (tester) async {
    late _TestCubit cubit;
    var listenCount = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: BaseView<_TestCubit, _TestState>(
          create: (_) => cubit = _TestCubit(),
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (_, _) => listenCount++,
          builder: (context, state) => Text('value:${state.value}'),
        ),
      ),
    );

    cubit.increment();
    await tester.pump();
    expect(listenCount, 0);

    cubit.markListened();
    await tester.pump();
    expect(listenCount, 1);
  });
}
