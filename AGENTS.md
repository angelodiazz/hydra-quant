# Hydra-Quant Agent Instructions

## Project Context

Hydra-Quant is a C++20 low-latency algorithmic trading platform developed as a production-style engineering and portfolio project.

Priorities include:

* correctness;
* deterministic behavior;
* clear architecture;
* performance awareness;
* memory safety;
* testability;
* maintainable documentation;
* learning-first explanations.

## Parallel-Agent Architecture

This repository uses separate Git worktrees for parallel coding agents:

* `~/projects/hydra-core` — trusted worktree on `main`
* `~/projects/hydra-codex` — Codex worktree on `agent/codex`
* `~/projects/hydra-claude` — Claude Code worktree on `agent/claude`

Each agent must work only inside its assigned worktree.

## Shared Starting Point

Before equivalent comparison tasks, both agent branches must start from the same approved commit on `main`.

Do not compare implementations created from different approved baselines unless Angelo explicitly authorizes it.

## Protected Main Branch

The `main` branch represents the approved version of Hydra-Quant.

Agents must not:

* edit the `hydra-core` worktree;
* work directly on `main`;
* switch their worktree to `main`;
* merge into `main`;
* rebase onto another branch without approval;
* rewrite Git history;
* force-push;
* delete branches or worktrees.

Agents must not modify `AGENTS.md`, `CLAUDE.md`, agent configuration files, or repository governance rules without explicit approval.

Only Angelo may approve changes entering `main`.

## Git Restrictions

Do not run any of the following without explicit approval:

* `git add`
* `git commit`
* `git push`
* `git pull`
* `git merge`
* `git rebase`
* `git cherry-pick`
* `git reset`
* `git restore`
* `git clean`
* `git stash`
* `git fetch`
* `git checkout` or `git switch`
* branch or worktree creation/deletion

Agents may use read-only Git commands such as:

* `git status`
* `git diff`
* `git log`
* `git branch --show-current`
* `git worktree list`

## Filesystem Boundaries

Only modify files inside the current assigned worktree.

Do not access or modify another agent’s worktree. Do not modify user configuration, system files, SSH files, credentials, or files outside the assigned workspace unless explicitly approved.

## Commands and Dependencies

Before running a command:

1. Explain what the command does.
2. Explain why it is needed.
3. State whether it changes files or system state.
4. Request approval when required.

Do not install, remove, or upgrade dependencies without explicit approval.

Do not use network access unless explicitly approved.

## Implementation Workflow

For implementation tasks:

1. Inspect the relevant code and documentation.
2. Summarize the current behavior.
3. Propose a concise implementation plan.
4. Identify affected files and risks.
5. Wait for approval when the task involves significant structural changes.
6. Make focused changes only within the assigned worktree.
7. Build and test the result.
8. Report:

   * files changed;
   * commands run;
   * tests performed;
   * unresolved risks;
   * recommended next step.

## Code Standards

* Use C++20.
* Compile with warnings enabled and treated as errors.
* Prefer RAII and clear ownership.
* Avoid unnecessary dynamic allocation.
* Avoid undefined behavior.
* Use descriptive names.
* Keep interfaces small and intentional.
* Separate declarations and definitions appropriately.
* Do not introduce abstractions without a clear purpose.
* Add tests for meaningful behavior.
* Do not optimize without evidence, but preserve low-latency design goals.

## Learning-First Requirement

Explain important decisions in beginner-friendly language.

For significant code changes, explain:

* what changed;
* why it changed;
* how it works;
* relevant C++ or systems concepts;
* performance and safety tradeoffs.

Do not replace the user’s learning process with unexplained generated code.

## Agent Comparison

Codex and Claude Code may receive the same task independently.

Do not assume the other agent’s implementation is authoritative. Do not copy from or modify the other agent’s worktree. Produce an independent solution that can be reviewed and compared.
