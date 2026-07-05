import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/wallet_asset_icon.dart';
import 'package:flutter/material.dart';

/// Figma slide-to-confirm control (e.g. "Slide to Swap").
class WalletSlideConfirm extends StatefulWidget {
  const WalletSlideConfirm({
    required this.label,
    required this.onConfirmed,
    super.key,
  });

  final String label;
  final VoidCallback onConfirmed;

  static const double _height = 80;
  static const double _thumbSize = 64;

  @override
  State<WalletSlideConfirm> createState() => _WalletSlideConfirmState();
}

class _WalletSlideConfirmState extends State<WalletSlideConfirm> {
  static const Duration _snapDuration = Duration(milliseconds: 220);

  double _dragOffset = 0;
  bool _confirmed = false;
  bool _isDragging = false;

  void _onDragStart() {
    if (_confirmed) {
      return;
    }
    setState(() => _isDragging = true);
  }

  void _onDragUpdate(DragUpdateDetails details, double maxOffset) {
    if (_confirmed) {
      return;
    }
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dx).clamp(0.0, maxOffset);
    });
  }

  void _onDragEnd(double maxOffset) {
    if (_confirmed) {
      return;
    }
    if (_dragOffset >= maxOffset * 0.85) {
      setState(() {
        _isDragging = false;
        _dragOffset = maxOffset;
        _confirmed = true;
      });
      widget.onConfirmed();
      return;
    }
    setState(() {
      _isDragging = false;
      _dragOffset = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxOffset =
            (constraints.maxWidth - WalletSlideConfirm._thumbSize)
                .clamp(0.0, double.infinity)
                .toDouble();
        final progress = maxOffset == 0 ? 0.0 : _dragOffset / maxOffset;

        return SizedBox(
          height: WalletSlideConfirm._height,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: WalletSlideConfirm._height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: AppColors.titleGradient,
                  border: Border.all(color: const Color(0x0C000000)),
                ),
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 1 - progress * 0.6,
                  child: Text(widget.label, style: labelStyle),
                ),
              ),
              AnimatedPositioned(
                duration: _isDragging ? Duration.zero : _snapDuration,
                curve: Curves.easeOutCubic,
                left: _dragOffset + 8,
                child: GestureDetector(
                  key: const ValueKey('slide-thumb'),
                  onHorizontalDragStart: (_) => _onDragStart(),
                  onHorizontalDragUpdate: (details) =>
                      _onDragUpdate(details, maxOffset),
                  onHorizontalDragEnd: (_) => _onDragEnd(maxOffset),
                  child: Container(
                    width: WalletSlideConfirm._thumbSize,
                    height: WalletSlideConfirm._thumbSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: WalletAssetIcon(
                      _confirmed
                          ? WalletAssets.iconCheck
                          : WalletAssets.iconArrow,
                      size: DesignConstants.iconSize32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
