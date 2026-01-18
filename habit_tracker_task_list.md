`habit_tracker_detailed_design.md` を確認し、タスクを生成します。


[1 tool called]

設計書を確認しました。実装タスクを生成します。


[4 tools called]

設計書に基づき、実装タスクを段階的に生成します。

## 実装タスク一覧

### フェーズ1: プロジェクトセットアップ

#### タスク1-1: 依存関係の追加
- `pubspec.yaml`に必要なパッケージを追加
  - 状態管理: `flutter_riverpod`, `riverpod_annotation`
  - データベース: `sqflite`, `path`
  - UI: `fl_chart`, `flutter_colorpicker`, `table_calendar`, `intl`
  - ユーティリティ: `uuid`, `freezed_annotation`, `json_annotation`
  - コード生成: `build_runner`, `riverpod_generator`, `freezed`, `json_serializable`
- `flutter pub get`を実行

---

### フェーズ2: ドメイン層の実装

#### タスク2-1: Taskエンティティの実装
- `lib/domain/entities/task.dart`を作成
- Freezedを使用してTaskエンティティを定義
- `TaskExtension`に`create`と`update`メソッドを実装
- `build_runner`でコード生成を実行

#### タスク2-2: TaskExecutionエンティティの実装
- `lib/domain/entities/task_execution.dart`を作成
- Freezedを使用してTaskExecutionエンティティを定義
- `TaskExecutionExtension`に`create`メソッドを実装
- `build_runner`でコード生成を実行

#### タスク2-3: Repositoryインターフェースの実装
- `lib/domain/repositories/task_repository.dart`を作成
- `TaskRepository`インターフェースを定義
- `lib/domain/repositories/task_execution_repository.dart`を作成
- `TaskExecutionRepository`インターフェースを定義

---

### フェーズ3: インフラストラクチャ層の実装

#### タスク3-1: DatabaseHelperの実装
- `lib/infrastructure/database/database_helper.dart`を作成
- シングルトンパターンで実装
- `_onCreate`でテーブルとインデックスを作成
- `_onConfigure`で外部キー制約を有効化
- `_onUpgrade`でマイグレーション処理を実装（将来対応）

#### タスク3-2: TaskLocalDataSourceの実装
- `lib/infrastructure/datasources/task_local_datasource.dart`を作成
- CRUD操作を実装
- 論理削除と物理削除の両方をサポート

#### タスク3-3: TaskExecutionLocalDataSourceの実装
- `lib/infrastructure/datasources/task_execution_local_datasource.dart`を作成
- CRUD操作を実装
- 日付範囲検索、当日実行記録取得を実装

#### タスク3-4: Repository実装
- `lib/infrastructure/repositories/task_repository_impl.dart`を作成
- `TaskRepository`を実装
- エンティティとMapの変換処理を実装
- `lib/infrastructure/repositories/task_execution_repository_impl.dart`を作成
- `TaskExecutionRepository`を実装
- 日付ごとの実行回数集計を実装

---

### フェーズ4: アプリケーション層の実装

#### タスク4-1: 基本Providersの実装
- `lib/application/providers/providers.dart`を作成
- `DatabaseHelper`、`DataSource`、`Repository`のProvidersを定義
- `build_runner`でコード生成を実行

#### タスク4-2: タスク関連Providersの実装
- `lib/application/providers/task_provider.dart`を作成
- `taskListProvider`（StreamProvider）を実装
- `taskProvider`（FutureProvider）を実装
- `TaskNotifier`を実装（CRUD操作）
- `build_runner`でコード生成を実行

#### タスク4-3: 実行記録関連Providersの実装
- `lib/application/providers/task_execution_provider.dart`を作成
- `taskExecutionListProvider`（StreamProvider）を実装
- `TaskExecutionNotifier`を実装（実行記録の追加・削除、当日実行可否チェック）
- `build_runner`でコード生成を実行

#### タスク4-4: カレンダー関連Providersの実装
- `lib/application/providers/calendar_provider.dart`を作成
- `CalendarData`（NotifierProvider）を実装
- 期間変更時の再読み込み機能を実装

---

### フェーズ5: ユーティリティの実装

#### タスク5-1: DateTime拡張の実装
- `lib/utils/extensions/datetime_extension.dart`を作成
- `normalized`プロパティを実装
- `isSameDay`メソッドを実装

#### タスク5-2: カレンダー色計算の実装
- `lib/utils/helpers/color_calculator.dart`を作成
- `CalendarColorCalculator`クラスを実装
- 実行回数に応じた色の濃淡を計算

#### タスク5-3: 日付範囲計算の実装
- `lib/utils/helpers/date_range_calculator.dart`を作成
- `DateRangeCalculator`クラスを実装
- 開始日・日数の計算メソッドを実装

#### タスク5-4: エラー表示ヘルパーの実装
- `lib/utils/helpers/snackbar_helper.dart`を作成
- `showErrorSnackBar`と`showSuccessSnackBar`を実装

---

### フェーズ6: プレゼンテーション層の実装

#### タスク6-1: 共通ウィジェットの実装
- `lib/presentation/widgets/task_card.dart`を作成
- `TaskCard`ウィジェットを実装
- `lib/presentation/widgets/contribution_calendar.dart`を作成
- `ContributionCalendar`ウィジェットを実装

#### タスク6-2: ホーム画面の実装
- `lib/presentation/screens/home/home_screen.dart`を作成
- タスク一覧表示機能を実装
- タスククイック実行機能を実装
- タスク詳細への遷移を実装
- タスク追加ボタンを実装

#### タスク6-3: カレンダー画面の実装
- `lib/presentation/screens/calendar/calendar_screen.dart`を作成
- 期間切り替え機能を実装（1ヶ月/3ヶ月/6ヶ月/1年）
- タスク選択ドロップダウンを実装
- Contributionカレンダー表示を実装
- 日付タップで詳細表示を実装

#### タスク6-4: タスク登録・編集画面の実装
- `lib/presentation/screens/task_form/task_form_screen.dart`を作成
- タスク名入力フィールドを実装
- カラーピッカーを実装
- バリデーションを実装
- 保存機能を実装（新規作成・編集対応）

#### タスク6-5: タスク詳細画面の実装
- `lib/presentation/screens/task_detail/task_detail_screen.dart`を作成
- タスク情報表示を実装
- 実行履歴リストを実装
- 編集画面への遷移を実装
- タスク削除機能を実装（確認ダイアログ付き）

#### タスク6-6: アプリケーションルートの実装
- `lib/app.dart`を作成
- `ProviderScope`でアプリをラップ
- `MaterialApp`を設定
- ナビゲーションルーティングを実装
- `main.dart`を更新して`app.dart`を使用

---

### フェーズ7: 統合とテスト

#### タスク7-1: エラーハンドリングの実装
- 各画面でエラー処理を実装
- `AsyncValue`のエラーハンドリングを実装
- ユーザーフレンドリーなエラーメッセージを表示

#### タスク7-2: 動作確認
- タスクのCRUD操作をテスト
- 実行記録の追加・削除をテスト
- カレンダー表示をテスト
- 画面遷移をテスト

#### タスク7-3: パフォーマンス最適化
- 不要な再ビルドを防止
- `const`コンストラクタを適切に使用
- Riverpodの`select()`で部分購読を実装

---

## 実装の優先順位

1. フェーズ1（プロジェクトセットアップ）
2. フェーズ2（ドメイン層）
3. フェーズ3（インフラストラクチャ層）
4. フェーズ4（アプリケーション層）
5. フェーズ5（ユーティリティ）
6. フェーズ6（プレゼンテーション層）
7. フェーズ7（統合とテスト）

各タスクは独立して実装可能ですが、依存関係に注意してください。特に、下位層（ドメイン→インフラ→アプリケーション→プレゼンテーション）の順で実装することを推奨します。

特定のタスクから始めますか？