import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SketchMyWishesScreen extends ConsumerStatefulWidget {
  const SketchMyWishesScreen({super.key});

  @override
  ConsumerState<SketchMyWishesScreen> createState() =>
      _SketchMyWishesScreenState();
}

class _SketchMyWishesScreenState extends ConsumerState<SketchMyWishesScreen> {
  final List<SketchPoint?> _points = [];
  Color _selectedColor = Colors.orange;
  double _strokeWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SketchMyWishes v1 — Esquisses 3D & Idées'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Effacer tout',
            onPressed: () {
              setState(() {
                _points.clear();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.save_alt_rounded),
            tooltip: 'Sauvegarder l’esquisse',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Esquisse sauvegardée dans le projet !'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Toolbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
            child: Row(
              children: [
                const Text(
                  'Couleur :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                _colorButton(Colors.orange),
                _colorButton(Colors.blue),
                _colorButton(Colors.green),
                _colorButton(Colors.indigo),
                _colorButton(Colors.black),
                const Spacer(),
                const Text(
                  'Épaisseur :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                  child: Slider(
                    value: _strokeWidth,
                    min: 1.0,
                    max: 20.0,
                    activeColor: _selectedColor,
                    onChanged: (val) {
                      setState(() {
                        _strokeWidth = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Drawing Canvas
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      Offset localPosition = renderBox.globalToLocal(
                        details.globalPosition,
                      );
                      _points.add(
                        SketchPoint(
                          point: localPosition,
                          paint: Paint()
                            ..color = _selectedColor
                            ..style = PaintingStyle.stroke
                            ..strokeCap = StrokeCap.round
                            ..strokeWidth = _strokeWidth,
                        ),
                      );
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      _points.add(null);
                    });
                  },
                  child: CustomPaint(
                    painter: SketchPainter(points: _points),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorButton(Color color) {
    final isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 6)]
              : [],
        ),
      ),
    );
  }
}

class SketchPoint {
  SketchPoint({required this.point, required this.paint});

  final Offset point;
  final Paint paint;
}

class SketchPainter extends CustomPainter {
  SketchPainter({required this.points});

  final List<SketchPoint?> points;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.point,
          points[i + 1]!.point,
          points[i]!.paint,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(ui.PointMode.points, [
          points[i]!.point,
        ], points[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) => true;
}
