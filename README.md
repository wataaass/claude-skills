# claude-skills

Claude のアカウント全体に入れるスキルと、いつも守ってほしい指示をまとめたリポジトリ。

## スキル一覧

### 自作
| スキル | いつ動くか | 何をするか |
|---|---|---|
| explain | `/explain` や「解説して」と頼んだときだけ | 直前の変更を「何を・なぜ・ほかの方法」で解説し、理解を確かめる質問を出す |
| verify | コードを変えたあと、完了報告の前に自動で | 変更の大きさに合わせて動作確認し、中・大の変更ではテストを書く |
| decision-memo | 方針が固まったとき、DECISIONS.md のあるプロジェクトで作業するとき | 決定事項を DECISIONS.md に残し、食い違う作業の前に止まって確認する |
| study-log | 「学んだことを記録して」など | 非公開リポジトリ study-log に日付ごとの学習記録を書く |
| univ-assignment | 大学の課題・レポートの話が出たとき | 授業ごとの AI 利用の可否を確認し、許される範囲だけ手伝う |
| job-hunting-docs | ES・自己PR・志望動機など | 経験を質問で聞き出してから下書きし、推敲する |
| new-project | 新しい制作物を作り始めるとき | 方針の聞き取り、README と設計判断の雛形、確認の仕組みを用意する |

### Anthropic 公式（anthropics/skills から取得し、トークン削減のため手を加えたもの）
| スキル | 用途 | ライセンス |
|---|---|---|
| webapp-testing | Playwright でページを開いて表示や動作を確かめる | Apache 2.0（フォルダ内の LICENSE.txt） |
| doc-coauthoring | 文書を段階を踏んで一緒に組み立てる | anthropics/skills の条件に従う |
| frontend-design | ゼロから作る画面のデザイン方針 | Apache 2.0（フォルダ内の LICENSE.txt） |

取得元: https://github.com/anthropics/skills （コミット dbd4588）

元の版からの変更点:
- 3つとも SKILL.md の言い回しを詰めた。手順・ルール・具体例は残している
- doc-coauthoring: 質問は AskUserQuestion が使えるときはそれでまとめて出すようにした
- webapp-testing: 例のスクリプトの保存先（`/mnt/user-data/outputs`、`/tmp`）を、Windows でも動くよう作業フォルダに変えた

### プラグインから差し替えたもの（トークン削減版）
元のプラグインを無効にして、こちらを入れる。元の作者の更新は届かなくなる。

| スキル | 元の配布 | 変えたこと |
|---|---|---|
| natural-japanese | プラグイン（MIT） | 説明文を約735→約300トークンに短縮。本文の言い回しを詰めた（工程・基準・数値は維持）。lint のパスの不統一を修正 |
| design-taste-frontend | プラグイン | 文章は変えず、§2〜6・§8〜12・付録を `references/` に節番号ごと移し、作業に応じて読む形にした。SKILL.md は約22,000→約3,900トークン |
| teach | プラグイン | SKILL.md を短縮。GLOSSARY-FORMAT.md へのリンクを追加 |
| setup-progress | プラグイン | SKILL.md と、プロジェクトに作るファイル（CLAUDE.md の節、save-progress）を短縮 |
| deepseek-coder | プラグイン | 説明文を日本語にして本文を短縮 |
| grilling | プラグイン | 短縮。質問は AskUserQuestion でまとめて出すようにした |

grill-me（grilling を呼ぶだけ）と yomiyasu（毎回全手順を使うため、削ると性能が落ちる）は、プラグインのまま使う。

## 入れ方

1. `./build.sh` を実行すると、`dist/` にスキルごとの zip ができる
2. claude.ai の設定画面のスキルの項目から、zip を1つずつアップロードする
3. スキルを直したら、もう一度 `./build.sh` を実行し、直したスキルの zip を入れ直す

## いつも守ってほしい指示

`preferences/common-instructions.md` の内容を次の2か所に入れる。

- claude.ai の設定 → 個人設定（プロフィール）の指示欄
- 自分の PC の `~/.claude/CLAUDE.md`（Windows では `%USERPROFILE%\.claude\CLAUDE.md`）

クラウドの Claude Code ではこの2つが読まれないことがあるため、よく使うリポジトリには同じ内容を `CLAUDE.md` に書いておく。

## ステータスライン（自分の PC の Claude Code 用）

画面下に、会話の使用率（コンテキストのうち使った割合）を出す。50% で黄色、70% で赤になり「/clear 推奨」と出る。

入れ方（Windows）: `statusline` フォルダで PowerShell を開き、次を実行して Claude Code を起動し直す。

```
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

`~/.claude/statusline.ps1` を置き、`~/.claude/settings.json` に `statusLine` を足す。ほかの設定は残し、元のファイルは `settings.json.bak` に残す。
