---
name: deepseek-coder
description: DeepSeek（OpenCode 経由）にコードを書かせ、Claude は指示とレビューに回る。「DeepSeekに書かせて」「OpenCodeに任せて」「/deepseek-coder」で使う。ローカル（Windows/PowerShell）とクラウド（Linux/bash）の両方で動く。
---

# deepseek-coder

分担: Claude は設計・指示・確認、DeepSeek V4.1 Flash（無料）はコードを書く。Claude は自分で書かず、修正も原則 DeepSeek に再依頼する。

**準備**（セッションで最初の1回だけ）: `opencode --version` で確認し、なければ `npm install -g opencode-ai` を実行する。クラウド（`CLAUDE_CODE_REMOTE=true`）で接続拒否・403・タイムアウトが出たら止まる。そのうえで、ネットワーク設定を Custom にして `opencode.ai` と `models.dev` を許可するようユーザーに伝える。

**手順**:
1. 1回の依頼は「1つの機能・1つの修正」程度に分ける（大きい依頼は失敗しやすい）
2. DeepSeek は会話の文脈を知らないので、指示文に毎回すべて書く: 目的、対象ファイルと触ってよい／いけない範囲、仕様・入出力例・言語やライブラリ、完了条件（例: `python main.py` がエラーなく動く）。末尾には必ず「作業後、変更したファイルと内容を日本語で簡潔に報告してください。」と書く
3. 実行する（timeout は 600000ms）:
   `opencode run -m opencode/deepseek-v4.1-flash-free --dir "<プロジェクト>" "<指示文>"`
   指示文が長ければ、スクラッチパッド（なければ一時フォルダ）に `prompt.md` を書き、`-f "<prompt.md のフルパス>" "添付ファイルの指示に従って作業してください"` で渡す
4. 報告をうのみにしない。変更を実際に読み（`git diff`）、テストや実行で確かめ、依頼範囲外の変更や削除がないか見る
5. 問題があれば、何がどう違うかを具体的に書いて 3 をやり直す（続きなら `-c` で前回の文脈を引き継ぐ）。2〜3回で直らなければ、Claude が直すかユーザーに相談する
6. 何を頼み、何を確かめ、結果どうなったかを日本語で報告する

**注意**:
- 無料モデルは送った内容がサービス改善に使われることがある。パスワード、API キー、個人情報を含むファイルは指示に入れない
- `opencode models opencode` に `deepseek-v4.1-flash-free` がない、またはエラーになるときは、伝えて別のモデルを相談する
- ファイル削除や大きな変更を伴う依頼は、出す前にユーザーの確認を取る
