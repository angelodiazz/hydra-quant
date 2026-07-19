# Hydra-Quant Development Workflow

## Purpose

This document defines the shared development workflow for Hydra-Quant.

It applies to:

* Angelo;
* Codex;
* Claude Code;
* future contributors or development agents.

This file explains how work is planned, implemented, reviewed, compared, tested, and integrated. Agent-specific behavior is defined separately in `AGENTS.md`, `CODEX.md`, and `CLAUDE.md`.

## Instruction Priority

All contributors and agents must follow the repository instructions in this order:

1. explicit instructions from Angelo for the current task;
2. `AGENTS.md`;
3. the contributor’s agent-specific instruction file;
4. this development workflow;
5. other relevant files under `docs/`;
6. established repository conventions.

An instruction with weaker safety requirements must not override a stricter repository rule.

When instructions appear to conflict, stop and ask Angelo before making changes.

## Repository Worktrees

Hydra-Quant uses separate Git worktrees:

```text
~/projects/hydra-core
~/projects/hydra-codex
~/projects/hydra-claude
```

Their responsibilities are:

| Worktree       | Branch         | Purpose                                          |
| -------------- | -------------- | ------------------------------------------------ |
| `hydra-core`   | `main`         | Trusted and approved project state               |
| `hydra-codex`  | `agent/codex`  | Independent Codex implementation workspace       |
| `hydra-claude` | `agent/claude` | Independent Claude Code implementation workspace |

The `hydra-core` worktree is controlled by Angelo.

Agents must work only in their assigned worktrees and branches.

## Main Branch Policy

The `main` branch represents the approved version of Hydra-Quant.

Changes enter `main` only after:

1. implementation is complete;
2. relevant builds and tests pass;
3. the changes are reviewed;
4. important risks and tradeoffs are understood;
5. Angelo explicitly approves integration.

Agents must not work directly on `main` or integrate their own changes into it.

## Approved Baseline

Before Codex and Claude Code receive equivalent comparison tasks, both agent branches must begin from the same approved commit on `main`.

The baseline commit should be recorded before implementation begins.

Example:

```text
Approved baseline: <commit hash>
Codex branch: agent/codex
Claude branch: agent/claude
```

Implementations created from different baselines must not be compared as equivalent solutions unless Angelo explicitly allows it.

## Task Definition

Each meaningful development task should identify:

* the problem being solved;
* the desired behavior;
* relevant files or subsystem;
* technical constraints;
* behavior that must remain unchanged;
* expected build or test requirements;
* whether Codex, Claude Code, or both agents will implement it;
* whether the task is exploratory, educational, or production-oriented.

A task should be narrow enough to review and test independently.

Large features should be divided into smaller milestones when practical.

## Development Lifecycle

A normal task follows this sequence:

1. establish the approved baseline;
2. inspect relevant code and documentation;
3. summarize the current behavior;
4. define the desired result;
5. propose an implementation plan;
6. identify affected files and risks;
7. obtain required approval;
8. implement focused changes;
9. build the project;
10. run relevant tests;
11. inspect the final diff;
12. explain the result;
13. compare implementations when multiple agents were used;
14. approve one implementation or combine selected ideas;
15. integrate the approved result into `main`;
16. push the approved project state to GitHub.

Steps may be simplified for very small changes, but safety and verification requirements still apply.

## Planning Requirements

Before a significant implementation, the contributor or agent should explain:

* what currently exists;
* what will change;
* why the change is necessary;
* which files are expected to change;
* whether public interfaces will change;
* whether new dependencies are required;
* correctness risks;
* memory and lifetime risks;
* concurrency risks;
* performance implications;
* compatibility risks;
* planned verification.

Additional approval is required before changing:

* overall architecture;
* public APIs;
* build systems;
* compiler settings;
* dependencies;
* repository governance;
* persistent data formats;
* concurrency models;
* networking behavior;
* security-sensitive code;
* multiple subsystems at once.

## Implementation Rules

Changes should be:

* focused on the requested task;
* small enough to review;
* consistent with existing repository structure;
* explicit about ownership and lifetime;
* deterministic when practical;
* testable;
* documented when behavior is not obvious;
* free from unrelated formatting or refactoring.

Do not mix unrelated cleanup with feature work unless Angelo approves it.

Do not replace working code solely because a different style is preferred.

Do not introduce speculative abstractions for hypothetical future requirements.

## C++ Standards

Hydra-Quant uses C++20.

Code should:

* compile without warnings;
* treat enabled compiler warnings as errors;
* use RAII;
* make ownership clear;
* avoid undefined behavior;
* avoid unnecessary dynamic allocation;
* avoid unnecessary copies;
* prefer value semantics where appropriate;
* use `const` intentionally;
* preserve deterministic behavior;
* consider thread safety and object lifetime;
* keep interfaces small and intentional;
* separate declarations and definitions appropriately;
* use descriptive names;
* include tests for meaningful behavior.

Performance-focused code must remain understandable and verifiable.

An optimization should not be described as beneficial unless supported by measurement, profiling, benchmarking, or a clearly established requirement.

## Build and Test Workflow

Use the repository’s documented build and test commands.

Before running commands, agents must follow the explanation and approval requirements in `AGENTS.md`.

After relevant code changes:

1. build the affected targets;
2. report warnings and errors;
3. run applicable automated tests;
4. run the executable when appropriate;
5. test important failure paths and edge cases;
6. report any test that could not be executed;
7. do not conceal or bypass failures.

Do not:

* disable warnings to make code compile;
* remove failing tests without approval;
* weaken assertions without justification;
* change expected test results merely to match incorrect behavior;
* claim success when verification was incomplete.

If the repository does not yet provide a suitable test command, document the limitation and propose an appropriate testing approach.

## Diff Review

Before presenting a completed implementation, inspect the final changes.

The review should check for:

* files changed outside the intended scope;
* accidental generated files;
* debugging output;
* temporary comments;
* hard-coded local paths;
* credentials or sensitive information;
* unnecessary formatting changes;
* incomplete error handling;
* missing tests;
* unclear ownership;
* unsafe lifetime assumptions;
* performance regressions;
* undocumented public behavior changes.

The contributor should be able to explain every meaningful changed line.

## Parallel-Agent Comparison

Codex and Claude Code may implement the same task independently.

Both agents must:

* begin from the same approved baseline;
* receive equivalent requirements;
* remain inside their assigned worktrees;
* avoid inspecting the other agent’s implementation;
* build and test their own solution;
* explain their own design decisions;
* report limitations honestly.

Comparison should consider:

* correctness;
* simplicity;
* readability;
* architecture;
* memory safety;
* lifetime safety;
* test quality;
* performance implications;
* maintainability;
* consistency with Hydra-Quant goals;
* educational value;
* scope discipline.

The chosen implementation does not have to come entirely from one agent. Selected ideas may be combined intentionally after review, but integration must remain controlled and understandable.

## Integration Workflow

Only Angelo approves integration into `main`.

Before integration, confirm:

* the source branch and worktree;
* the approved commit or diff;
* the files that will enter `main`;
* build and test results;
* known limitations;
* whether documentation must also change.

Integration may use a merge, cherry-pick, or manually selected changes depending on the situation.

The chosen method should preserve understandable project history and avoid unrelated changes.

After integration:

1. build and test from `hydra-core`;
2. inspect `git status`;
3. inspect the resulting commit history;
4. confirm the working tree is clean;
5. push the approved `main` branch to GitHub;
6. synchronize agent branches before the next equivalent task.

## Git Commit Standards

Commits should represent one coherent change.

Use clear imperative-style messages with an appropriate category when practical:

```text
feat: add order validation
fix: prevent invalid engine state
test: add matching engine edge cases
docs: document agent workflow
refactor: simplify market data interface
build: update compiler configuration
chore: maintain repository tooling
```

Commit messages should explain what the commit accomplishes, not merely which file was edited.

Do not combine unrelated features, fixes, documentation, and cleanup into one commit unless they form one inseparable change.

Agents must not stage, commit, push, merge, rebase, or perform other restricted Git actions without Angelo’s explicit approval.

## Documentation Rules

Documentation should be updated when a change affects:

* architecture;
* public interfaces;
* build procedures;
* development workflow;
* roadmap status;
* major technical decisions;
* system behavior;
* operational requirements;
* agent instructions.

Shared project documentation must remain agent-neutral.

Agent-specific behavior belongs in the appropriate agent-specific instruction file.

Repository governance files must not be modified without explicit approval.

## Failure Handling

When a command, build, or test fails:

1. stop and inspect the exact error;
2. report the failure accurately;
3. explain the likely cause;
4. distinguish evidence from assumptions;
5. propose the smallest safe next diagnostic step;
6. request approval when the next action changes state or exceeds existing permissions.

Do not repeatedly attempt unrelated fixes.

Do not hide failures with suppressed output, weakened validation, or unexplained workarounds.

## Learning-First Development

Hydra-Quant is both a production-style project and a learning project.

Important work should include explanations of:

* what changed;
* why the approach was chosen;
* how the implementation works;
* relevant C++ or systems concepts;
* ownership and lifetime behavior;
* correctness considerations;
* performance tradeoffs;
* alternative approaches.

Generated code should support Angelo’s understanding rather than replace it.

## Definition of Done

A task is complete when:

* the requested behavior is implemented;
* changes remain within the approved scope;
* the code builds successfully;
* relevant tests pass;
* failures and limitations are disclosed;
* the final diff has been reviewed;
* important decisions are explained;
* required documentation is updated;
* no unauthorized Git or system actions were performed;
* the working tree state is reported;
* Angelo has enough information to approve, reject, or revise the result.

Completion of implementation does not automatically mean approval for integration into `main`.
