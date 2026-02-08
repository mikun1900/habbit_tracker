# Habit Tracker

日々の習慣を記録・管理し、GitHubのContributionグラフ風のビジュアルフィードバックでモチベーションを維持するFlutterアプリケーション。

## 概要

**Habit Tracker**は、習慣化を支援するクロスプラットフォーム対応のFlutterアプリです。毎日のタスク実行を記録し、過去の実行履歴をカレンダー表示することで、習慣化のモチベーション維持をサポートします。

## 主要機能

- **タスク管理**: タスクのCRUD操作（作成、読み取り、更新、削除）
- **実行記録**: 日々のタスク実行を記録
- **Contributionスタイル表示**: GitHubのようなカレンダーグラフで習慣の継続状況を可視化

## 技術スタック

### フレームワーク・言語

- **Flutter**: 3.16.0以上
- **Dart**: 3.2.0以上

### 主要パッケージ

- **状態管理**: `flutter_riverpod` (2.4.0以上)
- **データベース**: `sqflite` (2.3.0以上)
- **UI**: `fl_chart`, `table_calendar`, `flutter_colorpicker`
- **国際化**: `intl` (0.18.1以上)
- **ユーティリティ**: `uuid` (4.2.0以上)
- **コード生成**: `freezed`, `json_serializable`

### 開発環境

```yaml
# build_runner: 2.4.6以上
# riverpod_generator: 2.3.0以上
# flutter_lints: 3.0.0以上
```

## アーキテクチャ

本アプリはClean Architectureを採用しており、以下のレイヤーで構成されています：

### ディレクトリ構造

```
lib/
├── main.dart                           # エントリーポイント
├── domain/                             # ドメイン層
│   ├── entities/                       # ビジネスロジックのエンティティ
│   │   ├── task.dart
│   │   └── task_execution.dart
│   └── repositories/                   # リポジトリインターフェース
│       ├── task_repository.dart
│       └── task_execution_repository.dart
├── infrastructure/                     # インフラストラクチャ層
│   ├── database/                       # データベース関連
│   │   ├── database_helper.dart
│   │   └── migration/
│   ├── datasources/                    # データソース実装
│   │   ├── task_local_datasource.dart
│   │   └── task_execution_local_datasource.dart
│   └── repositories/                   # リポジトリ実装
│       ├── task_repository_impl.dart
│       └── task_execution_repository_impl.dart
├── application/                        # アプリケーション層
│   └── providers/                      # Riverpodプロバイダー
├── presentation/                       # プレゼンテーション層
│   ├── screens/                        # 画面
│   ├── widgets/                        # 再利用可能なウィジェット
│   └── providers/                      # UI状態管理
└── shared/                             # 共有ユーティリティ
```

## データベース設計

### テーブル構成

#### tasks テーブル

日々実行するタスクの情報を保持

| カラム     | 型      | 説明                                 |
| ---------- | ------- | ------------------------------------ |
| id         | TEXT    | UUID (主キー)                        |
| name       | TEXT    | タスク名                             |
| color      | TEXT    | カラーコード (#RRGGBB形式)           |
| created_at | INTEGER | 作成日時 (Unixタイムスタンプ ミリ秒) |
| updated_at | INTEGER | 更新日時 (Unixタイムスタンプ ミリ秒) |
| is_deleted | INTEGER | 削除フラグ (0: 未削除, 1: 削除済み)  |

#### task_executions テーブル

タスクの実行記録を保持

| カラム      | 型      | 説明                                 |
| ----------- | ------- | ------------------------------------ |
| id          | TEXT    | UUID (主キー)                        |
| task_id     | TEXT    | タスクID (外部キー)                  |
| executed_at | INTEGER | 実行日時 (Unixタイムスタンプ ミリ秒) |
| created_at  | INTEGER | 記録日時 (Unixタイムスタンプ ミリ秒) |

## 開始方法

### 前提条件

- Flutter 3.16.0以上がインストールされていること
- Dartが利用可能であること

### セットアップ

1. **リポジトリをクローン**

```bash
git clone <repository-url>
cd habbit_tracker
```

2. **依存パッケージをインストール**

```bash
flutter pub get
```

3. **コード生成を実行**

```bash
flutter pub run build_runner build
```

4. **アプリを起動**

```bash
flutter run
```

### コード生成

Freezedやその他のコード生成が必要な場合は、以下のコマンドを実行します：

```bash
# 単回実行
flutter pub run build_runner build

# ウォッチモード（ファイル変更時に自動再生成）
flutter pub run build_runner watch
```

## 設計ドキュメント

詳細な設計情報については、[habit_tracker_detailed_design.md](habit_tracker_detailed_design.md)を参照してください。

このドキュメントには以下の内容が含まれています：

- システム概要と主要機能
- 技術スタック詳細
- データベース設計（スキーマ、マイグレーション戦略）
- ドメイン層設計（エンティティ定義、リポジトリインターフェース）
- インフラストラクチャ層設計（データソース、リポジトリ実装）
- アプリケーション層設計（ユースケース、プロバイダー）
- プレゼンテーション層設計（画面構成、状態管理）
- 画面仕様（ウイヤーフレーム、ユーザーフロー）
- カレンダー表示ロジック
- エラーハンドリング戦略
- パフォーマンス最適化

## 開発上の注意点

### 削除処理

- タスク削除は**論理削除**を使用（`is_deleted`フラグ）
- 必要に応じて完全削除を実行可能
- 削除されたタスクは通常の一覧表示では表示されない

### 外部キー制約

- SQLiteで外部キー制約を有効化
- タスク削除時に関連する実行記録を自動削除（ON DELETE CASCADE）

### タイムスタンプ

- すべてのタイムスタンプはUTC時刻で統一
- ミリ秒単位で保存

## プラットフォーム対応

本アプリは以下のプラットフォームに対応予定：

- iOS
- Android
- Web
- macOS
- Windows
- Linux

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 参考リソース

- [Flutterドキュメント](https://docs.flutter.dev/)
- [Riverpodドキュメント](https://riverpod.dev/)
- [sqfliteドキュメント](https://pub.dev/packages/sqflite)
- [Freezedドキュメント](https://pub.dev/packages/freezed)
