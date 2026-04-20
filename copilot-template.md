# Optional Copilot project starting prompt
## Dont forget to include Andrej Karpathy's CLAUDE.md instructions in the actual CLAUDE.md file

## Prompt:
All the following stuff I will ask you to do needs to be as token saving as possible while also being detailed as to not miss anything. First I want you to create a simple document called Structure.md it needs to be very basic where you will define the project base structure for future reference. Then based on the following Design document, I want you to devise an complete TODO.md where you will create a todo list from scratch all the way to the MVP and then more for the upcoming versions, and even a section for the to plan feature that might be interesting but are not required to have on the MVP and need to make sense based on the app concept, very important the order of the features to be implemented must be by implementation order, for example if one feature depends on another then the other needs to be implemented first. Then I want you to create a CLAUDE.md and an AGENTS.md file they both need to have the exact same text inside and I want you to create a simple description to teach the AI to read the Structure.md to understand the project structure, read the TODO.md to understand which features need to be developed and tell it to automatically update the file when new features are fully implemented and working, and an empty IMPLEMENTATION.md file that will serve the purpose of the features currently being implemented, and detected problems to be fixed, this file is the main project guide which will guide the AIs to understand what is next on the development list and this of course needs to tie with the TODO.md. Also extremely important in the CLAUDE.md and AGENTS.md tell it to use fvm instead of flutter since its required and tell it to try a command only once, if it does not work stop and ask the user to run it instead or simply continue.

## Karpathy CLAUDE.md

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution
**Define success criteria. Loop until verified.**
Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```
Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.
---
**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.
