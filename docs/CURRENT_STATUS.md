# Hydra-Quant Current Status — July 20, 2026

## Document Purpose

This document records the verified implementation and project-operations status of Hydra-Quant as of July 20, 2026.

It identifies:

* the current development environment;
* the authoritative repository and worktree;
* verified source-code and build capabilities;
* repository documentation status;
* coding-agent setup status;
* implemented and unimplemented platform capabilities;
* current roadmap position;
* known limitations and risks;
* the immediate actions required after this checkpoint.

This document is a factual checkpoint.

It does not define long-term project direction, target architecture, implementation sequencing, or new technical decisions.

Those responsibilities belong to:

* [`BLUEPRINT.md`](BLUEPRINT.md) — long-term platform direction;
* [`ARCHITECTURE.md`](ARCHITECTURE.md) — technical boundaries and target architecture;
* [`ROADMAP.md`](ROADMAP.md) — milestone sequencing and delivery planning;
* [`DECISIONS.md`](DECISIONS.md) — accepted decisions and unresolved decision topics;
* [`DEVELOPMENT.md`](DEVELOPMENT.md) — repository development workflow.

## Status Authority

The trusted repository is the primary source of implementation truth.

A capability is considered implemented only when:

* the required code exists in the trusted worktree;
* the code builds successfully;
* the relevant behavior has been verified;
* required tests exist where applicable;
* documentation accurately describes the behavior.

The following do not prove implementation:

* roadmap entries;
* architecture diagrams;
* blueprint descriptions;
* decision records;
* empty directories;
* placeholder classes;
* diagnostic strings;
* code existing only in an agent worktree;
* generated code that has not been reviewed and integrated.

## Status Terminology

This document uses the following capability labels:

* **Implemented** — present in the trusted repository and verified.
* **Planned** — approved as intended future work but not yet implemented.
* **Proposed** — a candidate direction that has not been approved.
* **Under evaluation** — actively being investigated or compared.
* **Not yet implemented** — absent from the trusted implementation.

This document also uses the following operational labels:

* **Complete** — setup or documentation work has been finished and verified.
* **In progress** — active work is occurring but completion criteria have not been met.
* **Pending verification** — work appears present but still requires an explicit check.
* **Not started** — approved work has not begun.
* **Blocked** — work cannot proceed because a dependency or decision is unresolved.

## Checkpoint Summary

* **Checkpoint date:** July 18, 2026
* **Project phase:** Foundation development
* **Roadmap milestone:** R0 — Project and Documentation Foundation
* **R0 delivery status:** In progress
* **Primary language:** C++20
* **Primary platform:** Ubuntu Linux
* **Primary interaction model:** Command line
* **Approved execution scope:** Local simulation and educational development
* **Implemented simulation capability:** Not yet implemented
* **Live-trading status:** Not supported
* **Primary recruiting objective:** Summer 2027 quantitative-development internship
* **Secondary recruiting objective:** Summer 2027 backend-infrastructure internship
* **Fall 2026 semester start:** August 17, 2026

The project currently provides a minimal C++20 foundation and repository-development environment.

It does not yet provide a functional market-data, trading, backtesting, risk, execution, or portfolio platform.

## Development Environment

### Ubuntu virtual machine

**Status: Complete**

The project is developed inside an Oracle virtual machine running Ubuntu Linux.

Verified environment characteristics include:

* the VM operates as a separate machine from the Windows host;
* Ubuntu is used through command-line tools;
* the VM has its own network identity;
* the environment supports C++ and Git development;
* the VM can be shut down and restarted without losing repository files.

### SSH connectivity

**Status: Complete**

The Windows host connects to the Ubuntu VM through SSH.

SSH access provides:

* remote terminal access;
* remote repository access;
* remote build execution;
* remote Git operations;
* Cursor remote-development support.

### Cursor remote development

**Status: Complete**

Cursor is configured to connect to the Ubuntu VM through SSH.

The Hydra-Quant repository can be viewed and edited from Cursor while files and development tools remain inside the Linux VM.

### Primary toolchain

The currently established toolchain includes:

* Ubuntu Linux;
* `g++`;
* GNU Make;
* Git;
* GitHub;
* SSH;
* Cursor;
* Codex CLI.

Claude Code setup is not yet complete.

## Repository Identity

### Public repository

* **Repository:** `angelodiazz/hydra-quant`
* **Default trusted branch:** `main`

The public repository exists and has previously been verified.

Remote synchronization must be checked again after the documentation foundation is committed and pushed.

### Trusted local worktree

* **Path:** `/home/angelo/projects/hydra-core`
* **Branch:** `main`
* **Role:** Authoritative integration and verification worktree

This worktree is the source of truth for accepted Hydra-Quant code and documentation.

Before making trusted changes, verify:

```bash
pwd
git branch --show-current
git status --short
```

Expected path and branch:

```text
/home/angelo/projects/hydra-core
main
```

### Repository authority rule

Changes existing in another worktree or branch are not part of the trusted project until they have been:

* reviewed;
* understood;
* tested;
* approved;
* intentionally integrated into `main`.

## Current Repository Structure

The trusted repository currently includes the following established areas:

```text
hydra-core/
├── AGENTS.md
├── CODEX.md
├── Makefile
├── README.md
├── include/
│   └── engine.hpp
├── src/
│   ├── engine.cpp
│   └── main.cpp
├── tests/
└── docs/
    ├── ARCHITECTURE.md
    ├── BLUEPRINT.md
    ├── CURRENT_STATUS.md
    ├── DECISIONS.md
    ├── DEVELOPMENT.md
    └── ROADMAP.md
```

The exact repository may contain additional supporting files or directories.

This structure does not imply that every planned subsystem is implemented.

## Build System

### Current build capability

**Status: Implemented**

The project currently uses GNU Make.

The current build configuration:

* uses `g++`;
* requests C++20;
* enables `-Wall`;
* enables `-Wextra`;
* enables `-Werror`;
* reads source files from `src/`;
* reads headers from `include/`;
* places object files in `build/`;
* links an executable named `main`.

### Current commands

Build:

```bash
make
```

Run:

```bash
./main
```

Clean generated build output:

```bash
make clean
```

### Build-system limitations

The current Makefile is appropriate for the existing project size.

It does not yet provide verified targets for:

* automated tests;
* sanitizer builds;
* benchmark builds;
* installation;
* packaging;
* multiple runtime executables;
* reusable libraries.

Long-term use of GNU Make versus migration to CMake is **Under evaluation**.

## Current Runtime Implementation

### Program entry point

**Status: Implemented**

`src/main.cpp` provides the current executable entry point.

Its verified purpose is limited to printing a basic command-line runtime diagnostic and exiting.

It does not currently coordinate a trading or backtesting pipeline.

### Core engine scaffold

**Status: Implemented as a scaffold**

`include/engine.hpp` declares the initial:

```cpp
hydra::CoreEngine
```

The scaffold includes:

* a constructor;
* a `run_diagnostics()` method;
* a private system-state string.

`src/engine.cpp` implements this initial behavior.

The scaffold is not a completed engine.

It does not currently coordinate:

* market-data ingestion;
* replay;
* strategies;
* risk;
* orders;
* execution;
* portfolio accounting;
* logging;
* metrics;
* persistence.

### Diagnostic-output warning

The current engine diagnostic contains text referring to POSIX memory and thread pools being ready.

This text is not implementation evidence.

No verified memory-pool or thread-pool subsystem currently exists.

The diagnostic should be corrected or replaced before it is used as a public demonstration of platform capability.

## Automated Testing

### Test directory

**Status: Implemented as repository structure**

A `tests/` directory exists.

### Test framework

**Status: Not yet implemented**

No automated C++ test framework has been integrated.

### Test suite

**Status: Not yet implemented**

The trusted repository currently has no verified:

* unit tests;
* integration tests;
* regression tests;
* property-based tests;
* deterministic scenario tests;
* benchmark tests.

### Test command

**Status: Not yet implemented**

There is no approved automated test command.

Test-framework selection is an open decision required by R1.

## Sanitizers and Static Verification

### AddressSanitizer

**Status: Not yet implemented**

### UndefinedBehaviorSanitizer

**Status: Not yet implemented**

### ThreadSanitizer

**Status: Not yet implemented**

### Static-analysis workflow

**Status: Not yet implemented**

Sanitizer and static-analysis support may be added during later verification work.

Their absence means no sanitizer-based safety claim should currently be made.

## Continuous Integration

### GitHub Actions or equivalent CI

**Status: Not yet implemented**

The repository does not currently have a verified continuous-integration workflow for:

* clean builds;
* tests;
* sanitizers;
* formatting;
* static analysis;
* benchmarks.

Continuous integration is a possible R1 or R3 enhancement.

It is not required to complete the current documentation milestone.

## Documentation Status

### Repository governance documents

#### `AGENTS.md`

**Status: Complete and authoritative within its scope**

Defines shared coding-agent and contributor governance.

#### `CODEX.md`

**Status: Complete and authoritative within its scope**

Defines Codex-specific operating rules.

#### `docs/DEVELOPMENT.md`

**Status: Complete and authoritative within its scope**

Defines repository development and integration workflow.

#### `CLAUDE.md`

**Status: Not yet implemented**

Claude-specific governance will be created during Claude Code setup.

### Shared platform documents

#### `README.md`

**Status: Complete and approved**

Provides the public repository entry point, current capabilities, build instructions, project goals, roadmap summary, workflow summary, and limitations.

#### `docs/BLUEPRINT.md`

**Status: Complete and approved**

Defines the authoritative 2026–2028 platform direction, requirements, engineering principles, project boundaries, and success criteria.

#### `docs/ARCHITECTURE.md`

**Status: Complete and approved**

Defines verified current architecture, planned target boundaries, data flow, ownership, dependency direction, concurrency direction, and open architecture decisions.

#### `docs/ROADMAP.md`

**Status: Complete and approved**

Defines milestones R0 through R7, delivery sequencing, recruiting alignment, academic cadence, decision gates, risks, and completion criteria.

#### `docs/DECISIONS.md`

**Status: Complete and approved**

Records 20 accepted decisions, 25 unresolved decision topics, excluded directions, and the decision-maintenance process.

#### `docs/CURRENT_STATUS.md`

**Status: Complete and approved**

This file completes the six-file shared documentation set.

### Documentation commit and remote status

**Status: Complete**

The six-file shared platform-documentation foundation was committed in:

```text
a3f1d2b docs: establish Hydra-Quant platform blueprint
```

The trusted `main` branch was pushed successfully to `origin/main`.

The public GitHub repository was verified to contain:

```text
README.md
docs/ARCHITECTURE.md
docs/BLUEPRINT.md
docs/CURRENT_STATUS.md
docs/DECISIONS.md
docs/ROADMAP.md
```

The repository commit history, shared governance files, build configuration, source structure, and documentation links were inspected through GitHub.

## Coding-Agent Environment

### Codex

### Installation and authentication

**Status: Complete**

Codex CLI has been installed and authenticated inside the Ubuntu environment.

### Configuration

**Status: Complete**

The established Codex configuration includes:

* workspace-write access;
* approval on request;
* network access disabled.

### Worktree and branch

* **Worktree:** `~/projects/hydra-codex`
* **Branch:** `agent/codex`
* **Status:** Complete

### Governance

Codex must follow:

* `AGENTS.md`;
* `CODEX.md`;
* `docs/DEVELOPMENT.md`;
* accepted shared project documentation.

Codex output is not trusted implementation until reviewed and integrated.

### Claude Code

### Installation

**Status: Not yet completed**

### Authentication and configuration

**Status: Not yet completed**

### Worktree and branch

**Status: Not yet completed**

Claude Code should eventually receive:

* a separate worktree;
* a separate agent branch;
* a `CLAUDE.md` governance file;
* instructions consistent with shared repository governance.

No Claude-generated project work should be described as part of the trusted implementation at this checkpoint.

### Agent Comparison Workflow

**Status: Partially implemented**

The approved workflow is:

1. begin from equivalent trusted code;
2. assign Codex and Claude Code separate worktrees and branches;
3. request independently developed or reviewed solutions;
4. inspect both approaches;
5. compare correctness, clarity, tests, ownership, complexity, and architectural fit;
6. reject or revise unsuitable work;
7. integrate only the approved result into `main`.

Codex isolation is configured.

Claude isolation remains incomplete.

## Platform Capability Matrix

| Capability                     | Status                  | Current evidence                   |
| ------------------------------ | ----------------------- | ---------------------------------- |
| Ubuntu development environment | Implemented             | Oracle Ubuntu VM                   |
| SSH remote access              | Implemented             | Host-to-VM SSH connection          |
| Cursor remote development      | Implemented             | Cursor connected through SSH       |
| Git repository                 | Implemented             | Trusted local repository           |
| Public GitHub repository       | Implemented             | `angelodiazz/hydra-quant`          |
| Trusted `main` worktree        | Implemented             | `/home/angelo/projects/hydra-core` |
| Codex worktree                 | Implemented             | `~/projects/hydra-codex`           |
| Claude Code worktree           | Not yet implemented     | Setup incomplete                   |
| C++20 build                    | Implemented             | GNU Make and `g++`                 |
| Warning-as-error build         | Implemented             | `-Wall -Wextra -Werror`            |
| Command-line executable        | Implemented             | `main` diagnostic executable       |
| `CoreEngine` scaffold          | Implemented as scaffold | Header and implementation exist    |
| Automated test framework       | Not yet implemented     | No framework integrated            |
| Unit tests                     | Not yet implemented     | No verified suite                  |
| Integration tests              | Not yet implemented     | No verified suite                  |
| Continuous integration         | Not yet implemented     | No verified workflow               |
| Sanitizer workflow             | Not yet implemented     | No verified configuration          |
| Benchmark infrastructure       | Not yet implemented     | No verified benchmark target       |
| Typed market-data domain model | Not yet implemented     | No verified domain types           |
| Market-data ingestion          | Not yet implemented     | No supported parser                |
| Validation and normalization   | Not yet implemented     | No verified pipeline               |
| Deterministic replay           | Not yet implemented     | No replay component                |
| Simulation clock               | Not yet implemented     | No controlled clock                |
| Market-state management        | Not yet implemented     | No market-state component          |
| Strategy interface             | Not yet implemented     | No strategy contract               |
| Risk management                | Not yet implemented     | No risk component                  |
| Order management               | Not yet implemented     | No order-state implementation      |
| Execution simulation           | Not yet implemented     | No execution model                 |
| Portfolio accounting           | Not yet implemented     | No accounting component            |
| Structured configuration       | Not yet implemented     | No format or loader                |
| Structured logging             | Not yet implemented     | No logging subsystem               |
| Metrics                        | Not yet implemented     | No metrics subsystem               |
| Reporting and persistence      | Not yet implemented     | No report pipeline                 |
| Network market-data support    | Not yet implemented     | Outside initial slice              |
| Brokerage connectivity         | Not yet implemented     | Outside current scope              |
| Live trading                   | Not supported           | Explicitly excluded                |
| Measured latency results       | Not yet available       | No benchmark evidence              |
| Measured throughput results    | Not yet available       | No benchmark evidence              |

## Current Architecture Position

The trusted runtime currently follows this limited structure:

```text
src/main.cpp
    -> command-line diagnostic output

include/engine.hpp
    -> declares hydra::CoreEngine

src/engine.cpp
    -> implements CoreEngine diagnostic behavior
```

The planned functional architecture has not yet been implemented.

No verified runtime data path currently exists for:

```text
input
    -> parsing
    -> validation
    -> normalization
    -> replay
    -> market state
    -> strategy
    -> risk
    -> orders
    -> execution
    -> portfolio
    -> reporting
```

## Current Roadmap Position

### R0 — Project and Documentation Foundation

**Delivery status: In progress**

### Completed R0 work

* Ubuntu VM created;
* SSH connectivity established;
* Cursor remote development configured;
* Git repository initialized;
* public GitHub repository created;
* project directory structure established;
* GNU Make build created;
* C++20 warning settings established;
* initial executable created;
* initial engine scaffold created;
* trusted worktree established;
* Codex worktree established;
* Codex governance established;
* shared agent governance established;
* development workflow documented;
* `README.md` completed;
* `BLUEPRINT.md` completed;
* `ARCHITECTURE.md` completed;
* `ROADMAP.md` completed;
* `DECISIONS.md` completed.
* `CURRENT_STATUS.md` completed.

### Remaining R0 work

* verify all six shared files together;
* check all Markdown whitespace;
* check document heading hierarchy;
* check cross-document links;
* inspect complete documentation diffs;
* rebuild the current project;
* confirm no unintended repository changes;
* add the six shared documents;
* create an intentional documentation commit;
* push the trusted `main` branch;
verify the files on GitHub;
* complete Claude Code setup;
* create `CLAUDE.md`.

### R0 completion condition

R0 remains in progress until:

* documentation is verified as a set;
* the project build succeeds;
* the documentation commit is created;
* the trusted branch is pushed;
* the public repository is verified;
* no unintended files are included;
* Claude Code installation and authentication are complete;
* the Claude worktree and branch are verified;
* `CLAUDE.md` exists and is verified.

### R1 — Verification and Domain Foundation

**Delivery status: Not started**

R1 has not begun.

Its planned initial focus is:

* automated test-framework selection;
* automated test integration;
* initial typed domain values;
* domain invariant testing;
* sanitizer evaluation;
* build and test command documentation.

No R1 capability should be described as implemented at this checkpoint.

## Recruiting Status

### Primary objective

Secure a Summer 2027 quantitative-development internship.

### Secondary objective

Secure a Summer 2027 backend-infrastructure internship.

### Current recruiting-support progress

**Status: In progress**

Completed supporting work includes:

* Hydra-Quant GitHub repository creation;
* GitHub profile activity;
* LinkedIn updates reflecting current progress;
* NeetCode account creation;
* NeetCode connection to GitHub;
* daily progress tracking;
* summer roadmap tracking;
* recruiting and milestone tracking;
* project documentation designed for future technical review.

### Recruiting limitation

The repository does not yet contain the first functional recruiting-ready vertical slice.

The project currently demonstrates:

* environment setup;
* Linux development;
* Git discipline;
* C++20 build setup;
* repository organization;
* technical planning;
* architecture discipline;
* documentation quality.

The project does not yet demonstrate:

* market-data processing;
* deterministic replay;
* strategy execution;
* risk controls;
* order lifecycle behavior;
* execution simulation;
* portfolio accounting;
* benchmark results.

## Academic and Scheduling Status

### Pre-semester period

Hydra-Quant can receive concentrated development time until August 17, 2026.

The immediate pre-semester priorities are:

1. complete R0;
2. begin R1;
3. establish automated testing;
4. introduce minimal domain values;
5. begin the deterministic-data slice.

### Fall 2026

Fall 2026 classes begin on August 17, 2026.

Confirmed courses are:

* CEN 3031 — Software Engineering Fundamentals;
* COP 4610 — Operating Systems;
* COP 3350 — Systems Administration and Programming;
* COT 3400 — Design and Analysis of Algorithms.

After the semester begins, Hydra-Quant must continue at a reduced and sustainable pace.

Project target dates may move to protect academic performance.

## Current Strengths

The project currently has a strong foundation in:

* Linux virtual-machine setup;
* SSH-based remote development;
* C++20 compilation;
* warning enforcement;
* Git and GitHub setup;
* repository organization;
* worktree isolation;
* agent governance;
* architecture planning;
* roadmap planning;
* decision tracking;
* implementation-status honesty;
* recruiting alignment.

These strengths establish a reliable basis for functional implementation.

They are not substitutes for working platform capabilities.

## Current Limitations

The following limitations are verified and must remain visible.

### Functional limitations

* no market-data ingestion;
* no normalized event model;
* no deterministic replay;
* no market-state component;
* no strategy interface;
* no risk validation;
* no order lifecycle;
* no execution simulation;
* no portfolio accounting;
* no backtesting coordinator.

### Verification limitations

* no automated test framework;
* no unit-test suite;
* no integration-test suite;
* no continuous integration;
* no sanitizer workflow;
* no static-analysis workflow;
* no benchmark infrastructure.

### Operational limitations

* no structured configuration;
* no structured logs;
* no metrics;
* no persistent reports;
* no network connectivity;
* no exchange connectivity;
* no brokerage connectivity;
* no live-trading capability.

### Performance limitations

* no measured latency;
* no measured throughput;
* no allocation analysis;
* no profiling results;
* no verified low-latency result;
* no approved concurrency design;
* no memory-pool implementation;
* no thread-pool implementation;
* no lock-free data structures.

### Workflow limitations

* Claude Code setup is incomplete;
* `CLAUDE.md` does not yet exist;
* the Claude worktree and `agent/claude` branch have not yet been created;
* the Codex branch must be synchronized with the latest approved `main` baseline;
* parallel-agent isolation has not yet been verified with both agents configured.

## Known Issues and Cleanup Items

### Misleading diagnostic text

The current engine diagnostic refers to memory and thread pools as ready.

No such verified subsystems exist.

The text should be removed or replaced before the executable becomes a public functional demonstration.

### Generic executable name

The current executable is named `main`.

This is acceptable for the initial scaffold.

A more descriptive executable name may be selected later if project structure requires it.

### Empty test infrastructure

The `tests/` directory exists without a framework or suite.

This must not be presented as automated testing.

### Build-system growth

The current Makefile is sufficient for the scaffold.

It may require extension or replacement when tests, multiple targets, dependencies, sanitizers, and benchmarks are added.

### Documentation synchronization

The shared platform documentation has been reviewed, committed, pushed, and verified on GitHub.

Future status changes must be recorded when Claude Code setup is completed, the agent worktrees are synchronized, or R1 begins.

## Immediate Next Actions

Perform the following remaining R0 actions in order.

### 1. Create and review Claude Code instructions

Draft the initial `CLAUDE.md` using the established shared governance documents, agent restrictions, and parallel-agent architecture.

Review the file before adding it to the trusted repository.

### 2. Commit and push `CLAUDE.md`

After review:

```bash
git add CLAUDE.md
git diff --cached
git diff --cached --check
git commit -m "docs: add Claude Code operating instructions"
git push origin main
```

### 3. Install and authenticate Claude Code

Install Claude Code inside the Ubuntu VM and complete authentication using Angelo's approved account.

Do not grant unnecessary permissions or enable unrestricted network or filesystem access.

### 4. Configure Claude Code safely

Configure Claude Code so that it:

* works only inside its assigned worktree;
* does not modify the trusted `hydra-core` worktree;
* does not switch to or work directly on `main`;
* does not install dependencies without approval;
* does not perform Git governance operations without approval;
* follows `AGENTS.md`, `CLAUDE.md`, and the shared project documentation.

### 5. Create the Claude worktree and branch

Create the isolated Claude worktree at:

```text
/home/angelo/projects/hydra-claude
```

Use the dedicated branch:

```text
agent/claude
```

### 6. Synchronize the agent branches

Ensure the Codex and Claude branches both begin from the latest approved `main` commit before equivalent work is assigned.

### 7. Verify parallel-agent isolation

Confirm that:

* Codex works only inside `hydra-codex`;
* Claude works only inside `hydra-claude`;
* neither agent modifies `hydra-core`;
* neither agent works directly on `main`;
* the agents cannot overwrite each other's worktrees;
* Angelo retains control of review, commits, pushes, merges, and integration.

### 8. Update project status

Update `docs/CURRENT_STATUS.md` after Claude Code, the Claude worktree, branch synchronization, and agent isolation have been verified.

Confirm every R0 exit criterion before marking R0 complete.

### 9. Begin R1

After R0 is complete, begin the first functional milestone with:

* test-framework evaluation;
* build-and-test integration;
* initial domain-representation decisions;
* minimal domain types;
* invariant tests.

## Checkpoint Completion Criteria

This July 20, 2026 checkpoint is considered fully recorded because:

* this file exists;
* its facts match the trusted repository;
* all six shared documents passed formatting and structural checks;
* implemented and planned capabilities are clearly distinguished;
* documentation links were verified;
* the documentation change was committed;
* the trusted `main` branch was pushed;
* the public GitHub repository was verified.

R0 remains **In progress** until:

* `CLAUDE.md` is created, reviewed, committed, and pushed;
* Claude Code is installed, authenticated, and safely configured;
* the `hydra-claude` worktree and `agent/claude` branch are created;
* the Codex and Claude branches begin from the same approved `main` baseline;
* parallel-agent isolation is verified;
* the final R0 status update is completed.

## Status Update Rules

Update this document when verified project state changes materially.

Examples include:

* a milestone begins or completes;
* a subsystem becomes implemented;
* a test framework is integrated;
* tests are added;
* a build or runtime command changes;
* a worktree is added or removed;
* Claude Code setup is completed;
* a major limitation is removed;
* benchmark evidence becomes available;
* the public repository state changes materially.

Do not update this document for:

* unapproved ideas;
* agent suggestions;
* code existing only in an agent branch;
* planned roadmap work;
* architecture diagrams without implementation;
* temporary experiments;
* trivial daily activity.

A status update must distinguish:

* verified implementation;
* approved future work;
* unresolved decisions;
* deferred possibilities.

## Document Maintenance

This document should remain concise enough to function as a reliable checkpoint, but complete enough to resume work without reconstructing project state from memory.

When a new checkpoint replaces this one:

* update the checkpoint date;
* preserve factual history through Git;
* mark completed work only after verification;
* remove limitations only when the trusted implementation changes;
* update roadmap delivery status where necessary;
* update accepted decisions where necessary;
* keep implementation evidence separate from plans.

Changes to this document must not weaken or override governance established in:

* [`../AGENTS.md`](../AGENTS.md);
* [`../CODEX.md`](../CODEX.md);
* [`DEVELOPMENT.md`](DEVELOPMENT.md);
* `../CLAUDE.md` after that file is created.
