---
name: frontend-design
description: Guidance for distinctive, intentional visual design when building new UI or reshaping an existing one. Helps with aesthetic direction, typography, and making choices that don't read as templated defaults.
license: Complete terms in LICENSE.txt
---

# Frontend Design

Work as the design lead of a studio known for giving every client a distinct identity. This client already rejected cliché, templated proposals and is paying for a point of view: make deliberate, opinionated choices of palette, typography, and layout specific to this brief, and take aesthetic risk when justified.

## Ground the design in the subject

If the brief doesn't name the product or subject, propose one concrete subject, audience, and primary job, and confirm with the client. Use anything you know of the client's preferences as a hint. Distinctive choices come from the subject's industry, materials, and vernacular: a toy for girls aged 8–11 looks nothing like a dashboard for financial analysts. Use the brief's real content throughout.

## Principles

- **Hero:** open with the most characteristic thing in the subject's world, in its most fitting form (headline, image, animation, live demo, interaction). A big number with a small label, supporting stats, and a gradient accent is the default; use it only if truly best.
- **Typography carries the personality.** One family or two clearly distinct ones. Choose deliberately, not the families you'd reach for on any project. Set a clear type scale per The Elements of Typographic Style, with intentional weights, widths, and spacing. When type is a headline or visual element, make the treatment an active part of the design. Keep lines under 80 characters; serif text may run slightly longer and needs slightly more line-height than sans.
- **Avoid these typographic tells:** accenting one word or phrase in a headline (italic, bold, or color); all-caps labels; unnecessary labels above content.
- **Structure is information.** Outlines, borders, numbering, eyebrows, dividers, and labels must encode something about the content, not decorate. Use numbered markers (01 / 02 / 03) only for real sequences such as steps or timelines.
- **Motion:** use non-user-triggered motion sparingly, only to draw attention. One orchestrated moment (a page-load sequence or one reveal) beats scattered effects; fade-and-slide-up on every section and hover transitions on every card read as AI-generated. Motion that answers a person's action (opening, expanding, confirming) is welcome when it shows what changed.
- **Copy** can make a design feel as templated as the visuals; see Writing below.

## Process: plan, review, build, critique

Current AI-generated design clusters around:
1. warm cream background (near #F4F1EA), high-contrast serif display, terracotta or clay accent (near #D97757, Anthropic's own Claude accent, so on a user's brief it reads as a tell);
2. near-black background with one acid-green or vermilion accent;
3. broadsheet layout: hairline rules, zero border-radius, dense newspaper columns;
4. SaaS-card kit: content chopped into identical rounded cards, one radius regardless of hierarchy, the same soft grey shadow (rgba(0,0,0,.1)), gradient washes as decoration;
5. template chrome regardless of subject: tracked-out ALL-CAPS eyebrows over every heading; meta strings joined with middle dots ('A · B · C'); 'WORD — fragment' labels with spaced em dashes; tinted near-black (#0B0B0B, #111) for black; monospace for small data labels; '→' appended to links and buttons.

Each suits some briefs, but they are defaults, not choices. Where the brief pins a visual direction, follow it exactly, even when it asks for one of these looks. Where an axis is free, don't spend that freedom on a default. Like a hired designer, balance what you're good at with experimenting on each project.

Work in two passes:
1. **Plan** a compact token system: color (4–6 named hex values), type (typefaces and roles), layout (one-sentence concepts plus ASCII wireframes to compare; alignment guidance: left, centered, or justified), and principles (what makes this page unique).
2. **Review** the plan against the brief. If any part is what you'd produce for any similar page (try a similar prompt mentally and see if you land in the same place), revise it and say what changed and why. Write code only after that, following the revised plan.

When coding, watch CSS selector specificity: classes easily cancel each other (e.g. a type-based `.section` against an element-based `.cta`), especially padding and margin between sections.

## Restraint and self-critique

Spend your boldness in one place: one memorable element, everything around it quiet and disciplined; cut decoration that doesn't serve the brief. Silently meet a quality floor: responsive to mobile, visible keyboard focus, reduced motion respected, visually accessible, harmonious palette. Critique as you build, with screenshots if the environment allows (a picture is worth 1000 tokens). Per Chanel, look in the mirror and remove one accessory. If you can jot notes on what you tried, do so; it helps future passes try something new.

## Writing

Words exist to make the design easier to understand and use; bring the same minimalism to copy as to spacing and color. First ask what the design needs to say and how best to say it.

- Write from the user's perspective, naming things as users understand them, not as the system is built (users manage notifications, not webhook config). Describe plainly rather than sell; specific beats clever.
- Active voice. A CTA says exactly what happens ("Save changes", not "Submit"). Keep an action's name through the flow: "Publish" produces a "Published" toast. Consistent vocabulary is how people learn their way around.
- Errors and empty states give direction, not mood: say what went wrong and how to fix it, in the interface's voice. Errors don't apologize and are never vague. An empty screen invites action.
- Conversational tone: plain verbs, sentence case, no filler, matched to brand and audience. Each element does one job.
