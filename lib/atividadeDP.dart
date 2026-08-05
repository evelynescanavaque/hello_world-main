 

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const GymTrackerApp());
}

// =============================================================================
// REGIÃO 2: CORES E TEMA (MATERIAL DESIGN 3)
// =============================================================================

class AppColors {
  static const Color primaryPink = Color(0xFFE91E63);
  static const Color lightPink = Color(0xFFF8BBD0);
  static const Color deepPink = Color(0xFFAD1457);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F7);
  static const Color midGrey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF424242);
  static const Color textSecondary = Color(0xFF757575);
  static const Color success = Color(0xFF4CAF50);
  static const Color cardShadow = Color(0x14000000);
}

class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryPink,
      brightness: Brightness.light,
      primary: AppColors.primaryPink,
      secondary: AppColors.deepPink,
      surface: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.lightGrey,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryPink,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.cardShadow,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPink,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          elevation: 1,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryPink,
          side: const BorderSide(color: AppColors.primaryPink, width: 1.4),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryPink,
        foregroundColor: AppColors.white,
        elevation: 4,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryPink, width: 1.6),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPink;
          }
          return AppColors.white;
        }),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryPink,
        linearTrackColor: AppColors.midGrey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryPink,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.w700, color: AppColors.darkGrey),
        titleMedium: TextStyle(fontWeight: FontWeight.w600, color: AppColors.darkGrey),
        bodyMedium: TextStyle(color: AppColors.darkGrey),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

// =============================================================================
// REGIÃO 3: MODELOS DE DADOS
// =============================================================================

class ExerciseModel {
  String id;
  String name;
  String muscleGroup;
  String imageUrl;
  int sets;
  int reps;
  double weight;
  String notes;
  bool done;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.imageUrl,
    required this.sets,
    required this.reps,
    required this.weight,
    this.notes = '',
    this.done = false,
  });

  ExerciseModel copyWith({
    String? name,
    String? muscleGroup,
    String? imageUrl,
    int? sets,
    int? reps,
    double? weight,
    String? notes,
    bool? done,
  }) {
    return ExerciseModel(
      id: id,
      name: name ?? this.name,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      imageUrl: imageUrl ?? this.imageUrl,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      notes: notes ?? this.notes,
      done: done ?? this.done,
    );
  }
}

class WorkoutModel {
  String id;
  String name;
  String muscleGroup;
  List<ExerciseModel> exercises;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.muscleGroup,
    List<ExerciseModel>? exercises,
  }) : exercises = exercises ?? [];

  int get totalExercises => exercises.length;
  int get completedExercises => exercises.where((e) => e.done).length;
  double get progress =>
      totalExercises == 0 ? 0.0 : completedExercises / totalExercises;
  int get progressPercent => (progress * 100).round();
}

class MeasurementModel {
  String id;
  String month;
  double weight;
  double muscleMass;
  double bodyFat;

  MeasurementModel({
    required this.id,
    required this.month,
    required this.weight,
    required this.muscleMass,
    required this.bodyFat,
  });
}

// =============================================================================
// REGIÃO 4: DATA STORE
// =============================================================================

class DataStore extends ChangeNotifier {
  DataStore._internal() {
    _seedWorkouts();
    _seedMeasurements();
  }

  static final DataStore instance = DataStore._internal();

  final List<WorkoutModel> _workouts = [];
  final List<MeasurementModel> _measurements = [];

  List<WorkoutModel> get workouts => List.unmodifiable(_workouts);
  List<MeasurementModel> get measurements => List.unmodifiable(_measurements);

  String _newId() =>
      '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(99999)}';

  void addWorkout(WorkoutModel workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void updateWorkout(WorkoutModel updated) {
    final index = _workouts.indexWhere((w) => w.id == updated.id);
    if (index != -1) {
      _workouts[index] = updated;
      notifyListeners();
    }
  }

  void deleteWorkout(String workoutId) {
    _workouts.removeWhere((w) => w.id == workoutId);
    notifyListeners();
  }

  void toggleExerciseDone(String workoutId, String exerciseId, bool value) {
    final workout = _workouts.firstWhere((w) => w.id == workoutId);
    final exercise = workout.exercises.firstWhere((e) => e.id == exerciseId);
    exercise.done = value;
    notifyListeners();
  }

  void addMeasurement(MeasurementModel measurement) {
    _measurements.add(measurement);
    notifyListeners();
  }

  void updateMeasurement(MeasurementModel updated) {
    final index = _measurements.indexWhere((m) => m.id == updated.id);
    if (index != -1) {
      _measurements[index] = updated;
      notifyListeners();
    }
  }

  void deleteMeasurement(String measurementId) {
    _measurements.removeWhere((m) => m.id == measurementId);
    notifyListeners();
  }

  double get overallCompletionRate {
    if (_workouts.isEmpty) return 0;
    final totalExercises =
        _workouts.fold<int>(0, (sum, w) => sum + w.totalExercises);
    final totalDone =
        _workouts.fold<int>(0, (sum, w) => sum + w.completedExercises);
    if (totalExercises == 0) return 0;
    return totalDone / totalExercises;
  }

  double get totalWeightLifted {
    double total = 0;
    for (final w in _workouts) {
      for (final e in w.exercises) {
        if (e.done) total += e.weight * e.sets * e.reps;
      }
    }
    return total;
  }

  void _seedWorkouts() {
    _workouts.addAll([
      WorkoutModel(
        id: _newId(),
        name: 'Treino A - Peito e Tríceps',
        muscleGroup: 'Peito / Tríceps',
        exercises: [
          ExerciseModel(
            id: _newId(),
            name: 'Supino Reto com Barra',
            muscleGroup: 'Peito',
            imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=300',
            sets: 4,
            reps: 10,
            weight: 60,
            done: true,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Supino Inclinado com Halteres',
            muscleGroup: 'Peito',
            imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=300',
            sets: 3,
            reps: 12,
            weight: 22,
            done: true,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Crucifixo na Máquina',
            muscleGroup: 'Peito',
            imageUrl: 'https://images.unsplash.com/photo-1584735175315-9d5df23860e6?w=300',
            sets: 3,
            reps: 15,
            weight: 30,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Tríceps Corda',
            muscleGroup: 'Tríceps',
            imageUrl: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=300',
            sets: 4,
            reps: 12,
            weight: 25,
          ),
        ],
      ),
      WorkoutModel(
        id: _newId(),
        name: 'Treino B - Costas e Bíceps',
        muscleGroup: 'Costas / Bíceps',
        exercises: [
          ExerciseModel(
            id: _newId(),
            name: 'Puxada Frontal',
            muscleGroup: 'Costas',
            imageUrl: 'https://images.unsplash.com/photo-1598268030450-7d3ce7205577?w=300',
            sets: 4,
            reps: 10,
            weight: 55,
            done: true,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Remada Curvada',
            muscleGroup: 'Costas',
            imageUrl: 'https://images.unsplash.com/photo-1584863231364-2edc166de576?w=300',
            sets: 4,
            reps: 10,
            weight: 50,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Rosca Direta',
            muscleGroup: 'Bíceps',
            imageUrl: 'https://images.unsplash.com/photo-1583500178690-f7fd1c1fefb4?w=300',
            sets: 3,
            reps: 12,
            weight: 18,
          ),
        ],
      ),
      WorkoutModel(
        id: _newId(),
        name: 'Treino C - Pernas Completo',
        muscleGroup: 'Pernas',
        exercises: [
          ExerciseModel(
            id: _newId(),
            name: 'Agachamento Livre',
            muscleGroup: 'Pernas',
            imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=300',
            sets: 4,
            reps: 8,
            weight: 80,
            done: true,
          ),
          ExerciseModel(
            id: _newId(),
            name: 'Leg Press 45°',
            muscleGroup: 'Pernas',
            imageUrl: 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?w=300',
            sets: 4,
            reps: 12,
            weight: 140,
            done: true,
          ),
        ],
      ),
    ]);
  }

  void _seedMeasurements() {
    _measurements.addAll([
      MeasurementModel(
        id: _newId(),
        month: 'Maio/2026',
        weight: 82.5,
        muscleMass: 36.2,
        bodyFat: 22.0,
      ),
      MeasurementModel(
        id: _newId(),
        month: 'Junho/2026',
        weight: 81.0,
        muscleMass: 37.0,
        bodyFat: 20.5,
      ),
      MeasurementModel(
        id: _newId(),
        month: 'Julho/2026',
        weight: 79.8,
        muscleMass: 37.9,
        bodyFat: 18.9,
      ),
    ]);
  }
}

// =============================================================================
// REGIÃO 5: APP RAIZ + HOME SHELL
// =============================================================================

class GymTrackerApp extends StatelessWidget {
  const GymTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Tracker Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    WorkoutsPage(),
    ProgressPage(),
    MeasurementsPage(),
  ];

  final List<String> _titles = const ['Meus Treinos', 'Progresso', 'Medidas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: IndexedStack(
            key: ValueKey<int>(_currentIndex),
            index: _currentIndex,
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'Treinos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded),
            label: 'Progresso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten_rounded),
            label: 'Medidas',
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// REGIÃO 6: PÁGINA DE TREINOS
// =============================================================================

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DataStore.instance,
      builder: (context, _) {
        final workouts = DataStore.instance.workouts;

        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openAddWorkout(context),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Novo Treino'),
          ),
          body: workouts.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 100),
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    return WorkoutCard(workout: workouts[index]);
                  },
                ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.fitness_center_rounded,
                size: 72, color: AppColors.lightPink),
            const SizedBox(height: 16),
            const Text(
              'Nenhum treino cadastrado ainda',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _openAddWorkout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddWorkoutScreen()),
    );
  }
}

class WorkoutCard extends StatefulWidget {
  final WorkoutModel workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final workout = widget.workout;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
              child: Row(
                children: [
                  _buildProgressRing(workout.progress, workout.progressPercent),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workout.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkGrey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          workout.muscleGroup,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: workout.progress,
                            minHeight: 8,
                            backgroundColor: AppColors.lightPink.withAlpha(90),
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.primaryPink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert_rounded,
                        color: AppColors.textSecondary),
                    onSelected: (value) => _handleMenu(context, value),
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'edit', child: Text('Editar treino')),
                      PopupMenuItem(value: 'delete', child: Text('Excluir treino')),
                    ],
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState:
                _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: _buildExerciseList(workout),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRing(double progress, int percent) {
    return SizedBox(
      width: 52,
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 52,
            height: 52,
            child: CircularProgressIndicator(
              value: progress == 0 ? 0.001 : progress,
              strokeWidth: 5,
              backgroundColor: AppColors.lightPink.withAlpha(80),
              valueColor: const AlwaysStoppedAnimation(AppColors.primaryPink),
            ),
          ),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryPink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList(WorkoutModel workout) {
    return Container(
      color: AppColors.lightGrey.withAlpha(150),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        children: workout.exercises
            .map((exercise) => ExerciseTile(
                  exercise: exercise,
                  onChanged: (value) {
                    DataStore.instance.toggleExerciseDone(
                      workout.id,
                      exercise.id,
                      value,
                    );
                  },
                ))
            .toList(),
      ),
    );
  }

  void _handleMenu(BuildContext context, String value) {
    if (value == 'edit') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AddWorkoutScreen(existingWorkout: widget.workout),
        ),
      );
    } else if (value == 'delete') {
      DataStore.instance.deleteWorkout(widget.workout.id);
    }
  }
}

class ExerciseTile extends StatelessWidget {
  final ExerciseModel exercise;
  final ValueChanged<bool> onChanged;

  const ExerciseTile({
    super.key,
    required this.exercise,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              exercise.imageUrl,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 54,
                height: 54,
                color: AppColors.lightPink.withAlpha(80),
                child: const Icon(Icons.fitness_center_rounded,
                    color: AppColors.primaryPink),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration:
                        exercise.done ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  '${exercise.sets}x${exercise.reps} • ${exercise.weight} kg',
                  style: const TextStyle(
                      fontSize: 11.5, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Checkbox(
            value: exercise.done,
            onChanged: (value) => onChanged(value ?? false),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// REGIÃO 7: TELA DE ADICIONAR / EDITAR TREINO
// =============================================================================

class AddWorkoutScreen extends StatefulWidget {
  final WorkoutModel? existingWorkout;
  const AddWorkoutScreen({super.key, this.existingWorkout});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _muscleGroupController;
  late List<ExerciseModel> _exercises;

  bool get _isEditing => widget.existingWorkout != null;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.existingWorkout?.name ?? '');
    _muscleGroupController = TextEditingController(
        text: widget.existingWorkout?.muscleGroup ?? '');
    _exercises = widget.existingWorkout != null
        ? widget.existingWorkout!.exercises
            .map((e) => e.copyWith())
            .toList()
        : <ExerciseModel>[];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _muscleGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Editar Treino' : 'Novo Treino'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do treino'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _muscleGroupController,
                decoration: const InputDecoration(labelText: 'Grupo muscular'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Informe o grupo muscular'
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveWorkout,
                child: Text(_isEditing ? 'Salvar Alterações' : 'Criar Treino'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveWorkout() {
    if (!_formKey.currentState!.validate()) return;

    if (_isEditing) {
      final updated = WorkoutModel(
        id: widget.existingWorkout!.id,
        name: _nameController.text.trim(),
        muscleGroup: _muscleGroupController.text.trim(),
        exercises: _exercises,
      );
      DataStore.instance.updateWorkout(updated);
    } else {
      final newWorkout = WorkoutModel(
        id: '${DateTime.now().microsecondsSinceEpoch}',
        name: _nameController.text.trim(),
        muscleGroup: _muscleGroupController.text.trim(),
        exercises: _exercises,
      );
      DataStore.instance.addWorkout(newWorkout);
    }
    Navigator.of(context).pop();
  }
}

// =============================================================================
// REGIÃO 9: PÁGINA DE PROGRESSO (GRÁFICOS NATIVOS 100% FLUTTER PURE)
// =============================================================================

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DataStore.instance,
      builder: (context, _) {
        final store = DataStore.instance;
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionCard(
                title: 'Percentual Concluído Geral',
                subtitle:
                    '${(store.overallCompletionRate * 100).toStringAsFixed(0)}% dos exercícios cadastrados concluídos',
                child: _NativePieChart(rate: store.overallCompletionRate),
              ),
              _SectionCard(
                title: 'Evolução dos Treinos',
                subtitle: 'Percentual de conclusão semanal (%)',
                child: const _NativeLineChart(
                  values: [40, 55, 50, 70, 65, 80, 90],
                  labels: ['S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7'],
                  maxY: 100,
                ),
              ),
              _SectionCard(
                title: 'Treinos por Semana',
                subtitle: 'Quantidade de treinos realizados',
                child: const _NativeBarChart(
                  values: [3, 4, 2, 5, 4, 6, 5],
                  labels: ['S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7'],
                  maxY: 7,
                ),
              ),
              _SectionCard(
                title: 'Carga Levantada (kg)',
                subtitle:
                    'Volume total: ${store.totalWeightLifted.toStringAsFixed(0)} kg',
                child: const _NativeLineChart(
                  values: [2200, 2600, 2450, 2900, 3200, 3450],
                  labels: ['Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul'],
                  maxY: 4000,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            SizedBox(height: 180, child: child),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// GRÁFICOS PERSONALIZADOS EMBUTIDOS (CUSTOM PAINTERS)
// -----------------------------------------------------------------------------

class _NativePieChart extends StatelessWidget {
  final double rate;
  const _NativePieChart({required this.rate});

  @override
  Widget build(BuildContext context) {
    final percent = (rate * 100).clamp(0, 100);
    return Row(
      children: [
        Expanded(
          child: CustomPaint(
            size: const Size(140, 140),
            painter: _PiePainter(rate: rate),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${percent.toStringAsFixed(0)}%',
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryPink),
              ),
              const Text('Concluído',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }
}

class _PiePainter extends CustomPainter {
  final double rate;
  _PiePainter({required this.rate});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 10;
    const strokeWidth = 16.0;

    final bgPaint = Paint()
      ..color = AppColors.lightPink.withAlpha(90)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final fgPaint = Paint()
      ..color = AppColors.primaryPink
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);
    final sweepAngle = 2 * pi * rate.clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _PiePainter oldDelegate) =>
      oldDelegate.rate != rate;
}

class _NativeLineChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final double maxY;

  const _NativeLineChart({
    required this.values,
    required this.labels,
    required this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _LineChartPainter(values: values, labels: labels, maxY: maxY),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;
  final double maxY;

  _LineChartPainter({
    required this.values,
    required this.labels,
    required this.maxY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const bottomPadding = 24.0;
    final chartHeight = size.height - bottomPadding;
    final stepX = size.width / (values.length - 1);

    final linePaint = Paint()
      ..color = AppColors.primaryPink
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = AppColors.lightPink.withAlpha(60)
      ..style = PaintingStyle.fill;

    final dotPaint = Paint()..color = AppColors.deepPink;

    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < values.length; i++) {
      final x = i * stepX;
      final y = chartHeight - ((values[i] / maxY) * chartHeight);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, chartHeight);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 4, dotPaint);

      // Desempenha textos
      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
          canvas, Offset(x - textPainter.width / 2, chartHeight + 6));
    }

    fillPath.lineTo(size.width, chartHeight);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _NativeBarChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final double maxY;

  const _NativeBarChart({
    required this.values,
    required this.labels,
    required this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _BarChartPainter(values: values, labels: labels, maxY: maxY),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;
  final double maxY;

  _BarChartPainter({
    required this.values,
    required this.labels,
    required this.maxY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const bottomPadding = 24.0;
    final chartHeight = size.height - bottomPadding;
    final stepX = size.width / values.length;
    final barWidth = stepX * 0.4;

    final bgPaint = Paint()..color = AppColors.lightPink.withAlpha(50);
    final barPaint = Paint()..color = AppColors.primaryPink;

    for (int i = 0; i < values.length; i++) {
      final x = (i * stepX) + (stepX - barWidth) / 2;
      final barH = (values[i] / maxY) * chartHeight;
      final y = chartHeight - barH;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, 0, barWidth, chartHeight),
          const Radius.circular(6),
        ),
        bgPaint,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barH),
          const Radius.circular(6),
        ),
        barPaint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(fontSize: 10, color: AppColors.textSecondary),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
          canvas, Offset(x + (barWidth / 2) - (textPainter.width / 2), chartHeight + 6));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// =============================================================================
// REGIÃO 10: PÁGINA DE MEDIDAS (PLANILHA MENSAL / CRUD)
// =============================================================================

class MeasurementsPage extends StatelessWidget {
  const MeasurementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DataStore.instance,
      builder: (context, _) {
        final measurements = DataStore.instance.measurements;
        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openMeasurementDialog(context),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Novo Mês'),
          ),
          body: measurements.isEmpty
              ? const Center(child: Text('Nenhuma medida registrada'))
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 100),
                  itemCount: measurements.length,
                  itemBuilder: (context, index) {
                    final m = measurements[index];
                    return _MeasurementCard(measurement: m);
                  },
                ),
        );
      },
    );
  }

  void _openMeasurementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _MeasurementFormDialog(),
    );
  }
}

class _MeasurementCard extends StatelessWidget {
  final MeasurementModel measurement;
  const _MeasurementCard({required this.measurement});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              measurement.month,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Peso: ${measurement.weight} kg'),
                Text('Massa: ${measurement.muscleMass} kg'),
                Text('Gordura: ${measurement.bodyFat}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasurementFormDialog extends StatefulWidget {
  const _MeasurementFormDialog();

  @override
  State<_MeasurementFormDialog> createState() => _MeasurementFormDialogState();
}

class _MeasurementFormDialogState extends State<_MeasurementFormDialog> {
  final _monthCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _muscleCtrl = TextEditingController();
  final _fatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova Medida'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(controller: _monthCtrl, decoration: const InputDecoration(labelText: 'Mês/Ano')),
            TextField(controller: _weightCtrl, decoration: const InputDecoration(labelText: 'Peso (kg)')),
            TextField(controller: _muscleCtrl, decoration: const InputDecoration(labelText: 'Massa Muscular (kg)')),
            TextField(controller: _fatCtrl, decoration: const InputDecoration(labelText: '% Gordura')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            DataStore.instance.addMeasurement(
              MeasurementModel(
                id: '${DateTime.now().millisecondsSinceEpoch}',
                month: _monthCtrl.text,
                weight: double.tryParse(_weightCtrl.text) ?? 0,
                muscleMass: double.tryParse(_muscleCtrl.text) ?? 0,
                bodyFat: double.tryParse(_fatCtrl.text) ?? 0,
              ),
            );
            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}