# Hydra-Quant Decision Register

## Document Purpose

This document records consequential decisions that govern the design, implementation, development workflow, and presentation of Hydra-Quant.

It exists to preserve:

* the decision that was made;
* the reason it was made;
* the alternatives or pressures considered;
* the consequences of the decision;
* the conditions under which it may be reconsidered;
* the relationship between approved decisions and unresolved topics.

This document is not an implementation-status report.

A recorded decision may describe approved future direction without claiming that the associated capability is implemented.

The long-term platform direction is defined in [`BLUEPRINT.md`](BLUEPRINT.md). Technical boundaries are defined in [`ARCHITECTURE.md`](ARCHITECTURE.md). Delivery sequencing is defined in [`ROADMAP.md`](ROADMAP.md). Verified implementation progress is recorded in [`CURRENT_STATUS.md`](CURRENT_STATUS.md).

## Decision Baseline

* **Initial decision-register baseline:** July 18, 2026
* **Project:** Hydra-Quant
* **Project horizon:** 2026–2028
* **Primary language:** C++20
* **Primary development environment:** Ubuntu Linux
* **Trusted repository worktree:** `/home/angelo/projects/hydra-core`
* **Trusted branch:** `main`

The baseline date records when the initial authoritative project documentation was established. It does not imply that every underlying choice originated on that exact date.

## Decision Status

Every decision record must use one of the following statuses.

* **Proposed** — written for consideration but not approved.
* **Under evaluation** — being actively investigated or compared.
* **Accepted** — approved and currently governing the project.
* **Superseded** — replaced by a later accepted decision.
* **Deprecated** — still present temporarily but no longer preferred.
* **Rejected** — considered and intentionally not adopted.
* **Withdrawn** — removed before approval.
* **Deferred** — intentionally postponed until a later requirement or milestone.

Only **Accepted** decisions govern current project direction.

A **Proposed**, **Under evaluation**, **Deferred**, or **Rejected** record must not be described elsewhere as an approved implementation decision.

## Decision Record Rules

### Accepted decisions are append-only

After a decision is accepted, its meaning should not be silently rewritten.

Permitted edits include:

* spelling corrections;
* formatting corrections;
* repaired links;
* clarification that does not alter the decision;
* addition of references to later records.

A material change requires a new decision record.

### Supersession must be explicit

A decision is replaced by:

1. creating a new decision record;
2. marking the new record **Accepted**;
3. marking the old record **Superseded**;
4. linking each record to the other;
5. updating affected architecture and roadmap documentation.

Historical decisions should remain visible so that the project’s evolution can be understood.

### Decisions are not implementation evidence

An accepted decision defines approved direction.

It does not prove that:

* code exists;
* tests exist;
* a subsystem works;
* performance has been measured;
* a milestone is complete.

Implementation evidence belongs in the trusted repository and [`CURRENT_STATUS.md`](CURRENT_STATUS.md).

### Consequential decisions require records

A decision should be recorded when it materially affects:

* language standard;
* supported platform;
* build system;
* third-party dependencies;
* domain representations;
* component boundaries;
* ownership;
* error handling;
* event ordering;
* determinism;
* concurrency;
* persistence;
* security;
* testing;
* benchmarking;
* live-versus-simulated execution;
* trusted-branch workflow;
* agent integration;
* repository governance.

Small implementation details do not require separate records unless they create a durable constraint.

## Decision Record Format

New records should use the following structure:

```text
#### D-XXX — Decision title

- Status:
- Recorded:
- Scope:
- Supersedes:
- Superseded by:

#### Context

Why a decision is required.

#### Decision

The approved or proposed choice.

#### Rationale

Why this choice is appropriate.

#### Consequences

Benefits, costs, constraints, and follow-up work.

#### Reconsideration Triggers

Conditions that justify reviewing the decision.
```

Decision identifiers must not be reused.

## Accepted Decision Index

| ID    | Decision                                                                   | Status   | Recorded      |
| ----- | -------------------------------------------------------------------------- | -------- | ------------- |
| D-001 | Use C++20 as the project language standard                                 | Accepted | July 18, 2026 |
| D-002 | Use Ubuntu Linux as the primary platform                                   | Accepted | July 18, 2026 |
| D-003 | Treat the trusted `main` worktree as authoritative                         | Accepted | July 18, 2026 |
| D-004 | Isolate coding agents in separate Git worktrees and branches               | Accepted | July 18, 2026 |
| D-005 | Prioritize correctness before optimization                                 | Accepted | July 18, 2026 |
| D-006 | Require deterministic behavior for supported simulation paths              | Accepted | July 18, 2026 |
| D-007 | Use explicit ownership and RAII-based resource management                  | Accepted | July 18, 2026 |
| D-008 | Begin with a single-process, single-threaded synchronous simulation model  | Accepted | July 18, 2026 |
| D-009 | Keep the current platform simulation-only                                  | Accepted | July 18, 2026 |
| D-010 | Begin with local or generated data rather than network feeds               | Accepted | July 18, 2026 |
| D-011 | Introduce automated testing with the first functional development          | Accepted | July 18, 2026 |
| D-012 | Require reproducible evidence before performance claims                    | Accepted | July 18, 2026 |
| D-013 | Implement complete vertical slices before broad subsystem scaffolding      | Accepted | July 18, 2026 |
| D-014 | Retain GNU Make for the current project foundation                         | Accepted | July 18, 2026 |
| D-015 | Use explicit documentation status labels                                   | Accepted | July 18, 2026 |
| D-016 | Keep command-line operation as the initial user interface                  | Accepted | July 18, 2026 |
| D-017 | Preserve subsystem boundaries and prohibit direct cross-subsystem mutation | Accepted | July 18, 2026 |
| D-018 | Keep configuration and external effects outside core domain rules          | Accepted | July 18, 2026 |
| D-019 | Keep correctness tests separate from performance benchmarks                | Accepted | July 18, 2026 |
| D-020 | Do not allow project documentation to override repository governance       | Accepted | July 18, 2026 |

## Accepted Decisions

### D-001 — Use C++20 as the Project Language Standard

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Entire trusted C++ codebase
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant is intended to demonstrate modern C++ systems-development practices while remaining compatible with the existing Ubuntu and `g++` development environment.

A consistent language standard is required for:

* build reproducibility;
* compiler behavior;
* available standard-library facilities;
* contributor expectations;
* technical documentation;
* interview explanations.

#### Decision

Hydra-Quant uses C++20 as its approved language standard.

Supported project targets must compile using C++20 unless a later accepted decision changes the standard.

#### Rationale

C++20 provides modern language and library capabilities while remaining appropriate for:

* value-oriented domain types;
* RAII;
* move semantics;
* templates and concepts where justified;
* standard-library containers and algorithms;
* systems-oriented implementation;
* Linux development.

Using one explicit standard avoids accidental reliance on compiler defaults.

#### Consequences

* Build configurations must request C++20 explicitly.
* Code reviews should reject accidental dependence on later language standards.
* Documentation and examples should assume C++20.
* A future language-standard change requires a new decision record.
* Use of a C++20 feature must still be justified by readability and project value.

#### Reconsideration Triggers

Review this decision if:

* a required dependency drops C++20 support;
* a later standard provides a necessary and broadly supported capability;
* compiler support creates a verified project limitation;
* project requirements materially change.

### D-002 — Use Ubuntu Linux as the Primary Platform

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Development, build, test, and benchmark environment
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant is developed inside an Ubuntu virtual machine accessed through SSH.

The project requires one primary environment so build behavior, commands, tooling, and measurements remain understandable and reproducible.

#### Decision

Ubuntu Linux is the primary supported development and execution platform.

Broader portability may be evaluated later, but it must not delay the primary Linux implementation.

#### Rationale

Ubuntu Linux supports:

* the existing VM environment;
* `g++`;
* GNU Make;
* common debugging and profiling tools;
* systems-programming study;
* operating-system coursework alignment;
* remote SSH development;
* reproducible command-line workflows.

#### Consequences

* Primary documentation uses Ubuntu-compatible commands.
* Platform-dependent behavior must be identified.
* Performance evidence must identify the Linux environment used.
* Windows-native support is not required for current milestones.
* Cross-platform abstractions should not be introduced without a verified need.

#### Reconsideration Triggers

Review this decision if:

* internship or academic requirements require another platform;
* a supported project deliverable requires portability;
* Linux-specific assumptions become an unnecessary architectural constraint.

### D-003 — Treat the Trusted `main` Worktree as Authoritative

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Repository integration and project truth
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant uses multiple Git worktrees so human-reviewed work and agent-generated work can remain isolated.

Without one authoritative worktree and branch, repository state could become ambiguous.

#### Decision

The worktree at:

```text
/home/angelo/projects/hydra-core
```

on branch:

```text
main
```

is the trusted project worktree.

Only reviewed and approved changes should be integrated into this branch.

#### Rationale

One authoritative location provides:

* a known source of truth;
* controlled integration;
* predictable build verification;
* clear repository status;
* protection from accidental agent changes;
* simpler troubleshooting.

#### Consequences

Before trusted changes, contributors should verify:

```bash
pwd
git branch --show-current
git status --short
```

Agent work must not be mistaken for trusted project state.

A capability is not implemented merely because it exists in an agent worktree.

#### Reconsideration Triggers

Review this decision if:

* the repository adopts a different branching model;
* release branches become necessary;
* team collaboration requires a formal integration branch;
* the trusted repository path changes.

### D-004 — Isolate Coding Agents in Separate Git Worktrees and Branches

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Codex, Claude Code, and future coding-agent workflows
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant may use multiple coding agents to propose implementations, review code, and compare technical approaches.

Allowing multiple agents to edit the trusted worktree directly would create unnecessary conflict and reduce review control.

#### Decision

Each coding agent should work in its own Git worktree and branch.

Current approved structure includes:

* trusted worktree: `/home/angelo/projects/hydra-core`;
* trusted branch: `main`;
* Codex worktree: `~/projects/hydra-codex`;
* Codex branch: `agent/codex`.

Claude Code should receive its own worktree and branch when setup is completed.

#### Rationale

Separate worktrees provide:

* independent experimentation;
* branch-level comparison;
* reduced file conflict;
* safer rejection of unwanted changes;
* clearer diffs;
* controlled integration into `main`.

#### Consequences

* Agent output is untrusted until reviewed.
* Agents may produce competing solutions.
* Integration occurs through intentional Git operations.
* Worktree and branch identity must be checked before editing.
* Agent instructions must remain consistent with repository governance.
* Agent-generated code must be understood before acceptance.

#### Reconsideration Triggers

Review this decision if:

* agent tooling no longer supports isolated worktrees;
* repository scale requires a different integration workflow;
* formal pull-request review replaces local worktree comparison.

### D-005 — Prioritize Correctness Before Optimization

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Architecture, implementation, review, and optimization
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant has a performance-aware and low-latency engineering focus.

That focus could encourage premature use of complex techniques before correct behavior and invariants exist.

#### Decision

Correctness must be established before performance optimization.

Optimization must not justify:

* undefined behavior;
* unclear ownership;
* hidden state changes;
* invalid state transitions;
* weakened testing;
* uncontrolled nondeterminism;
* undocumented assumptions.

#### Rationale

A fast incorrect simulation is not useful evidence of engineering quality.

Correctness-first development produces:

* trustworthy baselines;
* meaningful benchmarks;
* safer refactoring;
* defensible technical explanations;
* clearer performance tradeoffs.

#### Consequences

Performance-oriented changes require existing correct behavior and tests.

Specialized structures should not be introduced merely because they are associated with low-latency software.

The simplest correct design is preferred until measurement establishes a need for more complexity.

#### Reconsideration Triggers

This principle should not normally be reversed.

Specific implementation choices may be reconsidered when correct behavior and measurement justify optimization.

### D-006 — Require Deterministic Behavior for Supported Simulation Paths

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Simulation, replay, strategy testing, execution testing, and accounting
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant must support repeatable backtesting and reliable automated verification.

Uncontrolled time, randomness, event ordering, or thread scheduling would make defects difficult to reproduce and results difficult to defend.

#### Decision

Supported deterministic simulation paths must produce identical observable domain results when given identical:

* input data;
* configuration;
* initial state;
* strategy behavior;
* risk rules;
* execution rules;
* controlled dependencies.

#### Rationale

Determinism supports:

* regression testing;
* reproducible demonstrations;
* debugging;
* result comparison;
* architecture validation;
* trustworthy portfolio evidence.

#### Consequences

Deterministic paths must control or isolate:

* time;
* randomness;
* event ordering;
* iteration order;
* external state;
* concurrency.

Simulation time must remain distinct from real system time.

Any randomness used by a supported deterministic model must use controlled seeds.

#### Reconsideration Triggers

Review specific deterministic boundaries if:

* a future real-time mode is added;
* distributed or networked behavior becomes necessary;
* nondeterministic models are introduced intentionally.

A nondeterministic mode must remain clearly separated from deterministic testing and simulation.

### D-007 — Use Explicit Ownership and RAII-Based Resource Management

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Memory, files, operating-system resources, threads, locks, and object lifetimes
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant is a C++ systems project whose quality depends heavily on memory safety, ownership clarity, and predictable lifetime management.

#### Decision

Managed resources must use explicit ownership and RAII.

Preferred ownership techniques are:

* automatic storage duration;
* value semantics;
* standard-library containers;
* `std::unique_ptr` for exclusive dynamic ownership;
* references for required non-owning access;
* pointers for optional non-owning access with clear lifetimes.

Raw owning pointers are prohibited.

`std::shared_ptr` requires documented justification.

#### Rationale

This approach reduces:

* leaks;
* double deletion;
* use-after-free behavior;
* hiddership transfer;
* manual cleanup errors;
* lifetime ambiguity.

It also improves testability and code review.

#### Consequences

* Ownership must be explainable at subsystem boundaries.
* Resource acquisition and release should be tied to object lifetime.
* Destruction order must not depend on undocumented assumptions.
* Cyclic shared ownership must be avoided.
* Custom memory-management systems require a later decision and evidence.

#### Reconsideration Triggers

Review specific ownership mechanisms if:

* profiling identifies allocation as a real bottleneck;
* an external API imposes different lifetime constraints;
* specialized allocation provides measured value without weakening safety.

### D-008 — Begin with a Single-Process, Single-Threaded Synchronous Simulation Model

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Initial functional platform architecture
* **Supersedes:** None
* **Superseded by:** None

#### Context

The platform does not yet have stable domain contracts, state ownership, shutdown behavior, or benchmark evidence.

Introducing concurrency at this stage would increase complexity without a verified performance requirement.

#### Decision

The first functional Hydra-Quant simulation path will use:

* one process;
* one deterministic simulation thread;
* ordered event processing;
* synchronous calls between core subsystems;
* explicit startup and shutdown;
* no background work required for correctness.

This is an approved implementation direction, not a claim that the functional pipeline already exists.

#### Rationale

A synchronous single-threaded model simplifies:

* ownership;
* event ordering;
* debugging;
* deterministic tests;
* invariant enforcement;
* error propagation;
* shutdown behavior.

#### Consequences

* One thread per subsystem is not assumed.
* Thread pools are not part of the initial model.
* Lock-free queues are not part of the initial model.
* CPU affinity is not part of the initial model.
* Concurrency requires a later accepted decision supported by measurement.

#### Reconsideration Triggers

Review this decision only after:

* a correct integrated simulation exists;
* representative workload measurements exist;
* a specific bottleneck is identified;
* ownership and shutdown rules are documented;
* deterministic testing can be preserved;
* a concurrent design provides measured benefit.

### D-009 — Keep the Current Platform Simulation-Only

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Platform operation and project safety
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant is an educational and portfolio project.

Live order placement introduces operational, financial, regulatory, credential, and safety concerns that are unnecessary for the current objectives.

#### Decision

Hydra-Quant remains a simulation and backtesting platform throughout the current roadmap.

The platform will not place real-money orders or operate as a brokerage.

#### Rationale

Simulation-only scope allows the project to focus on:

* C++ engineering;
* deterministic processing;
* risk modeling;
* order-state design;
* execution modeling;
* accounting;
* testing;
* performance measurement.

It prevents live connectivity from displacing foundational engineering work.

#### Consequences

* Brokerage credentials are not required.
* Real order-routing APIs are outside current scope.
* Execution results are simulated.
* Strategy output must not be described as financial advice.
* Simulated profitability must not be represented as a real-world result.
* A future live mode requires a separate architecture, security, risk, and governance decision.

#### Reconsideration Triggers

Review this decision only if the project’s purpose changes materially and a complete safety and governance design is approved.

### D-010 — Begin with Local or Generated Data Rather Than Network Feeds

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Initial market-data input
* **Supersedes:** None
* **Superseded by:** None

#### Context

The first recruiting milestone requires deterministic ingestion and replay, not live market-data connectivity.

Network feeds would introduce:

* credentials;
* transport failures;
* timeouts;
* retries;
* rate limits;
* external availability;
* nondeterministic timing.

#### Decision

The initial data path will use supported local historical data or generated deterministic fixtures.

The exact initial file format remains unresolved.

#### Rationale

Local and generated input supports:

* repeatable tests;
* controlled malformed-input cases;
* offline development;
* reproducible demonstrations;
* simpler failure handling;
* focus on domain architecture.

#### Consequences

* Network feeds are outside the first vertical slice.
* Input files must be treated as untrusted external data.
* Parsing and validation remain separate from domain logic.
* CSV may be evaluated, but it is not approved by this decision.
* Future network support must adapt into the same controlled domain boundaries.

#### Reconsideration Triggers

Review this decision after:

* deterministic local ingestion is complete;
* replay behavior is stable;
* network connectivity provides verified project value;
* credentials and failure handling can be isolated safely.

### D-011 — Introduce Automated Testing with the First Functional Development

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** All functional subsystems
* **Supersedes:** None
* **Superseded by:** None

#### Context

The repository contains a `tests/` directory but does not yet contain an auto framework.

Postponing testing would allow unverified behavior and architectural coupling to accumulate.

#### Decision

Automated testing must be introduced before or alongside the first functional domain and ingestion work.

Testing is a milestone requirement, not a final cleanup task.

#### Rationale

Early testing supports:

* domain invariants;
* deterministic replay;
* failure-path verification;
* regression protection;
* interface design;
* safer refactoring;
* recruiting evidence.

#### Consequences

* The test framework must be selected during the verification-foundation milestone.
* Important success and failure paths require tests.
* Deterministic tests must avoid real current time.
* Corrected defects should receive regression tests where practical.
* A placeholder test directory does not count as test implementation.

#### Reconsideration Triggers

The selected framework may change through a later decision.

The requirement for early automated testing should remain.

### D-012 — Require Reproducible Evidence Before Performance Claims

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Documentation, benchmarks, résumé statements, and technical discussion
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant has a low-latency and performance-engineering focus, but the current implementation has no benchmark evidence.

Unsupported claims would reduce project credibility.

#### Decision

Claims about latency, throughput, memory use, scalability, or efficiency require reproducible evidence.

Evidence must identify:

* workload;
* environment;
* compiler;
* build flags;
* measurement method;
* units;
* relevant limitations.

#### Rationale

Measurement-based claims are:

* defensible;
* comparable;
* educational;
* useful for optimization;
* appropriate for recruiting.

#### Consequences

* “Low latency” may describe an engineering objective, not a measured result.
* Placeholder diagnostics are not performance evidence.
* Benchmarks must be repeatable.
* Before-and-after evidence is required for optimization claims.
* Résumé and LinkedIn statements must match repository evidence.

#### Reconsideration Triggers

The benchmark methodology may evolve.

The evidence requirement should remain.

### D-013 — Implement Complete Vertical Slices Before Broad Subsystem Scaffolding

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Roadmap sequencing and implementation strategy
* **Supersedes:** None
* **Superseded by:** None

#### Context

The target platform contains many possible subsystems.

Creating all subsystem skeletons early would produce breadth without verified behavior.

#### Decision

Implementation should prioritize complete vertical slices that produce an observable result.

The first planned slice is:

```text
local or generated input
    -> parsing
    -> validation
    -> normalized domain event
    -> deterministic replay
    -> observable output
```

#### Rationale

Vertical slices provide:

* working demonstrations;
* integration evidence;
* earlier tests;
* realistic interface feedback;
* recruiting milestones;
* reduced speculative design.

#### Consequences

* Unused subsystem skeletons should not be created.
* Strategy, risk, execution, and portfolio work must not delay the initial data-and-replay slice.
* Interfaces should be introduced when required by verified use cases.
* Optional features must not displace milestone exit criteria.

#### Reconsideration Triggers

The order of later vertical slices may change when:

* architecture findings requirng;
* recruiting needs change;
* academic constraints change;
* a dependency becomes blocked.

### D-014 — Retain GNU Make for the Current Project Foundation

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Current build system
* **Supersedes:** None
* **Superseded by:** None

#### Context

The trusted repository already has a working GNU Make build for the current small codebase.

A build-system migration before functional requirements emerge would add work without immediate verified value.

#### Decision

GNU Make remains the approved build system for the current project foundation.

This decision does not permanently select GNU Make for the complete 2026–2028 platform.

#### Rationale

The current Makefile is:

* working;
* understandable;
* sufficient for the existing source layout;
* compatible with Ubuntu and `g++`;
* appropriate for the current project size.

#### Consequences

* Current documentation uses `make`.
* Build targets should remain simple and reproducible.
* Test integration may extend the existing Makefile.
* CMake remains under evaluation.
* Migration requires a verified need and a later decision.

#### Reconsideration Triggers

Review this decision if:

* test integration becomes difficult;
* dependency management becomes difficult;
* multiple executables or libraries create excessive Makefile complexity;
* installation or packaging is required;
* IDE or continuous-integration support provides clear value.

### D-015 — Use Explicit Documentation Status Labels

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Shared technical and planning documentation
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant documentation describes current implementation, approved future direction, candidate ideas, and unresolved choices.

Without explicit labels, planned features could be mistaken for completed work.

#### Decision

Shared documentation uses these capability labels:

* **Implemented**
* **Planned**
* **Proposed**
* **Under evaluation**
* **Not yet implemented**

The roadmap additionally uses delivery labels:

* **Not started**
* **In progress**
* **Blocked**
* **Completed**
* **Deferred**
* **Removed**

#### Rationale

Explicit status labels improve:

* factual accuracy;
* contributor understanding;
* recruiting credibility;
* roadmap maintenance;
* architectural clarity.

#### Consequences

* Planned architecture is not implementation evidence.
* A capability’s status changes only after verification.
* Documentation must be updated when verified milestones change.
* Ambiguous claims should be corrected immediately.
* `CURRENT_STATUS.md` remains the factual implementation checkpoint.

#### Reconsideration Triggers

Review the label set if:

* statuses become ambiguous;
* additional project-management states are required;
* documentation maintenance becomes unnecessarily complex.

### D-016 — Keep Command-Line Operation as the Initial User Interface

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Initial supported interaction model
* **Supersedes:** None
* **Superseded by:** None

#### Context

The project’s early value comes from the engine, domain boundaries, testing, and reproducibility.

A graphical or web interface would add unrelated complexity before the core platform is stable.

#### Decision

The initial supported Hydra-Quant interaction model is command-line based.

#### Rationale

A command-line interface supports:

* deterministic demonstrations;
* scriptable execution;
* test automation;
* simple configuration;
* remote SSH development;
* focus on core systems engineering.

#### Consequences

* GUI development is deferred.
* Web application development is deferred.
* Commands and exit behavior should be documented.
* Core logic must not become coupled to console output.
* Future interfaces should reuse application boundaries rather than rewrite domain behavior.

#### Reconsideration Triggers

Review this decision after:

* the complete simulation path is stable;
* a graphical interface provides clear portfolio or usability value;
* a separate front end can be introduced without coupling to domain rules.

### D-017 — Preserve Subsystem Boundaries and Prohibit Direct Cross-Subsystem Mutation

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Target platform architecture
* **Supersedes:** None
* **Superseded by:** None

#### Context

Trading-platform components manage different forms of state.

Allowing components to modify each other’s internal state directly would create hidden coupling and make deterministic verification difficult.

#### Decision

Subsystems interact through typed inputs, outputs, commands, results, or controlled views.

Direct mutation across subsystem boundaries is prohibited.

Examples include:

* strategies do not mutate portfolio state;
* strategies do not activate orders directly;
* risk management does not generate fills;
* execution simulation does not mutate strategy state;
* persistence does not mutate active order state;
* logging and metrics do not alter domain decisions.

#### Rationale

Controlled boundaries support:

* local reasoning;
* independent tests;
* clear ownership;
* valid state transitions;
* replacement of infrastructure;
* architecture evolution.

#### Consequences

* Shared mutable containers should not be exposed.
* State ownership must be assigned explicitly.
* Coordinators sequence behavior rather than bypass interfaces.
* Cyclic dependencies are prohibited.
* New cross-component behavior requires a clear contract.

#### Reconsideration Triggers

Specific interfaces may evolve when implementation experience identifies a better boundary.

The prohibition on uncontrolled direct mutation should remain.

### D-018 — Keep Configuration and External Effects Outside Core Domain Rules

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Domain architecture and infrastructure boundaries
* **Supersedes:** None
* **Superseded by:** None

#### Context

File access, environment variables, real time, randomness, logging, persistence, and future networking can introduce nondeterminism and infrastructure coupling.

#### Decision

Core domain rules must not directly depend on:

* configuration-file parsing;
* environment-variable access;
* real system time;
* uncontrolled randomness;
* file I/O;
* logging implementations;
* persistence formats;
* network clients.

External effects must be isolated through application or infrastructure boundaries.

#### Rationale

This separation improves:

* deterministic testing;
* portability of domain logic;
* failure isolation;
* interface clarity;
* infrastructure replacement;
* reproducibility.

#### Consequences

* Components should receive validated settings rather than read global configuration.
* Simulation time must be provided through a controlled abstraction or value.
* Persistence consumes explicit results.
* Logging remains observational.
* Infrastructure adapts external representations into domain concepts.

#### Reconsideration Triggers

Specific boundaries may evolve when actual implementation requirements become known.

Any increased coupling requires explicit justification and a new decision when consequential.

### D-019 — Keep Correctness Tests Separate from Performance Benchmarks

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Verification and performance infrastructure
* **Supersedes:** None
* **Superseded by:** None

#### Context

Correctness tests and performance benchmarks answer different questions.

Combining them can create unstable test results and misleading pass-or-fail thresholds.

#### Decision
nd performance benchmarks must use separate targets, procedures, and success criteria.

#### Rationale

Correctness tests should be:

* deterministic;
* repeatable;
* environment-insensitive where practical;
* focused on behavior and invariants.

Benchmarks should:

* measure defined workloads;
* report units and environment;
* tolerate expected measurement variance;
* compare evidence rather than domain correctness.

#### Consequences

* A slow correct test should not fail solely because of an arbitrary timing threshold.
* Benchmark output must not determine functional correctness.
* Benchmark builds may use different optimization flags.
* Performance regressions require documented methodology.
* Benchmark infrastructure should be introduced after correct functional behavior exists.

#### Reconsideration Triggers

Continuous performance monitoring may later be added, but it must remain distinct from functional verification.

### D-020 — Do Not Allow Project Documentation to Override Repository Governance

* **Status:** Accepted
* **Recorded:** July 18, 2026
* **Scope:** Documentation authority and contributor behavior
* **Supersedes:** None
* **Superseded by:** None

#### Context

Hydra-Quant contains governance documents that define contributor and coding-agent behavior.

Shared platform documents must not weaken those controls accidentally.

#### Decision

The following governance files remain authoritative within their defined scope:

* [`../AGENTS.md`](../AGENTS.md);
* [`../CODEX.md`](../CODEX.md);
* [`DEVELOPMENT.md`](DEVELOPMENT.md);
* `../CLAUDE.md` after it is created.

The README, blueprint, architecture, roadmap, decisions, and current-status documents must not override or weaken those files.

#### Rationale

Separating governance from platform description prevents:

* accidental permission expansion;
* weakened review rules;
* inconsistent agent instructions;
* confusion about branch authority;
* undocumented workflow changes.

#### Consequences

* Governance changes must be intentional.
* A platform document may reference governance but not replace it.
* Conflicts must be resolved in favor of the applicable governance document until an intentional update is approved.
* Claude-specific governance remains incomplete until `CLAUDE.md` is created.

#### Reconsideration Triggers

Review this decision if the repository reorganizes governance into a different authoritative structure.

## Open Decision Queue

The following items are unresolved.

They are included here so that they are not silently decided during implementation.

An open item is not an accepted decision.

### O-001 — Automated Test Framework

* **Status:** Under evaluation
* **Needed by:** R1 — Verification and Domain Foundation
* **Question:** Which C++ test framework should Hydra-Quant adopt?
* **Evaluation criteria:**

  * C++20 compatibility;
  * Ubuntu support;
  * build integration;
  * readable tests;
  * failure diagnostics;
  * maintenance burden;
  * dependency footprint;
  * continuous-integration support.

Potential options must be evaluated before approval.

### O-002 — Long-Term Build System

* **Status:** Under evaluation
* **Needed by:** Before the existing Makefile becomes a verified constraint
* **Question:** Should Hydra-Quant continue using GNU Make or migrate to CMake?
* **Current governing decision:** D-014 retains GNU Make for the current foundation.
* **Evaluation criteria:**

  * test-target support;
  * multiple executables or libraries;
  * dependency management;
  * IDE support;
  * sanitizer support;
  * benchmark support;tallation complexity;
  * migration cost.

### O-003 — Third-Party Dependency Policy

* **Status:** Under evaluation
* **Needed by:** R1
* **Question:** Under what conditions may third-party dependencies be introduced?
* **Evaluation criteria:**

  * verified need;
  * standard-library alternatives;
  * licensing;
  * maintenance activity;
  * security;
  * installation reproducibility;
  * compile-time cost;
  * runtime overhead;
  * API stability.

### O-004 — Price Representation

* **Status:** Under evaluation
* **Needed by:** Domain foundation
* **Question:** How should prices be represented internally?
* **Candidate directions:**

  * scaled integer;
  * fixed-point type;
  * floating-point value;
  * instrument-specific tick representation.
* **Evaluation criteria:**

  * exactness;
  * range;
  * overflow behavior;
  * comparison behavior;
  * conversion rules;
  * performance;
  * serialization;
  * testability.

### O-005 — Quantity Representation

* **Status:** Under evaluation
* **Needed by:** Domain foundation
* **Question:** How should order, trade, and position quantities be represented?
* **Evaluation criteria:**

  * signed versus unsigned behavior;
  * fractional quantities;
  * range;
  * overflow;
  * invalid-state prevention;
  * compatibility with accounting.

### O-006 — Timestamp Representation

* **Status:** Under evaluation
* **Needed by:** Domain foundation and deterministic replay
* **Question:** What timestamp type and precision should the platform use?
* **Evaluation criteria:**

  * precision;
  * range;
  * ordering;
  * source conversion;
  * simulation-clock integration;
  * serialization;
  * avoidance of wall-clock coupling.

### O-007 — Instrument Identifier Representation

* **Status:** Under evaluation
* **Needed by:** Domain foundation
* **Question:** How should instruments be identified internally?
* **Evaluation criteria:**

  * validation;
  * storage cost;
  * comparison cost;
  * readability;
  * mapping from external symbols;
  * stable serialization.

### O-008 — Initial Market-Data Format

* **Status:** Under evaluation
* **Needed by:** R2 — Deterministic Data and Replay Slice
* **Question:** Which local input format should be supported first?
* **Current direction:** A simple inspectable local format.
* **Candidate:** CSV.
* **Evaluation criteria:**

  * ease of inspection;
  * deterministic parsing;
  * malformed-input testing;
  * sample-data availability;
  * schema clarity;
  * implementation complexity.

CSV is not approved until this decision is accepted.

### O-009 — Malformed-Record Policy

* **Status:** Under evaluation
* **Needed by:** R2
* **Question:** Should malformed input terminate the run, be skipped, or follow a configurable policy?
* **Evaluation criteria:**

  * reproducibility;
  * diagnostic clarity;
  * partial-run semantics;
  * safety;
  * user expectations;
  * testability.

### O-010 — Event Ordering Policy

* **Status:** Under evaluation
* **Needed by:** R2
* **Question:** How should normalized events be ordered?
* **Must define:**

  * equal timestamps;
  * sequence numbers;
  * multiple instruments;
  * duplicates;
  * out-of-order input;
  * missing sequence values;
  * events earlier than current simulation time.

### O-011 — Simulation Clock Representation

* **Status:** Under evaluation
* **Needed by:** R2
* **Question:** How should deterministic simulation time be represented and advanced?
* **Evaluation criteria:**

  * compatibility with timestamps;
  * reset behavior;
  * test fixtures;
  * event-time semantics;
  * separat time.

### O-012 — Strategy Interface Model

* **Status:** Deferred until R4 design
* **Needed by:** R4 — Strategy, Risk, and Order Lifecycle
* **Question:** How should strategies integrate with the application?
* **Candidate directions:**

  * concrete composition;
  * runtime polymorphism;
  * static polymorphism;
  * type erasure.
* **Evaluation criteria:**

  * testability;
  * runtime flexibility;
  * ownership;
  * compile-time complexity;
  * performance evidence;
  * interface clarity.

### O-013 — Market-State View Representation

* **Status:** Deferred until R4 design
* **Needed by:** R4
* **Question:** How should strategies and risk rules observe market state?
* **Evaluation criteria:**

  * immutability;
  * lifetime safety;
  * copying cost;
  * deterministic snapshots;
  * prevention of direct mutation.

### O-014 — Risk-Decision Representation

* **Status:** Deferred until R4 design
* **Needed by:** R4
* **Question:** How should approval, rejection, invalid requests, and rejection reasons be represented?

### O-015 — Order Identifier Generation

* **Status:** Deferred until R4 design
* **Needed by:** R4
* **Question:** How should stable simulated order identifiers be generated?
* **Evaluation criteria:**

  * determinism;
  * uniqueness within a run;
  * reproducibility;
  * serialization;
  * readability.

### O-016 — Order State Machine

* **Status:** Deferred until R4 design
* **Needed by:** R4
* **Question:** What order states and transitions should be approved?
* **Must define:**

  * pre-acceptance rejection;
  * accepted state;
  * partial fills;
  * fills;
  * cancellation;
  * expiration;
  * terminal states;
  * invalid transitions.

The candidate diagram in [`ARCHITECTURE.md`](ARCHITECTURE.md) is not an accepted decision.

### O-017 — Project-Wide Error-Handling Mechanism

* **Status:** Under evaluation
* **Needed by:** Before major application interfaces stabilize
* **Question:** How should expected failures and exceptional failures be represented?
* **Candidate mechanisms:**

  * exceptions;
  * result types;
  * status objects;
  * optional values;
  * error codes.
* **Evaluation criteria:**

  * domain meaning;
  * exception safety;
  * call-site clarity;
  * performance evidence;
  * interoperability;
  * testability.

### O-018 — Configuration Format

* **Status:** Deferred until configuration implementation
* **Needed by:** Before configurable integrated simulations
* **Question:** Which configuration format and validation method should be used?

### O-019 — Reporting Formats

* **Status:** Deferred until reporting implementation
* **Needed by:** R5
* **Question:** Which human-readable and machine-readable outputs should be supported?

### O-020 — Logging Library and Format

* **Status:** Deferred until logging implementation
* **Needed by:** Before structured logging becomes a milestone requirement
* **Question:** Should Hydra-Quant use a third-party logging library or a minimal project-owned interface?

### O-021 — Benchmark Framework and Methodology

* **Status:** Deferred until R6
* **Needed by:** R6 — Reliability and Measured Performance
* **Question:** How should focused benchmarks be implemented and reported?

### O-022 — Core Concurrency Model

* **Status:** Deferred
* **Needed by:** Only after measured justification
* **Question:** Does the integrated platform require multithreaded core processing?
* **Required evidence before evaluation:**

  * correct integrated simulation;
  * representative workload;
  * measured bottleneck;
  * ownership model;
  * shutdown design;
  * deterministic-test strategy;
  * race-verification strategy.

### O-023 — Specialized Allocation

* **Status:** Deferred
* **Needed by:** Only after allocation profiling
* **Question:** Do arenas, pools, custom allocators, or other specialized techniques provide verified value?
* **Current direction:** Use standard ownership and allocation mechanisms.

### O-024 — Network Market-Data Support

* **Status:** Deferred
* **Needed by:** No current milestone
* **Question:** Should network-based market data be introduced after deterministic local replay is mature?

### O-025 — Graphical or Web Interface

* **Status:** Deferred
* **Needed by:** No current milestone
* **Question:** Would a separate interface provide enough portfolio or usability value to justify its cost?
* **Current governing decision:** D-016 keeps command-line operation as the initial interface.

## Rejected or Currently Excluded Directions

The following directions are not approved for current implementation.

They may be reconsidered only through a new decision record.

### Live trading during the current roadmap

* **Status:** Rejected for current scope
* **Reason:** It introduces unnecessary financial, security, operational, and governance risk.
* **Related decision:** D-009

### One thread per subsystem as a default architecture

* **Status:** Rejected as an assumption
* **Reason:** No measured requirement supports it, and it would weaken deterministic simplicity.
* **Related decision:** D-008

### Lock-free structures before measurement

* **Status:** Rejected as an initial approach
* **Reason:** Complexity is not justified without a measured bottleneck.
* **Related decisions:** D-005, D-008, D-012

### Custom allocators before profiling

* **Status:** Rejected as an initial approach
* **Reason:** Standard allocation and ownership should remain until profiling identifies a problem.
* **Related decisions:** D-005, D-007, D-012

### Graphical interface before core-platform stability

* **Status:** Rejected for initial milestones
* **Reason:** It would displace deterministic engine, testing, and architecture work.
* **Related decision:** D-016

### Broad placeholder subsystem creation

* **Status:** Rejected
* **Reason:** Placeholder breadth does not provide verified functionality.
* **Related decision:** D-013

### Unsupported low-latency claims

* **Status:** Rejected
* **Reason:** Performance claims require reproducible evidence.
* **Related decision:** D-012

## Decision Workflow

### Step 1: Identify the decision need

A decision is required when implementation cannot proceed responsibly without selecting among meaningful alternatives.

The problem should be stated before a preferred solution is chosen.

### Step 2: Gather constraints

Relevant constraints may include:

* blueprint requirements;
* architecture boundaries;
* roadmap milestone;
* current implementation;
* academic workload;
* recruiting value;
* testability;
* ownership;
* determinism;
* performance evidence;
* dependency cost.

### Step 3: Compare alternatives

Alternatives should be compared using project-relevant criteria.

A familiar or fashionable tool is not automatically the best choice.

### Step 4: Create a proposed record

A proposed record should include:

* context;
* candidate decision;
* alternatives;
* rationale;
* consequences;
* reconsideration triggers.

### Step 5: Review

Review should consider:

* consistency with existing accepted decisions;
* implementation cost;
* test strategy;
* ownership;
* failure behavior;
* documentation impact;
* roadmap impact.

Agent analysis may support this review, but agents do not approve decisions.

### Step 6: Accept, reject, defer, or continue evaluation

The record status must reflect the actual result.

No decision should become accepted implicitly through code generation.

### Step 7: Update related documentation

An accepted decision may require updates to:

* [`README.md`](../README.md);
* [`BLUEPRINT.md`](BLUEPRINT.md);
* [`ARCHITECTURE.md`](ARCHITECTURE.md);
* [`ROADMAP.md`](ROADMAP.md);
* [`CURRENT_STATUS.mdnce files when workflow rules change.

### Step 8: Implement and verify

After acceptance:

* implement the decision;
* test the behavior;
* verify documentation;
* update current status;
* keep the decision separate from implementation evidence.

## Decision Review Checklist

Before accepting a technical decision, verify:

### Problem definition

* Is the problem real and current?
* Is the decision required by an active milestone?
* Is the project solving a verified need rather than a hypothetical future problem?

### Alternatives

* Were reasonable alternatives considered?
* Is the standard library sufficient?
* Is a simpler solution available?
* Is postponing the decision valid?

### Correctness

* How does the choice preserve invariants?
* How are failures represented?
* Can partial state changes occur?
* Does the choice introduce undefined behavior risk?

### Ownership

* Who owns new objects or resources?
* Are lifetimes clear?
* Does the decision introduce shared ownership?
* Does it require manual cleanup?

### Determinism

* Does the decision introduce real-time dependence?
* Does it introduce randomness?
* Does ordering become ambiguous?
* Can tests remain reproducible?

### Testing

* How will the decision be verified?
* Are success and failure paths testable?
* Does it require new test infrastructure?
* Can regression tests protect the behavior?

### Performance

* Is the decision performance motivated?
* Is a baseline available?
* Is there representative measurement?
* Does the complexity exceed the measured benefit?

### Dependencies

* Does it add a third-party dependency?
* Is the dependency maintained?
* Is installation reproducible?
* What is the long-term maintenance cost?

### Architecture

* Does the decision preserve subsystem boundaries?
* Does it create a dependency cycle?
* Does infrastructure leak into domain rules?
* Does it expose mutable internal state?

### Roadmap

* Is the decision required now?
* Will it delay a recruiting milestone?
* Will it create an unsustainable workload?
* Can it be deferred safely?

### Documentation

* Which documents must change?
* Is the status represented accurately?
* Does the decision supersede an earlier record?
* Does current status remain factual?

## Decision Maintenance

This register should be updated when:

* a consequential decision is proposed;
* an open decision begins active evaluation;
* a decision is accepted;
* a decision is rejected;
* a decision is deferred;
* an accepted decision is superseded;
* implementation reveals that an accepted decision is no longer appropriate.

Routine implementation progress does not belong in this file.

Implementation progress belongs in [`CURRENT_STATUS.md`](CURRENT_STATUS.md).

Task sequencing belongs in [`ROADMAP.md`](ROADMAP.md).

Component boundaries belong in [`ARCHITECTURE.md`](ARCHITECTURE.md).

Long-term project direction belongs in [`BLUEPRINT.md`](BLUEPRINT.md).

Changes to this decision register must not weaken or override governance established in:

* [`../AGENTS.md`](../AGENTS.md);
* [`../CODEX.md`](../CODEX.md);
* [`DEVELOPMENT.md`](DEVELOPMENT.md);
* `../CLAUDE.md` after that file is created.
