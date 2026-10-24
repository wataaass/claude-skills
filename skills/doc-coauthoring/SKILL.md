---
name: doc-coauthoring
description: Structured workflow for co-authoring documentation, proposals, technical specs, decision docs, PRDs, RFCs, or similar structured content. Use when the user wants to write or draft such a doc or is starting a substantial writing task.
---

# Doc Co-Authoring Workflow

Guide the user through three stages: Context Gathering, Refinement & Structure, Reader Testing.

**Asking questions:** when the AskUserQuestion tool is available, batch questions through it (up to 4 per call; the user can type free answers via "Other"). Otherwise ask numbered questions and say shorthand answers are fine (e.g. "1: yes, 2: see #channel").

## Start

Offer the workflow and explain the three stages in one line each:
1. Context Gathering: user provides context, Claude asks clarifying questions
2. Refinement & Structure: build each section by brainstorming and editing
3. Reader Testing: test the doc with a fresh Claude (no context) to catch blind spots before others read it

Ask whether to use it or work freeform. If declined, work freeform.

## Stage 1: Context Gathering

Goal: close the gap between what the user knows and what Claude knows.

1. Ask meta questions: doc type; primary audience; desired impact on readers; template or required format; other constraints.
   - Template or doc type mentioned → ask for the template; read any linked doc (via integration) or file.
   - Editing an existing shared doc → read its current state; if images lack alt-text, explain Claude readers can't see them and offer to write alt-text from images pasted into chat.
2. Invite an unorganized info dump: background, related discussions or docs, why alternatives aren't used, organizational context, timeline, technical dependencies, stakeholder concerns. Mention that connected integrations (Slack, Drive, other MCP) can pull context directly; in claude.ai without integrations, suggest enabling connectors or pasting content. Say clarifying questions come after the dump.
   - Channels/docs mentioned → read them if integrations exist; otherwise explain and ask for a paste.
   - Unknown entities/projects → ask before searching connected tools.
3. After the dump, ask 5–10 clarifying questions on the gaps.

Exit when you can ask about edge cases and trade-offs without needing basics. Ask if there is more context, then move on.

## Stage 2: Refinement & Structure

Build section by section. Explain the per-section loop once: questions → brainstorm → curate → draft → refine.

**Order and scaffold:** If the structure is clear, ask which section to start with, suggesting the one with most unknowns (the core proposal for decision docs, the technical approach for specs); leave summaries for last. If not, suggest 3–5 sections for the doc type and confirm. Then create the scaffold with all headings and placeholder text ("[To be written]"): as an artifact if available, otherwise a well-named markdown file (e.g. `decision-doc.md`). Share the link or filename.

**For each section:**
1. **Clarify:** ask 5–10 questions about what the section should include.
2. **Brainstorm:** list 5–20 numbered candidate points, including forgotten context and unmentioned angles; offer more.
3. **Curate:** ask which to keep, remove, or combine, with brief reasons (e.g. "Keep 1,4,7", "Remove 3 (dupes 1)", "Combine 11 and 12"). If feedback is freeform, extract the preferences and proceed.
4. **Gap check:** ask if anything important is missing.
5. **Draft:** replace the placeholder with `str_replace`, then ask what to change. With the first section, ask the user to describe changes rather than edit directly, since that teaches their style (e.g. "Remove the X bullet, already covered by Y").
6. **Refine:** apply feedback with `str_replace` only, never reprinting the whole doc. If the user edits directly, note their changes as style preferences. After 3 iterations without substantial changes, ask what can be removed without losing information. Confirm the section is done, then move on.

**Near completion (80%+):** re-read the whole doc for flow, consistency, redundancy, contradictions, generic filler, and whether every sentence carries weight. Give feedback and final suggestions, then ask whether to start Reader Testing.

## Stage 3: Reader Testing

Goal: verify the doc works for readers with no context.

**With sub-agents (e.g. Claude Code):** do it without the user.
1. Predict 5–10 questions readers would realistically ask.
2. For each, run a fresh sub-agent given only the doc and the question; summarize what it got right and wrong.
3. Run a sub-agent check for ambiguity, false assumptions, and contradictions.
4. Report issues, fix them by looping back to refinement, and retest.

**Without sub-agents (e.g. claude.ai):** the user tests manually.
1. Ask what readers might type into Claude to find answers in the doc, and generate 5–10 such questions.
2. Instruct: open a fresh conversation at https://claude.ai, paste or share the doc, ask each question, and have Reader Claude give the answer, anything ambiguous, and what context the doc assumes.
3. Also ask Reader Claude what is unclear, what knowledge is assumed, and whether there are contradictions.
4. Ask what it got wrong, then fix those sections.

Exit when Reader Claude answers correctly and surfaces no new gaps.

## Final Review

Recommend the user do a final read-through (they own the doc), double-check facts, links, and technical details, and confirm it achieves the intended impact. Offer one more review. When done, give tips: link this conversation in an appendix, use appendices for depth without bloat, update the doc as real reader feedback arrives.

## Guidance

- Tone: direct and procedural; explain rationale only when it changes what the user does; don't sell the workflow.
- Deviations: if the user wants to skip a stage, offer freeform. If they seem frustrated, acknowledge it and offer ways to go faster. Always let them adjust the process.
- Context: ask about missing context as soon as it appears; don't let gaps pile up.
- Artifacts: draft full sections with `create_file`, edit with `str_replace`, share the link after every change, never put brainstorm lists in artifacts.
- Quality over speed: each iteration should make a meaningful improvement.
