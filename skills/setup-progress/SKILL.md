---
name: setup-progress
description: /clear や再起動のあとも作業の続きから再開できる仕組み（PROGRESS.md、CLAUDE.md の引き継ぎ節、/save-progress スキル）をプロジェクトに用意する。「クリアしても続きから再開したい」「作業経過を保存したい」「引き継ぎの仕組みを作って」「前回どこまでやったか覚えていてほしい」「進捗ファイルを作って」で名前がなくても使う。
---

# setup-progress

**しくみ**: CLAUDE.md は会話のたびに読み込まれる。そこで経過を `PROGRESS.md` に書き、CLAUDE.md から `@PROGRESS.md` で取り込めば、再開できる。ルール（CLAUDE.md）と経過（PROGRESS.md）を分けるのは、経過を書き換えるときにルールを壊さないため。

| 作るもの | ひな形 |
|---|---|
| `PROGRESS.md`（今やっていること・次・未決定・最近の完了） | `assets/PROGRESS.md` |
| CLAUDE.md の節（`@PROGRESS.md` と再開・保存のルール） | `assets/claude-md-section.md` |
| `.claude/skills/save-progress/SKILL.md` | `assets/save-progress-SKILL.md` |

**手順**:
1. **置き場所**: Claude Code を起動したフォルダ（プロジェクトのルート）に置く。CLAUDE.md が親フォルダにある、ルートがはっきりしないなどの場合は作者に確認する（読み込みは起動フォルダが基準なので、場所を間違えると動かない）
2. **現状確認**: CLAUDE.md、その中の `@PROGRESS.md` の行、PROGRESS.md、save-progress スキルの4つを確かめる。全部あれば、そう伝えて終わる
3. **了承を得る**: 新しく作るファイルと追記するファイルを一覧で示し、了承を得てから書く。既存のファイルは上書きしない
4. **作る**:
   - PROGRESS.md: ひな形を、会話・README・`git log --oneline -5` から分かる範囲で埋める。分からない見出しは「なし」にする（推測で埋めると、次の Claude が事実だと思って動く）
   - CLAUDE.md: なければ1行目を `# CLAUDE.md` にして節を入れる。あれば、既存の文章は変えずに、概要の直後などなるべく上に節を追記する。`@PROGRESS.md` が既にあれば足さない
   - save-progress: なければひな形をそのままコピーする
   - 作者が日本語以外で話していれば、ひな形を訳す
5. **報告**: 作った／追記したファイル、Claude Code の再起動が必要なこと（スキル一覧は起動時に読まれる）、確かめ方（再起動後の最初の返事で前回の到達点と次が示されれば成功）を伝える。Git 管理なら、PROGRESS.md と save-progress をコミットするか確認する（公開リポジトリに作業メモを載せてよいかは作者が決める）
