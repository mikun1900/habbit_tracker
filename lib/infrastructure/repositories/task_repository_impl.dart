import 'package:habbit_tracker/domain/entities/task.dart';
import 'package:habbit_tracker/domain/repositories/task_repository.dart';
import 'package:habbit_tracker/infrastructure/datasources/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<Task> createTask(Task task) async {
    final taskMap = _taskToMap(task);
    await _dataSource.insertTask(taskMap);
    return task;
  }

  @override
  Future<Task?> getTaskById(String id) async {
    final taskMap = await _dataSource.getTaskById(id);
    return taskMap != null ? _mapToTask(taskMap) : null;
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final taskMaps = await _dataSource.getAllTasks();
    return taskMaps.map(_mapToTask).toList();
  }

  @override
  Stream<List<Task>> watchAllTasks() async* {
    while (true) {
      yield await getAllTasks();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<Task> updateTask(Task task) async {
    final taskMap = _taskToMap(task);
    await _dataSource.updateTask(taskMap);
    return task;
  }

  @override
  Future<void> deleteTask(String id) async {
    await _dataSource.deleteTask(id);
  }

  @override
  Future<void> permanentlyDeleteTask(String id) async {
    await _dataSource.permanentlyDeleteTask(id);
  }

  Map<String, dynamic> _taskToMap(Task task) {
    return {
      'id': task.id,
      'name': task.name,
      'color': task.color,
      'created_at': task.createdAt.millisecondsSinceEpoch,
      'updated_at': task.updatedAt.millisecondsSinceEpoch,
      'is_deleted': task.isDeleted ? 1 : 0,
    };
  }

  Task _mapToTask(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
      isDeleted: (map['is_deleted'] as int) == 1,
    );
  }
}
