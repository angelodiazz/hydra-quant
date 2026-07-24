# Hydra-Quant Claude Code Instructions

## Purpose

This file contains Claude Code-specific operating instructions for Hydra-Quant.

These instructions supplement `AGENTS.md`. They do not replace or weaken it. If instructions appear to conflict, the stricter safety rule applies and Claude Code must stop and notify Angelo before proceeding.

## Governing Project Context

Before beginning any Hydra-Quant task, Claude Code must read and follow:

* @AGENTS.md
* @docs/DEVELOPMENT.md
* @README.md
* relevant files under `docs/`

The following documents have distinct authority:

* `docs/BLUEPRINT.md` defines long-term platform direction.
* `docs/ARCHITECTURE.md` defines technical boundaries and target architecture.
* `docs/ROADMAP.md` defines implementation sequencing.
* `docs/DECISIONS.md` determines which technical choices are accepted, proposed, deferred, rejected, or under evaluation.
* `docs/CURRENT_STATUS.md`, trusted source code, builds, and tests determine what is actually implemented.

Claude Code must never describe planned, proposed, deferred, or evaluated functionality as implemented.

## Assigned Workspace

Claude Code is assigned exclusively to:

```text
/home/angelo/projects/hydra-claude
```

Expected Git branch:

```text
agent/claude
```

Claude Code must not work from, inspect project files inside, or modify:

```text
/home/angelo/projects/hydra-core
/home/angelo/projects/hydra-codex
```

`hydra-core` contains the trusted `main` branch and is controlled by Angelo.

`hydra-codex` is the independent Codex workspace.

Claude Code must remain inside its assigned worktree unless Angelo explicitly authorizes a specific exception.

## Required Startup Verification

Before inspecting source files, proposing changes, or running project commands, Claude Code must run only these read-only checks:

```bash
pwd
git branch --show-current
git status
git worktree list
```

Expected values:

```text
Working directory: /home/angelo/projects/hydra-claude
Current branch: agent/claude
```

If either value differs, Claude Code must stop immediately.

Claude Code must not switch branches, move into another worktree, or attempt to correct the problem automatically.

## Protected Main Branch

The `main` branch represents the approved Hydra-Quant project state.

Claude Code must not:

* work directly on `main`;
* edit the `hydra-core` worktree;
* switch its worktree to `main`;
* merge into `main`;
* rebase without explicit approval;
* rewrite Git history;
* force-push;
* delete branches;
* delete worktrees;
* integrate its own work into the trusted project.

Only Angelo may approve changes entering `main`.

Claude-generated work is not trusted implementation until it has been reviewed, understood, tested, approved, and intentionally integrated.

## Git Restrictions

Claude Code may use read-only Git commands such as:

```text
git status
git diff
git log
git branch --show-current
git worktree list
git show
git rev-parse
```

Claude Code must not run the following without Angelo’s explicit approval for the specific action:

```text
git add
git commit
git push
git pull
git fetch
git merge
git rebase
git cherry-pick
git reset
git restore
git clean
git stash
git checkout
git switch
git branch
git worktree add
git worktree remove
```

Claude Code must never force-push or rewrite shared history.

## Governance Protection

Claude Code must not modify any of the following unless Angelo explicitly requests the exact governance change:

```text
AGENTS.md
CODEX.md
CLAUDE.md
docs/DEVELOPMENT.md
.claude/
user-level Claude configuration
authentication files
```

Claude Code must not weaken permissions, remove restrictions, or bypass approval requirements.

Claude Code must never start with:

```text
--dangerously-skip-permissions
```

## Filesystem Restrictions

Claude Code may modify only files inside:

```text
/home/angelo/projects/hydra-claude
```

Claude Code must not access or modify:

* the trusted main worktree;
* the Codex worktree;
* SSH configuration;
* credentials;
* authentication tokens;
* shell configuration;
* operating-system files;
* user configuration outside the assigned task;
* files outside its assigned worktree.

Claude Code must not request additional directories through `--add-dir` or `/add-dir` unless Angelo explicitly approves the exact directory.

## Network and Dependency Restrictions

Claude Code requires network access to communicate with Anthropic’s service.

That required service connection does not authorize general-purpose network activity.

Without explicit approval, Claude Code must not:

* use web-search or web-fetch tools;
* run `curl` or `wget`;
* clone external repositories;
* download external code;
* install packages;
* remove packages;
* upgrade packages;
* change dependency versions;
* run package-manager installation commands;
* enable new network integrations;
* add MCP servers;
* expose project files or credentials to external services.

Before requesting a dependency or network action, Claude Code must explain:

1. what it wants to access or install;
2. why it is necessary;
3. what files or system state will change;
4. the security and maintenance implications;
5. whether a standard-library or existing-project alternative exists.

## Planning Requirement

Before implementing a meaningful change, Claude Code must:

1. inspect the relevant code and documentation;
2. summarize the verified current behavior;
3. restate the requested outcome;
4. propose a concise implementation plan;
5. identify the files likely to change;
6. identify correctness risks;
7. identify ownership and lifetime risks;
8. identify concurrency risks;
9. identify performance implications;
10. identify compatibility and build risks;
11. describe the planned verification;
12. wait for approval when required.

Claude Code must not begin with a large unexplained implementation.

Additional approval is required before changing:

* architecture;
* public interfaces;
* build systems;
* compiler settings;
* dependencies;
* persistent formats;
* concurrency models;
* networking behavior;
* security-sensitive behavior;
* governance;
* multiple subsystems at once.

## Implementation Standards

Hydra-Quant uses C++20.

Claude Code must:

* preserve warning-free compilation;
* treat enabled warnings as errors;
* prefer RAII;
* make ownership explicit;
* avoid undefined behavior;
* avoid unnecessary dynamic allocation;
* avoid unnecessary copying;
* preserve deterministic behavior;
* keep interfaces narrow and intentional;
* use descriptive names;
* separate declarations and definitions appropriately;
* add or update tests for meaningful behavior;
* document non-obvious performance decisions;
* avoid speculative abstractions;
* avoid broad placeholder subsystem creation;
* preserve source-format-independent domain boundaries;
* preserve the initial single-process, single-threaded, synchronous simulation direction unless a later accepted decision changes it.

Correctness comes before optimization.

Measurement comes before concurrency, specialized allocation, memory mapping, lock-free structures, hardware timing mechanisms, or unsupported performance claims.

## Build and Verification

Claude Code must use the build and test procedures documented by the trusted repository.

After relevant C++ changes, Claude Code must:

1. build the affected project targets;
2. report all compiler output;
3. run applicable tests;
4. run the executable when appropriate;
5. test important failure paths;
6. inspect the final diff;
7. report any verification that could not be performed.

Claude Code must not:

* weaken compiler warnings;
* hide compiler failures;
* remove failing tests without approval;
* weaken assertions merely to obtain a passing result;
* modify expected results to match incorrect behavior;
* claim successful verification when checks were incomplete.

## Parallel-Agent Independence

Claude Code and Codex may receive equivalent tasks from the same approved `main` commit.

Claude Code must produce an independent solution.

Claude Code must not:

* inspect the Codex worktree;
* copy Codex changes;
* modify Codex files;
* assume Codex’s design is authoritative;
* communicate with another agent without Angelo’s explicit direction.

When comparison work is requested, Claude Code should explain its own reasoning so Angelo can evaluate correctness, clarity, testing, ownership, complexity, and architectural fit.

## Learning-First Requirement

Hydra-Quant is an educational and portfolio project.

Claude Code must explain important work in beginner-friendly language, including:

* what changed;
* why it changed;
* how it works;
* relevant C++ or systems concepts;
* ownership and lifetime behavior;
* failure handling;
* testing strategy;
* performance implications;
* important tradeoffs.

Claude Code must not replace Angelo’s learning process with unexplained generated code.

## Completion Report

At the end of every meaningful task, Claude Code must report:

* summary of the approach;
* files changed;
* important implementation decisions;
* commands executed;
* build results;
* test results;
* failure-path checks;
* known limitations;
* unresolved risks;
* performance or safety considerations;
* Git actions not performed;
* recommended review step.

Claude Code must not commit, push, merge, or integrate the result unless Angelo explicitly approves the exact Git action.
