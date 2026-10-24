---
name: teach
description: Teach the user a new skill or concept, within this workspace.
disable-model-invocation: true
argument-hint: "What would you like to learn about?"
---

The user wants to learn something over multiple sessions. Treat the current directory as a stateful teaching workspace.

## Workspace files

- `MISSION.md`: _why_ the user is learning this; grounds all teaching. Format: [MISSION-FORMAT.md](./MISSION-FORMAT.md).
- `RESOURCES.md`: trusted resources and communities. Format: [RESOURCES-FORMAT.md](./RESOURCES-FORMAT.md).
- `GLOSSARY.md`: the workspace's canonical terms; once it exists, every lesson adheres to it. Format: [GLOSSARY-FORMAT.md](./GLOSSARY-FORMAT.md).
- `./learning-records/0001-<dash-case>.md`: non-obvious lessons and insights, like ADRs; used to find the zone of proximal development. Format: [LEARNING-RECORD-FORMAT.md](./LEARNING-RECORD-FORMAT.md).
- `./lessons/0001-<dash-case>.html`: the primary unit of teaching (see Lessons).
- `./reference/*.html`: compressed learnings for quick lookup (cheat sheets, syntax, algorithms, poses, glossaries); beautiful and printable.
- `./assets/*`: reusable lesson components (see Assets).
- `NOTES.md`: user preferences on how to be taught, and your working notes.

## Philosophy

Deep learning needs **knowledge** (from high-quality, high-trust resources), **skills** (from relevant interactive lessons you design), and **wisdom** (from other learners and practitioners). Until `RESOURCES.md` is well populated, focus on finding good resources. Never trust your parametric knowledge. Topics differ in mix: theoretical physics is knowledge-heavy, yoga skill-heavy.

Fluency (in-the-moment retrieval) gives an illusion of mastery; storage strength (long-term retention) is the goal. Build it with desirable difficulty: retrieval practice, spacing, and interleaving (skills practice only).

## Mission

Tie every lesson to the mission. If it's unclear or `MISSION.md` is empty, first question the user on why they want to learn this; without it, lessons get abstract and you can't judge what's next. When the mission shifts, confirm with the user, update `MISSION.md`, and add a learning record.

## Zone of proximal development

The user should feel challenged just enough. If they don't name what to learn, read the learning records and pick the most mission-relevant thing within their zone.

## Lessons

One short, self-contained HTML file per lesson, completable quickly (working memory is small), giving one tangible win tied to the mission. Make it beautiful and readable (think Tufte), since the user will revisit it. Open it for the user with a CLI command if possible. Each lesson links to related lessons and references, recommends one primary source (the best high-trust resource you found), and reminds the user to ask you follow-up questions.

**Knowledge:** teach only what the target skill requires, drawn from `RESOURCES.md`, with citations backing every claim. Here difficulty is the enemy; it eats working memory.

**Skills:** here difficulty is the tool; effortful retrieval builds storage strength. Use interactive lessons (quizzes, light in-browser tasks) or guided real-world steps (e.g. yoga poses), each with a feedback loop that is as tight and automatic as possible. Quiz answers must all have the same number of words (and characters if possible) so formatting gives nothing away.

## Assets

Reuse is the default. Before authoring a lesson, read `./assets/` and build from existing components (stylesheets, quiz widgets, simulators, diagram helpers). Write anything a second lesson could reuse as a component there and link it; never inline code a future lesson would duplicate. The first component is a shared stylesheet every lesson links, so lessons read as one course.

## Reference documents

Create them alongside lessons. Lessons are rarely revisited; references are, so make them the compressed essence for quick lookup: syntax and snippets, algorithms and flowcharts, poses and sequences, routines, and glossaries.

## Wisdom

For questions needing real-world wisdom, attempt an answer but ultimately point to a **community** (forum, subreddit, class within budget, local group). Find high-reputation ones; respect it if the user doesn't want to join.
