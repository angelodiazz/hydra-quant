# Hydra-Quant Codex Instructions

## Purpose

This file contains Codex-specific operating instructions for Hydra-Quant.

These instructions supplement `AGENTS.md`. They do not replace or override it. If there is a conflict, the stricter rule applies.

## Assigned Workspace

Codex is assigned to:

```text
/home/angelo/projects/hydra-codex
```

Expected Git branch:

```text
agent/codex
```

Codex must not work from:

```text
/home/angelo/projects/hydra-core
/home/angelo/projects/hydra-claude
```

The `hydra-core` worktree contains the trusted `main` branch. The `hydra-claude` worktree belongs to Claude Code.

## Required Startup Check

After reading `AGENTS.md` and `CODEX.md`, and before inspecting project source files or modifying anything, run only these read-only verification commands:

```bash
pwd
git branch --show-current
git status
git worktree list
```

Expected results:

```text
Working directory: /home/angelo/projects/hydra-codex
Current branch: agent/codex
```

If either value is different, stop and notify Angelo. Do not switch branches or change directories into another worktree.

## Instruction Loading

Before beginning a task, read:

1. `AGENTS.md`
2. `CODEX.md`
3. `docs/DEVELOPMENT.md` for implementation, review, comparison, testing, or integration tasks
4. `README.md`, when available
5. other relevant files under `docs/`

Do not modify instruction, governance, configuration, or architecture documentation unless Angelo explicitly requests it.

## Planning Requirement

For implementation tasks:

1. Inspect the relevant files.
2. Explain the current behavior.
3. Restate the requested outcome.
4. Propose a concise plan.
5. Identify files likely to change.
6. Identify correctness, performance, concurrency, and compatibility risks.
7. Wait for approval when the task changes architecture, dependencies, public interfaces, or multiple subsystems.

Do not begin with a large unexplained implementation.

## Command Behavior

Before running a command:

1. State the command.
2. Explain what it does.
3. Explain why it is needed.
4. State whether it changes files, Git state, dependencies, or system state.
5. Request approval when required by `AGENTS.md`.

Prefer the smallest command that verifies the needed information.

Do not chain destructive or state-changing commands together.

## Codex Configuration

Codex is expected to use the user-level configuration stored at:

```text
~/.codex/config.toml
```

The intended baseline is:

```toml
model = "gpt-5.6"
model_reasoning_effort = "high"
approval_policy = "on-request"
sandbox_mode = "workspace-write"

[sandbox_workspace_write]
network_access = false
```

Do not modify the Codex configuration, authentication files, or files under `~/.codex` without explicit approval.

Never display, copy, or modify authentication secrets.

## Filesystem and Network Restrictions

Only modify files inside the assigned Codex worktree.

Do not:

* access or modify the Claude worktree;
* access or modify the trusted main worktree;
* modify files under `~/.ssh`;
* inspect credential files;
* modify shell configuration;
* modify operating-system files;
* install packages;
* enable network access;
* download external code or dependencies;

unless Angelo explicitly approves the specific action.

## Git Restrictions

Follow all Git restrictions in `AGENTS.md`.

Codex may inspect repository state with read-only commands, but it must not stage, commit, push, pull, merge, rebase, cherry-pick, reset, restore, clean, stash, fetch, switch branches, or create/delete branches or worktrees without explicit approval.

Codex must never force-push or rewrite shared history.

## Implementation Standards

For C++ work:

* use C++20;
* preserve warning-free compilation;
* treat compiler warnings as errors;
* prefer RAII and explicit ownership;
* avoid undefined behavior;
* avoid unnecessary allocation;
* preserve deterministic behavior;
* consider thread safety and lifetime safety;
* keep interfaces focused;
* avoid speculative abstractions;
* add or update tests for meaningful behavior;
* document non-obvious performance decisions.

For low-latency code, distinguish between measured performance requirements and assumptions. Do not claim an optimization is beneficial without evidence.

## Build and Verification

Use the repository’s documented build and test process.

At minimum, after relevant C++ changes:

1. build the project;
2. report compiler output;
3. run applicable tests;
4. run the executable when appropriate;
5. report failures without hiding or bypassing them.

Do not weaken compiler flags or remove tests merely to make a change pass.

## Parallel-Agent Independence

Claude Code may receive the same task in a separate worktree.

Produce an independent implementation. Do not inspect, copy, or modify Claude Code’s files or branch.

Do not assume that another agent’s design is correct. Explain the reasoning behind the Codex implementation so Angelo can compare both approaches.

## Completion Report

At the end of a task, report:

* summary of the approach;
* files changed;
* important implementation decisions;
* commands executed;
* build results;
* test results;
* known limitations;
* performance or safety considerations;
* Git actions not yet performed;
* recommended next review step.

Do not commit, push, or integrate the result unless Angelo explicitly approves it.
