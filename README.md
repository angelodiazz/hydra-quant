# Hydra-Quant

Hydra-Quant is a production-style C++20 algorithmic-trading infrastructure project focused on correctness, deterministic behavior, explicit ownership, testability, and performance-aware systems design.

The platform is being developed from 2026 through 2028 as an engineering and portfolio project. It provides a practical environment for studying modern C++, Linux systems programming, algorithms, backend infrastructure, testing, data engineering, and low-latency design.

Hydra-Quant is not presented as a profitable trading system. It is a systems-engineering project centered on market-data processing, deterministic simulation, risk controls, execution modeling, portfolio accounting, measurement, and maintainable architecture.

## Current Status

* **Project phase:** Foundation development
* **Checkpoint:** July 20, 2026
* **Primary language:** C++20
* **Primary development environment:** Ubuntu Linux
* **Repository:** `angelodiazz/hydra-quant`

The repository currently includes:

* a working GNU Make build pipeline;
* compilation with C++20, `-Wall`, `-Wextra`, and `-Werror`;
* initial `src/`, `include/`, `tests/`, and `docs/` directories;
* a minimal command-line runtime diagnostic;
* an initial `hydra::CoreEngine` scaffold;
* repository governance and development-workflow documentation;
* a trusted `main` worktree;
* an isolated Codex worktree on a separate agent branch.

Claude Code installation, configuration, and worktree setup are not yet complete.

The major trading-platform subsystems are **not yet implemented**. Market-data ingestion, deterministic replay, strategy execution, risk management, order management, execution simulation, portfolio accounting, and performance benchmarking remain planned work.

See [`docs/CURRENT_STATUS.md`](docs/CURRENT_STATUS.md) for the authoritative project checkpoint.

## Project Goals

Hydra-Quant is intended to demonstrate the disciplined construction of a non-trivial C++ system.

The primary engineering goals are to:

* process structured market data through clear and testable interfaces;
* support repeatable and deterministic market-data replay;
* separate market data, strategy logic, risk controls, execution, and accounting;
* model orders, fills, positions, and profit and loss through simulation;
* manage resources and object lifetimes through RAII and explicit ownership;
* reject malformed input and invalid state predictably;
* build automated unit, integration, and deterministic regression tests;
* introduce concurrency only after ownership and synchronization requirements are understood;
* measure performance before making latency or throughput claims;
* maintain documentation that accurately reflects the implementation;
* produce presentable milestones for Summer 2027 quantitative-development and backend-infrastructure internship recruiting.

## Why the Project Exists

Hydra-Quant has two related purposes.

### Engineering education

The platform provides a practical environment for applying:

* modern C++20;
* memory management and RAII;
* data structures and algorithms;
* Linux development;
* operating-system concepts;
* concurrency and synchronization;
* file and data ingestion;
* backend component design;
* testing and observability;
* profiling and performance measurement;
* software architecture and technical documentation.

Development follows a learning-first process. Agent-generated or agent-assisted code must be reviewed, understood, tested, and explicitly approved before it becomes trusted project code.

### Portfolio development

Hydra-Quant is intended to become Angelo Diaz's primary systems-programming portfolio project for Summer 2027 internship recruiting and continued undergraduate development through Spring 2028.

Portfolio value must come from engineering evidence rather than unsupported claims. Expected evidence includes:

* meaningful Git history;
* documented architecture and project decisions;
* repeatable build and test instructions;
* deterministic demonstrations;
* tests covering important behavior and failure cases;
* reproducible benchmark methodology;
* documented limitations and tradeoffs;
* milestone-based releases supported by implemented functionality.

## Capability Status

The following table distinguishes the current implementation from planned platform work.

| Capability                                 | Status              |
| ------------------------------------------ | ------------------- |
| C++20 project foundation                   | Implemented         |
| GNU Make build pipeline                    | Implemented         |
| Command-line runtime diagnostic            | Implemented         |
| Initial engine scaffold                    | Implemented         |
| Typed market-data models                   | Planned             |
| Market-data ingestion and validation       | Planned             |
| Deterministic market-data replay           | Planned             |
| Strategy interfaces and example strategies | Planned             |
| Pre-trade risk validation                  | Planned             |
| Order lifecycle management                 | Planned             |
| Simulated execution and fill modeling      | Planned             |
| Position and portfolio accounting          | Planned             |
| Backtesting and scenario execution         | Planned             |
| Structured logging and runtime metrics     | Planned             |
| Automated unit and integration tests       | Not yet implemented |
| Continuous integration                     | Planned             |
| Profiling and reproducible benchmarks      | Planned             |
| Concurrency and thread-allocation model    | Under evaluation    |
| Exchange or brokerage connectivity         | Not yet implemented |
| Live trading                               | Not yet implemented |

Initial development will use historical or generated input data with simulated orders, fills, positions, and capital. The current platform does not connect to a brokerage or place real orders.

## High-Level Architecture

The planned platform will use components with narrow responsibilities and explicit dependency boundaries.

```text
Market Data Source
        |
        v
Ingestion and Validation
        |
        v
Normalization and Deterministic Replay
        |
        v
Strategy Evaluation
        |
        v
Risk Validation
        |
        v
Order Management
        |
        v
Execution Simulation
        |
        v
Positions, Portfolio State, Metrics, and Reports
```

Planned cross-cutting services include:

* configuration;
* logging;
* metrics;
* persistence;
* error reporting;
* deterministic test support;
* profiling and benchmarking infrastructure.

The complete pipeline shown above is **not yet implemented**. Components will be introduced incrementally. Each subsystem must have a defined responsibility, interface, ownership model, and verification strategy before additional complexity is added.

See [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for the authoritative current and target architecture.

## Repository Structure

```text
.
├── include/                 C++ headers
├── src/                     C++ implementation files and executable entry points
├── tests/                   Automated tests as they are introduced
├── docs/                    Shared project and engineering documentation
├── AGENTS.md                Repository-wide coding-agent governance
├── CODEX.md                 Codex-specific operating instructions
├── Makefile                 Current GNU Make build configuration
└── README.md                Public repository entry point
```

`CLAUDE.md` will be created separately as part of the Claude Code setup.

The repository structure will evolve only when new components require clear and justified boundaries.

## Build and Run

### Requirements

The current build requires:

* Ubuntu Linux or another compatible Linux environment;
* GNU Make;
* `g++` with C++20 support.

From the repository root, build the project with:

```bash
make
```

The current Makefile:

* compiles `.cpp` files from `src/`;
* reads project headers from `include/`;
* stores object files in `build/`;
* creates an executable named `main`.

Run the executable with:

```bash
./main
```

Remove generated object files and the executable with:

```bash
make clean
```

The current executable performs only a basic runtime diagnostic. Its output must not be interpreted as evidence that the planned market-data, trading, memory-pool, or threading subsystems have been implemented.

## Testing

The `tests/` directory exists, but an automated test framework and test suite are **not yet implemented**.

The current build enforces:

```text
-std=c++20 -Wall -Wextra -Werror
```

Planned testing work includes:

* unit tests for value types and validation rules;
* parser tests for valid and malformed input;
* deterministic replay tests;
* order and risk-state transition tests;
* integration tests across subsystem boundaries;
* regression tests for corrected defects;
* sanitizer-assisted development checks;
* reproducible performance benchmarks separated from correctness tests.

No test-coverage, latency, throughput, or scalability claims should be made until the relevant tooling, methodology, and measurements exist.

## Roadmap Summary

### Summer 2026: Foundation

Before Fall 2026 classes begin on August 17, 2026, development is concentrated on:

* completing the shared documentation foundation;
* strengthening the repository and build structure;
* defining initial market-data value types;
* implementing and testing a basic ingestion path;
* handling malformed input predictably;
* beginning deterministic replay;
* maintaining reviewable Git history.

### Fall 2026: Recruiting Milestone

Once classes begin, development will continue at a reduced and sustainable pace.

The Fall 2026 objective is an early, presentable system slice demonstrating:

* clean C++20 organization;
* documented component boundaries;
* deterministic input processing;
* meaningful automated tests;
* a reproducible command-line demonstration;
* accurate documentation of implemented and missing behavior.

This milestone is prioritized for Summer 2027 recruiting. Completion of the entire platform is not required.

### 2027: Platform Expansion

Planned 2027 work may expand the platform through:

* richer market-data replay;
* strategy interfaces;
* risk controls;
* order and execution state machines;
* portfolio accounting;
* structured logging and metrics;
* integration testing;
* profiling and measured optimization;
* carefully justified concurrency.

The exact order will remain milestone-based and may change according to implementation results, recruiting needs, and academic workload.

### 2028: Integration and Refinement

The 2028 phase is expected to focus on:

* subsystem integration;
* reliability;
* architectural refinement;
* documentation quality;
* reproducible demonstrations;
* measured performance work;
* completion of a defensible undergraduate portfolio system.

See [`docs/ROADMAP.md`](docs/ROADMAP.md) for detailed phases, dependencies, deliverables, and verification criteria.

## Documentation

Hydra-Quant uses shared, agent-neutral documentation for project direction and agent-specific files for operating instructions.

| Document                                           | Responsibility                                                        |
| -------------------------------------------------- | --------------------------------------------------------------------- |
| [`README.md`](README.md)                           | Public project overview and entry point                               |
| [`docs/BLUEPRINT.md`](docs/BLUEPRINT.md)           | Authoritative 2026–2028 platform vision, requirements, and boundaries |
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)     | Current and target technical architecture                             |
| [`docs/ROADMAP.md`](docs/ROADMAP.md)               | Time-aware phases, milestones, and dependencies                       |
| [`docs/DECISIONS.md`](docs/DECISIONS.md)           | Confirmed decisions and unresolved design topics                      |
| [`docs/CURRENT_STATUS.md`](docs/CURRENT_STATUS.md) | Factual project checkpoint                                            |
| [`docs/DEVELOPMENT.md`](docs/DEVELOPMENT.md)       | Development, testing, review, and Git procedures                      |
| [`AGENTS.md`](AGENTS.md)                           | Repository-wide coding-agent governance                               |
| [`CODEX.md`](CODEX.md)                             | Codex-specific operating instructions                                 |
| `CLAUDE.md`                                        | Planned Claude Code-specific instructions                             |

At the July 20, 2026 checkpoint, the shared blueprint, architecture, roadmap, decision log, and current-status documents are complete, committed, pushed, and available through the links above. Claude Code setup and `CLAUDE.md` remain pending.

Repository governance files take precedence over abbreviated workflow descriptions in this README.

## Development and Agent Workflow

By project policy, the trusted `main` worktree is the protected integration environment.

Agent-assisted development must occur in isolated worktrees and branches. Codex and Claude Code may independently investigate or implement the same task so their approaches can be compared. Agent output does not become trusted project code automatically.

Before contributing:

1. Read [`AGENTS.md`](AGENTS.md).
2. Read [`docs/DEVELOPMENT.md`](docs/DEVELOPMENT.md).
3. Read the relevant shared architecture, roadmap, status, and decision documents.
4. Read the relevant agent-specific instruction file.
5. Work only in the assigned worktree and branch.
6. Keep changes narrow and reviewable.
7. Support changes with tests or explicit verification where applicable.
8. Obtain explicit approval before agent-initiated Git operations, system changes, or integration into `main`.

The complete governance files remain authoritative over this summary.

## Engineering Principles

Hydra-Quant development follows these priorities:

1. Correctness before optimization.
2. Deterministic behavior where repeatability is required.
3. Explicit ownership and RAII.
4. Memory safety and defined object lifetimes.
5. Clear interfaces and dependency direction.
6. Warnings treated as errors.
7. Tests for meaningful behavior and failure cases.
8. Measurement before performance claims.
9. Documentation that matches the implementation.
10. Technical understanding before feature volume.

## Current Limitations

Hydra-Quant remains in an early foundation stage.

Current limitations include:

* no market-data ingestion pipeline;
* no deterministic replay engine;
* no strategy runtime;
* no risk engine;
* no order-management system;
* no execution simulator;
* no portfolio or profit-and-loss accounting;
* no automated test suite;
* no continuous-integration pipeline;
* no finalized concurrency model;
* no measured latency or throughput results;
* no exchange or brokerage connectivity;
* no live-trading capability;
* no stable public API.

These are factual project-state disclosures. They must be updated only when verified implementation milestones change the project state.

## Project Scope

Hydra-Quant is an educational and portfolio project. It is not financial advice, a brokerage service, or a production deployment for real-money trading.

The project should be evaluated through the quality of its architecture, implementation, testing, documentation, Git history, and reproducible engineering evidence.
