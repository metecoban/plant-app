import 'package:flutter/material.dart';
import 'package:plant_app/app/theme/app_colors.dart';
import 'package:plant_app/app/theme/app_radius.dart';
import 'package:plant_app/app/theme/app_spacing.dart';
import 'package:plant_app/app/theme/app_theme_extensions.dart';
import 'package:plant_app/core/i18n/strings.g.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/features/home/presentation/widgets/plant_image.dart';
import 'package:plant_app/gen/assets.gen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({required this.questions, super.key});

  final List<Question> questions;

  static const _premiumBannerColor = Color(0xFF24201A);
  static const _premiumGold = Color(0xFFE5C07B);
  static const _questionCarouselHeight = 164.0;
  static const _questionPeek = 72.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TopSection(greeting: _timeGreeting()),
        const SizedBox(height: AppSpacing.item),
        const _SearchBar(),
        const SizedBox(height: AppSpacing.item),
        const _PremiumBanner(),
        if (questions.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.section),
          _QuestionCarousel(
            questions: questions,
            height: _questionCarouselHeight,
            peek: _questionPeek,
          ),
        ],
      ],
    );
  }

  ({String text, String emoji}) _timeGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return (text: t.home.goodMorning, emoji: '☀️');
    }

    if (hour < 17) {
      return (text: t.home.goodAfternoon, emoji: '⛅');
    }

    return (text: t.home.goodEvening, emoji: '🌙');
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({required this.greeting});

  final ({String text, String emoji}) greeting;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -8,
          left: 0,
          right: 0,
          child: Image(
            image: Assets.images.home.appbar.provider(),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.horizontal,
            AppSpacing.compact,
            AppSpacing.horizontal,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.home.greeting,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppPalette.subText,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${greeting.text} ${greeting.emoji}',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  color: AppPalette.mainText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalPadding,
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          hintText: t.home.searchHint,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: AppPalette.subText.withValues(alpha: 0.7),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppPalette.subText.withValues(alpha: 0.6),
          ),
          filled: true,
          fillColor: AppPalette.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.item,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
            borderSide: BorderSide(
              color: AppPalette.subText.withValues(alpha: 0.12),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
            borderSide: BorderSide(
              color: AppPalette.subText.withValues(alpha: 0.12),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.full),
            borderSide: BorderSide(
              color: AppPalette.primary.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }
}

class _PremiumBanner extends StatelessWidget {
  const _PremiumBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.horizontalPadding,
      child: Material(
        color: HomeHeader._premiumBannerColor,
        borderRadius: BorderRadius.circular(AppRadius.r12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.item,
              vertical: 14,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Assets.icons.home.email.svg(height: 46),

                  const SizedBox(width: AppSpacing.item),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          t.home.premiumTitle,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: HomeHeader._premiumGold,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          t.home.premiumSubtitle,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: HomeHeader._premiumGold.withValues(
                              alpha: 0.75,
                            ),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: HomeHeader._premiumGold.withValues(alpha: 0.9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuestionCarousel extends StatelessWidget {
  const _QuestionCarousel({
    required this.questions,
    required this.height,
    required this.peek,
  });

  final List<Question> questions;
  final double height;
  final double peek;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = AppSpacing.contentWidth(constraints.maxWidth) - peek;

        return SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.horizontalPadding,
            itemCount: questions.length,
            separatorBuilder: (_, _) =>
                const SizedBox(width: AppSpacing.compact),
            itemBuilder: (context, index) {
              return _QuestionCard(
                question: questions[index],
                width: cardWidth,
                height: height,
              );
            },
          ),
        );
      },
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    required this.width,
    required this.height,
  });

  final Question question;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r12),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PlantImage(imageUrl: question.imageUrl),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.65),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.item),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  question.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
