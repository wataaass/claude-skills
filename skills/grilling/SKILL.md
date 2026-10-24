---
name: grilling
description: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
---

Interview the user relentlessly until you reach a shared understanding. Map it as a **design tree**: each decision branches into the decisions that hang off it.

Work in **rounds**. The **frontier** is every decision whose prerequisites are settled: what you can ask _now_ without guessing at unheard answers. Ask the whole frontier each round, with your recommended answer for each, then wait. A question depending on another still open this round belongs to a later round. Each round's answers push the frontier outward; recompute it and ask again.

**Format:** use the AskUserQuestion tool when available (up to 4 questions per call, 2–4 options each, recommended option first and labelled "(推奨)"/"(Recommended)"; split a larger frontier over consecutive calls). Otherwise number the questions in text:

```
❓ **Q1** - **<title>**: <body, may include choices>

➡️ <recommended answer>
```

**Facts are your job; decisions are the user's.** Never ask for anything you could look up (files, tools, environment): find it yourself, via a sub-agent if it takes exploration. Don't block on it: only questions downstream of a running lookup wait; ask the rest now.

Done when the frontier is empty: every branch visited, nothing silently assumed. Don't act until the user confirms the shared understanding.
