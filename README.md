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

## 入れ方

1. `./build.sh` を実行すると、`dist/` にスキルごとの zip ができる
2. claude.ai の設定画面のスキルの項目から、zip を1つずつアップロードする
3. スキルを直したら、もう一度 `./build.sh` を実行し、直したスキルの zip を入れ直す

## いつも守ってほしい指示

`preferences/common-instructions.md` の内容を次の2か所に入れる。

- claude.ai の設定 → 個人設定（プロフィール）の指示欄
- 自分の PC の `~/.claude/CLAUDE.md`（Windows では `%USERPROFILE%\.claude\CLAUDE.md`）

クラウドの Claude Code ではこの2つが読まれないことがあるため、よく使うリポジトリには同じ内容を `CLAUDE.md` に書いておく。
