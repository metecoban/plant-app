import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/app/di/injection.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/core/presentation/base_view.dart';
import 'package:plant_app/features/home/domain/entities/plant.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:plant_app/features/home/presentation/bloc/home_event.dart';
import 'package:plant_app/features/home/presentation/bloc/home_state.dart';
import 'package:plant_app/features/home/presentation/pages/diagnose_page.dart';
import 'package:plant_app/features/home/presentation/pages/my_garden_page.dart';
import 'package:plant_app/features/home/presentation/pages/profile_page.dart';
import 'package:plant_app/features/home/presentation/pages/scan_page.dart';
import 'package:plant_app/features/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:plant_app/features/home/presentation/widgets/home_header.dart';
import 'package:plant_app/features/home/presentation/widgets/plant_list.dart';
import 'package:plant_app/shared/widgets/common_empty_view.dart';
import 'package:plant_app/shared/widgets/common_error_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeNavItem _currentNavItem = HomeNavItem.home;
  bool _showScan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.homeBackground,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: _showScan ? const ScanPage() : _buildTabContent(),
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentItem: _currentNavItem,
        onItemSelected: (item) {
          setState(() {
            _currentNavItem = item;
            _showScan = false;
          });
        },
      ),
      floatingActionButton: HomeScanFab(
        onPressed: () => setState(() => _showScan = true),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTabContent() {
    return switch (_currentNavItem) {
      HomeNavItem.home => BaseView<HomeBloc, HomeState>(
        create: (_) => getIt<HomeBloc>()..add(const HomeEvent.started()),
        builder: (context, state) => _HomeBody(state: state),
      ),
      HomeNavItem.diagnose => const DiagnosePage(),
      HomeNavItem.myGarden => const MyGardenPage(),
      HomeNavItem.profile => const ProfilePage(),
    };
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      HomeInitial() => const Skeletonizer(child: _HomeScrollContent()),
      HomeLoading() => const Skeletonizer(child: _HomeScrollContent()),
      HomeEmpty() => CommonEmptyView(
        message: t.home.emptyMessage,
        onAction: () =>
            context.read<HomeBloc>().add(const HomeEvent.retryRequested()),
        actionLabel: t.common.retry,
      ),
      HomeFailure(:final failure) => CommonErrorView(
        message: failure.message,
        onRetry: () =>
            context.read<HomeBloc>().add(const HomeEvent.retryRequested()),
      ),
      HomeSuccess(:final isRefreshing) => RefreshIndicator(
        onRefresh: () async {
          final bloc = context.read<HomeBloc>()
            ..add(const HomeEvent.refreshed());
          await bloc.stream.firstWhere(
            (next) => next is! HomeSuccess || !next.isRefreshing,
          );
        },
        color: AppPalette.primary,
        child: Skeletonizer(
          enabled: isRefreshing,
          child: const _HomeScrollContent(),
        ),
      ),
    };
  }
}

class _HomeScrollContent extends StatelessWidget {
  const _HomeScrollContent();

  static final _placeholderQuestions = List<Question>.generate(
    2,
    (index) => Question(
      id: index,
      title: 'How to identify plants easily with PlantApp?',
      subtitle: 'Subtitle',
      imageUrl: 'https://picsum.photos/seed/q$index/400/200',
      linkUrl: '',
      order: index,
    ),
  );

  static final _placeholderPlants = List<Plant>.generate(
    4,
    (index) => Plant(
      id: index,
      name: 'plant',
      title: 'Edible Plants',
      rank: index,
      imageUrl: 'https://picsum.photos/seed/p$index/100/100',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: BlocSelector<HomeBloc, HomeState, List<Question>>(
            selector: _selectQuestions,
            builder: (context, questions) {
              return HomeHeader(questions: questions);
            },
          ),
        ),
        BlocSelector<HomeBloc, HomeState, List<Plant>>(
          selector: _selectPlants,
          builder: (context, plants) {
            if (plants.isEmpty) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }

            return PlantList(plants: plants);
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 88)),
      ],
    );
  }

  static List<Question> _selectQuestions(HomeState state) {
    return switch (state) {
      HomeSuccess(:final questions) => questions,
      _ => _placeholderQuestions,
    };
  }

  static List<Plant> _selectPlants(HomeState state) {
    return switch (state) {
      HomeSuccess(:final plants) => plants,
      _ => _placeholderPlants,
    };
  }
}
