# Hydra-Quant Roadmap — 2026–2028

## Document Purpose

This document defines the planned implementation sequence for Hydra-Quant from 2026 through 2028.

It translates the long-term platform direction into:

* implementation phases;
* milestone objectives;
* required deliverables;
* dependency order;
* completion criteria;
* recruiting deadlines;
* semester-adjusted development expectations;
* scope-control rules;
* decision gates;
* project risks;
* maintenance procedures.

This roadmap describes planned work. It does not claim that future milestones or capabilities are already implemented.

The long-term platform vision is defined in [`BLUEPRINT.md`](BLUEPRINT.md). Technical component boundaries are defined in [`ARCHITECTURE.md`](ARCHITECTURE.md). Confirmed decisions are recorded in [`DECISIONS.md`](DECISIONS.md). Verified implementation progress is recorded in [`CURRENT_STATUS.md`](CURRENT_STATUS.md).

## Roadmap Baseline

* **Initial roadmap baseline:** July 18, 2026
* **Primary development platform:** Ubuntu Linux
* **Primary language:** C++20
* **Fall 2026 semester begins:** August 17, 2026
* **Undergraduate completion target:** Spring 2028
* **Primary recruiting target:** Summer 2027 quantitative-development internship
* **Secondary recruiting target:** Summer 2027 backend-infrastructure internship
* **Project horizon:** 2026 through 2028

Calendar dates in this document are planning targets. They are not implementation claims or contractual deadlines.

Milestones may move when:

* academic workload changes;
* a dependency requires additional study;
* correctness work takes longer than expected;
* recruiting activity requires temporary reprioritization;
* a design decision changes the implementation sequence;
* a milestone is intentionally reduced to preserve quality.

Schedule changes must not silently change the platform vision or misrepresent project status.

## Status Terminology

Hydra-Quant uses two related status systems.

### Capability status

Capability status describes whether functionality exists:

* **Implemented** — present in the trusted repository and verified.
* **Planned** — approved as intended future work but not yet implemented.
* **Proposed** — a candidate direction that has not been approved.
* **Under evaluation** — actively being investigated or compared.
* **Not yet implemented** — absent from the trusted implementation.

### Delivery status

Delivery status describes roadmap execution:

* **Not started** — approved work has not begun.
* **In progress** — active implementation or verification is occurring.
* **Blocked** — work cannot proceed because a required dependency or decision is unresolved.
* **Completed** — the milestone satisfies its documented exit criteria.
* **Deferred** — intentionally postponed without being removed from scope.
* **Removed** — no longer part of the approved roadmap.

A milestone is not completed merely because files, classes, or placeholders exist.

Completion requires verified behavior, tests, documentation, and satisfied exit criteria.

## Current Roadmap Position

Hydra-Quant is currently in the project-foundation and documentation phase.

The trusted implementation remains a minimal C++20 command-line foundation.

Major trading-platform functionality is **Not yet implemented**.

The immediate documentation sequence is:

1. `README.md`
2. `docs/BLUEPRINT.md`
3. `docs/ARCHITECTURE.md`
4. `docs/ROADMAP.md`
5. `docs/DECISIONS.md`
6. `docs/CURRENT_STATUS.md`

After all six shared documents are reviewed, they should be verified together, committed intentionally, and pushed from the trusted `main` worktree.

## Roadmap Principles

### 1. Correctness before feature count

A smaller verified milestone is preferred over several incomplete subsystems.

Work should prioritize:

* valid state;
* deterministic behavior;
* explicit ownership;
* predictable failure handling;
* automated testing;
* understandable interfaces.

### 2. Vertical slices before broad scaffolding

Implementation should favor complete data paths.

For example:

```text
local input
    -> parsed record
    -> validated domain event
    -> deterministic replay
    -> observable result
```

This is preferred over creating disconnected skeletons for ingestion, strategies, risk, orders, execution, and portfolio accounting simultaneously.

### 3. Testing begins with functional development

The project must not postpone testing until the platform becomes large.

The automated test framework should be established before or alongside the first domain and ingestion components.

### 4. Architecture precedes major implementation

Before implementing a major subsystem, the project should establish:

* its responsibility;
* its inputs and outputs;
* its ownership model;
* its failure behavior;
* its deterministic-testing approach;
* its dependency direction.

### 5. Measurement precedes optimization

Performance work should occur only after:

* correct behavior exists;
* automated tests exist;
* a representative workload exists;
* a baseline has been measured.

### 6. Recruiting milestones arrive early

Hydra-Quant must produce presentable work during Fall 2026.

The project must not wait until 2027 or 2028 to become useful for:

* GitHub review;
* résumé discussion;
* LinkedIn updates;
* internship applications;
* technical interviews.

### 7. Academic work takes priority during semesters

Once Fall 2026 classes begin, Hydra-Quant must continue at a reduced pace that does not interfere with coursework.

Schedule reductions are acceptable.

Unverified shortcuts and quality reductions are not.

### 8. Agents assist but do not own decisions

Codex, Claude Code, or other development agents may:

* suggest designs;
* generate candidate implementations;
* review code;
* propose tests;
* identify defects;
* compare approaches.

Agent-generated work must not enter the trusted branch without:

* human review;
* understanding;
* testing;
* architectural consistency;
* explicit approval.

## Milestone Overview

| Milestone                                           | Target window         | Delivery status | Primary outcome                                               |
| --------------------------------------------------- | --------------------- | --------------: | ------------------------------------------------------------- |
| R0 — Project and Documentation Foundation           | July 2026             |     In progress | Trusted project foundation and authoritative documentation    |
| R1 — Verification and Domain Foundation             | Late July–August 2026 |     Not started | Automated testing and initial typed domain values             |
| R2 — Deterministic Data and Replay Slice            | August–October 2026   |     Not started | First recruiting-ready end-to-end deterministic demonstration |
| R3 — Fall 2026 Stabilization and Recruiting Support | October–December 2026 |     Not started | Stable public milestone and interview-ready project narrative |
| R4 — Strategy, Risk, and Order Lifecycle            | January–May 2027      |     Not started | Deterministic strategy-to-approved-order path                 |
| R5 — Execution and Portfolio Integration            | June–December 2027    |     Not started | Complete simulated trading vertical slice                     |
| R6 — Reliability and Measured Performance           | January–June 2028     |     Not started | Mature verification and evidence-based optimization           |
| R7 — Platform Consolidation                         | July–December 2028    |     Not started | Coherent portfolio-grade 2026–2028 platform release           |

Target windows may overlap where documentation, testing, recruiting, and implementation proceed together.

## R0 — Project and Documentation Foundation

### Target window

July 2026

### Delivery status

**In progress**

### Objective

Establish a reliable environment, repository structure, governance model, and authoritative documentation set before major platform implementation begins.

### Existing foundation

The current project foundation includes:

* an Oracle Ubuntu virtual machine;
* SSH access from the Windows host;
* Cursor remote development through SSH;
* a Git repository;
* a production-style source and header structure;
* a GNU Make build;
* C++20 compilation;
* strong compiler-warning flags;
* an initial executable;
* an initial `hydra::CoreEngine` scaffold;
* a trusted `main` worktree;
* an isolated Codex worktree and agent branch;
* repository governance documentation.

### Remaining core deliverables

* complete the six shared project documents;
* verify cross-document consistency;
* verify all relative links;
* check Markdown formatting and whitespace;
* create `CLAUDE.md` during Claude Code setup;
* complete Claude Code installation and worktree configuration;
* review repository status;
* add documentation intentionally;
* create a clear documentation commit;
* push the trusted `main` branch;
* verify that GitHub reflects the approved documentation.

### Exit criteria

R0 is completed when:

* all six shared project documents exist;
* document responsibilities do not overlap incorrectly;
* implemented and planned functionality are clearly distinguished;
* governance documents remain unchanged unless intentionally updated;
* the current project builds successfully;
* the trusted worktree contains no unintended files;
* documentation has been committed intentionally;
* the trusted branch has been pushed successfully;
* the public repository accurately describes the project.

### Deferred from R0

The following do not belong in this milestone:

* trading algorithms;
* market-data ingestion;
* automated execution;
* custom memory pools;
* thread pools;
* lock-free structures;
* network connectivity;
* performance claims.

## R1 — Verification and Domain Foundation

### Target window

Late July through August 2026

### Delivery status

**Not started**

### Objective

Establish automated verification and the first explicit domain representations required for deterministic market-data processing.

### Required decision gates

Before or during this milestone, the project must evaluate and record decisions for:

* test-framework selection;
* continued GNU Make use or future CMake migration;
* third-party dependency policy;
* initial price representation;
* initial quantity representation;
* timestamp representation;
* instrument-identifier representation;
* sanitizer strategy.

A complete migration to a new build system is not required unless the current system prevents the milestone from being completed cleanly.

### Core deliverables

#### Automated testing

* select and integrate an automated C++ test framework;
* provide a documented test command;
* add at least one passing test;
* add at least one failure-path test;
* ensure test code compiles with strong warnings;
* separate test targets from the runtime executable.

#### Domain values

Introduce only the domain values required by the first data-processing slice.

Candidate concepts include:

* instrument identifier;
* price;
* quantity;
* timestamp;
* event type;
* trade side or quote side.

The exact set should remain minimal.

#### Invariant validation

Tests should verify selected invariants such as:

* invalid identifiers are rejected;
* invalid quantities are rejected;
* unsupported values do not enter trusted state;
* comparisons and ordering behave as documented;
* construction does not permit ambiguous invalid states.

#### Build verification

* preserve a reproducible clean build;
* provide separate build and test commands;
* avoid committing generated build artifacts;
* preserve warning-as-error behaviorteria

R1 is completed when:

* automated tests run from a documented command;
* the initial domain types are implemented and tested;
* invalid domain values are handled predictably;
* the runtime build still succeeds;
* tests do not depend on real current time;
* no unsupported performance claims are added;
* relevant decisions are recorded;
* documentation reflects the verified implementation.

### Stretch deliverables

The following may be completed if they do not delay the core milestone:

* AddressSanitizer configuration;
* UndefinedBehaviorSanitizer configuration;
* initial GitHub Actions workflow;
* test coverage tooling;
* generated test fixtures.

These are not required for R1 completion unless later approved as core deliverables.

## R2 — Deterministic Data and Replay Slice

### Target window

August through October 2026

### Delivery status

**Not started**

### Objective

Produce the first recruiting-ready end-to-end deterministic platform demonstration.

### Required data path

```text
supported local source
    -> parsing
    -> validation
    -> normalization
    -> deterministic replay
    -> observable state or event output
```

### Core deliverables

#### Supported local data source

* define one inspectable input format;
* document the supported schema;
* provide a small permitted sample or generated fixture;
* open and read the input predictably;
* report inaccessible input clearly.

CSV is the expected first candidate, subject to a recorded decision.

#### Parsing

* parse required fields;
* preserve record context for diagnostics;
* reject malformed records;
* avoid silent substitutions;
* test valid and invalid records.

#### Validation and normalization

* convert parsed fields into typed domain events;
* reject invalid domain values;
* document timestamp and ordering assumptions;
* prevent malformed records from partially updating downstream state.

#### Deterministic replay

* establish replay initialization;
* establish event ordering;
* establish simulation-time behavior;
* establish end-of-stream behavior;
* support repeatable reset or reconstruction;
* deliver normalized events in reproducible order.

#### Observable result

The first demonstration may produce:

* normalized event output;
* event counts;
* deterministic state snapshots;
* validation summaries;
* replay summaries.

The output must be clear enough for a reviewer to understand what the platform does.

#### Automated verification

Tests should cover:

* valid input;
* malformed input;
* missing fields;
* invalid domain values;
* equal timestamps;
* ordering behavior;
* duplicate or out-of-order input policy;
* deterministic repeated execution;
* end-of-stream behavior.

### Recruiting milestone requirements

By the completion of R2, the repository should provide:

* a clear README entry point;
* documented build instructions;
* documented test instructions;
* one command-line demonstration;
* one deterministic end-to-end path;
* automated unit tests;
* automated integration tests;
* documented architecture;
* documented decisions;
* honest limitations;
* meaningful Git history.

### Exit criteria

R2 is completed when:

* a clean checkout can build the supported executable;
* tests run from documented commands;
* a supported local dataset or fixture can be processed;
* malformed records are handled predictably;
* normalized events are replayed deterministically;
* identical runs produce identical verified results;
* the demonstration does not require manual code changes;
* documentation matches the implementation;
* the milestone can be explained in a technical interview.

### Explicit non-goals

R2 does not require:

* profitable strategy logic;
* a full order book;
* risk management;
* order management;
* execution simulation;
* portfolio accounting;
* concurrency;
* networking;
* measured low-latency claims.

## R3 — Fall 2026 Stabilization and Recruiting Support

### Target window

October through December 2026

### Delivery status

**Not started**

### Objective

Stabilize the first functional milestone and convert it into clear recruiting evidence without allowing recruiting work to destabilize the codebase.

### Engineering deliverables

* resolve defects discovered during R2 demonstrations;
* add regression tests;
* improve error diagnostics;
* simplify unclear interfaces;
* review ownership and lifetime assumptions;
* verify deterministic output;
* strengthen build and test documentation;
* update current limitations;
* evaluate continuous integration;
* evaluate sanitizer-assisted verification;
* prepare the architecture for strategy integration.

### Recruiting deliverables

* update the résumé with accurate project results;
* update LinkedIn when a meaningful milestone is completed;
* maintain a concise project description;
* prepare technical talking points;
* prepare an architecture explanation;
* prepare a deterministic-replay explanation;
* prepare an ownership and memory-safety explanation;
* prepare examples of defects found and corrected;
* maintain consistent GitHub activity;
* continue internship applications.

### Suggested technical narrative

By the end of R3, Angelo should be able to explain:

* why the platform begins with deterministic replay;
* how external input becomes typed domain data;
* how invalid records are handled;
* where state is owned;
* why concurrency was postponed;
* how tests prove repeatability;
* what remains unimplemented;
* what the next vertical slice will add.

### Exit criteria

R3 is completed when:

* the R2 demonstration remains stable;
* important defects have regression tesbuild and test instructions are reproducible;
* repository documentation is current;
* the project has an interview-ready explanation;
* résumé and LinkedIn claims match verified repository evidence;
* future strategy and risk boundaries are documented clearly.

## R4 — Strategy, Risk, and Order Lifecycle

### Target window

January through May 2027

### Delivery status

**Not started**

### Objective

Extend deterministic market replay into a controlled strategy-to-order path.

### Required decision gates

Before implementation is considered complete, the project must decide:

* strategy-interface model;
* market-state view representation;
* order-intent representation;
* risk-decision representation;
* order-identifier generation;
* approved order-state machine;
* invalid-transition behavior;
* project-wide error-handling direction where required.

### Core deliverables

#### Market-state management

* consume normalized market events;
* maintain the state required by the first strategy;
* expose controlled read-only views;
* support deterministic initialization and reset;
* test update rules independently.

#### Strategy interface

* define a narrow strategy contract;
* provide deterministic inputs;
* produce explicit order intents;
* isolate strategy-owned state;
* support strategy reset;
* prevent direct order, execution, or portfolio mutation.

#### Example strategy

Implement one simple deterministic strategy.

Its purpose is to exercise architecture.

It is not intended to prove profitability.

Possible examples include:

* threshold logic;
* moving-average comparison;
* simple momentum logic;
* deterministic test strategy.

The selected strategy must be documented and testable.

#### Risk management

Introduce a small set of explicit pre-trade checks.

Candidate checks include:

* valid price and quantity;
* maximum order quantity;
* maximum resulting position;
* maximum notional exposure;
* sufficient simulated capital;
* strategy-specific limit.

Risk rejection should be represented as a normal domain result.

#### Order lifecycle

* define the approved order states;
* define valid transitions;
* create orders only after required approval;
* track original, remaining, and filled quantity;
* reject invalid transitions;
* expose controlled order snapshots;
* test terminal-state behavior.

### End-to-end path

```text
normalized market event
    -> market-state update
    -> strategy evaluation
    -> order intent
    -> risk decision
    -> approved simulated order or rejection
```

### Exit criteria

R4 is completed when:

* market-state updates are deterministic;
* one strategy produces reproducible intents;
* strategies cannot bypass risk validation;
* risk rules are independently tested;
* rejected intents do not become active orders;
* active orders follow a documented state model;
* invalid state transitions are rejected;
* the complete path has integration tests;
* relevant decisions and documentation are current.

### Explicit non-goals

R4 does not require:

* realistic exchange execution;
* complex strategy libraries;
* machine-learning models;
* multiple strategy scheduling;
* full depth-of-book modeling;
* concurrency;
* live order routing.

## R5 — Execution and Portfolio Integration

### Target window

June through December 2027

### Delivery status

**Not started**

### Objective

Complete the first full deterministic simulated-trading vertical slice.

### Core deliverables

#### Execution simulation

* define one simple execution model;
* process eligible simulated orders;
* inspect a cond market view;
* produce explicit execution outcomes;
* support deterministic behavior;
* update order state through the order-management boundary.

Initial behavior may include:

* documented immediate fills;
* no-fill outcomes;
* deterministic rejection;
* transaction costs.

Partial fills and simulated slippage should be added only when the simpler model is correct and tested.

#### Portfolio accounting

* update positions from validated execution events;
* update simulated cash;
* calculate average entry price;
* calculate realized profit and loss;
* calculate unrealized profit and loss;
* calculate gross and net exposure;
* account for configured transaction costs;
* expose deterministic snapshots.

#### Reporting

Produce a reproducible end-of-run summary containing selected data such as:

* configuration identity;
* records processed;
* order intents;
* risk decisions;
* orders;
* executions;
* final positions;
* final simulated cash;
* realized and unrealized profit and loss;
* error or rejection counts.

#### End-to-end verification

The full path should be tested:

```text
local data
    -> normalized events
    -> replay
    -> market state
    -> strategy
    -> risk
    -> order management
    -> execution simulation
    -> portfolio accounting
    -> final report
```

### Exit criteria

R5 is completed when:

* one complete deterministic simulation runs from input to final report;
* execution outcomes follow documented rules;
* order state agrees with execution records;
* portfolio state agrees with validated executions;
* repeated identical runs produce identical domain results;
* accounting invariants are tested;
* failure and rejection paths are tested;
* reports contain enough information to inspect the run;
* documentation matches verified behavior.

### Internship-dependent cadence

If a Summer 2027 internship is secured, Hydra-Quant development may proceed at a reduced maintenance pace during the internship.

Priority during that period should be:

* preserving project continuity;
* correcting defects;
* maintaining documentation;
* completing small, well-defined tasks;
* applying relevant lessons without exposing employer-confidential information.

The roadmap should not require an unsustainable internship workload.

## R6 — Reliability and Measured Performance

### Target window

January through June 2028

### Delivery status

**Not started**

### Objective

Strengthen verification, observability, reproducibility, and performance evidence after the integrated platform is correct.

### Reliability deliverables

Possible core work includes:

* broader unit-test coverage;
* broader integration-test coverage;
* regression-test review;
* sanitizer-assisted testing;
* continuous integration;
* failure-injection tests;
* deterministic scenario suites;
* configuration validation;
* reproducible result directories;
* stable command-line interfaces;
* structured logging;
* defined metrics.

The exact set should be selected based on verified needs.

### Benchmarking deliverables

* define representative workloads;
* document hardware and software environment;
* establish baseline measurements;
* separate benchmark builds from correctness builds;
* measure focused components;
* record units and sample counts;
* identify actual bottlenecks;
* compare changes against baselines.

Candidate benchmark targets include:

* parsing;
* normalization;
* replay dispatch;
* market-state updates;
* strategy invocation;
* risk validation;
* order-state transitions;
* execution simulation;
* portfolio updates;
* allocati behavior.

### Profiling deliverables

Potential tools and techniques may include:

* compiler optimization reports;
* Linux profiling tools;
* allocation tracking;
* cache-behavior analysis;
* flame graphs;
* sanitizer output;
* static analysis.

Tools must be selected according to actual questions, not added only for appearance.

### Optimization rules

Optimization changes require:

1. a correct baseline;
2. automated tests;
3. a representative workload;
4. a measured bottleneck;
5. a focused change;
6. repeated measurement;
7. recorded tradeoffs.

### Concurrency decision gate

Concurrency may be evaluated only after:

* the single-threaded simulation is correct;
* representative workload measurements exist;
* a specific bottleneck is identified;
* ownership and shutdown rules are documented;
* deterministic testing can be preserved.

Concurrency is not required for R6 completion.

### Exit criteria

R6 is completed when:

* the integrated platform has strong automated verification;
* reliability tooling is documented;
* at least one representative benchmark exists;
* performance results include reproducible context;
* any optimization is supported by before-and-after evidence;
* no performance claim exceeds available evidence;
* concurrency remains absent unless it provides verified value.

## R7 — Platform Consolidation

### Target window

July through December 2028

### Delivery status

**Not started**

### Objective

Consolidate Hydra-Quant into a coherent portfolio-grade platform representing development from 2026 through 2028.

### Core deliverables

* review all implemented subsystem boundaries;
* remove obsolete scaffolding;
* remove dead code;
* simplify unnecessary abstraction;
* consolidate build and test instructions;
* consolidate architecture documentation;
* review decision records;
* review current limitations;
* verify deterministic demonstrations;
* verify benchmark reproducibility;
* polish repository presentation;
* create a stable project release or milestone tag;
* prepare technical interview and portfolio material.

### Selective expansion

Additional functionality may be selected based on:

* educational value;
* architectural value;
* career relevance;
* measured need;
* available time;
* alignment with graduate study.

Potential expansion areas include:

* richer market-state models;
* additional order types;
* more execution models;
* broader risk controls;
* additional strategies;
* more reporting formats;
* improved benchmark suites;
* controlled concurrency experiments.

These are not automatic requirements.

### Exit criteria

R7 is completed when:

* the repository builds from documented instructions;
* the supported tests pass;
* the platform has at least one complete deterministic simulation;
* architecture and implementation are consistent;
* consequential decisions are documented;
* limitations are accurate;
* performance evidence is reproducible where provided;
* the project can be demonstrated and explained clearly;
* the repository reflects intentional multi-year engineering work.

## Recruiting Roadmap

### Summer 2026

### Objective

Establish a professional repository and begin producing visible technical evidence before Fall 2026 recruiting activity.

### Required outcomes

* repository foundation;
* authoritative documentation;
* reproducible build;
* automated-testing foundation;
* initial typed domain work;
* regular meaningful commits;
* accurate GitHub and LinkedIn positioning.

### Early Fall 2026

### Objective

Produce the first recruiting-ready deterministic demotration.

### Target evidence

* local market-data ingestion;
* validation and normalization;
* deterministic replay;
* automated tests;
* clear architecture;
* reproducible commands;
* honest limitations.

### Mid-to-Late Fall 2026

### Objective

Use the verified milestone in applications and interviews.

### Required activity

* update résumé;
* update LinkedIn after meaningful milestones;
* continue GitHub activity;
* apply across relevant internship windows;
* practice algorithms and data structures;
* prepare system-design explanations;
* prepare C++ ownership and lifetime explanations;
* prepare project tradeoff explanations.

### Spring 2027

### Objective

Deepen the project while continuing internship preparation.

### Target evidence

* market-state management;
* strategy interface;
* deterministic example strategy;
* risk checks;
* order lifecycle;
* stronger tests;
* deeper technical interview material.

### Summer 2027

### Objective

Balance internship experience or continued recruiting with sustainable Hydra-Quant development.

Hydra-Quant should not interfere with professional responsibilities or university planning.

## Semester Development Cadence

### Before August 17, 2026

Hydra-Quant may receive concentrated development time.

Recommended priorities:

1. finish the documentation foundation;
2. commit and push the approved documentation;
3. establish automated testing;
4. implement the first minimal domain values;
5. begin the deterministic data slice.

The goal is not to complete the entire platform before classes begin.

The goal is to enter the semester with:

* a stable repository;
* clear documentation;
* a verified build;
* a defined next milestone;
* a sustainable continuation plan.

### During Fall 2026 and Spring 2027

Development should use a reduced and repeatable cadence.

A reasonable target is:

* two or three focused project sessions per week;
* one small, testable objective per session;
* documentation updates alongside implementation;
* milestone reviews at least monthly;
* maintenance-only work during examination periods.

Academic deadlines override roadmap target dates.

### During academic breaks

Breaks may be used for:

* larger integration work;
* milestone completion;
* architecture review;
* documentation consolidation;
* benchmark preparation;
* recruiting updates.

Break periods should not be used to create large amounts of unreviewed code.

### During an internship

Development should be reduced as needed.

Appropriate tasks include:

* small tests;
* documentation;
* defect correction;
* refactoring with existing tests;
* roadmap review;
* public learning notes that contain no confidential material.

## Required Dependency Order

The roadmap follows this dependency sequence:

```text
governance and documentation
    -> reproducible build
    -> automated testing
    -> domain types and invariants
    -> input parsing
    -> validation and normalization
    -> deterministic replay
    -> market-state management
    -> strategy evaluation
    -> risk validation
    -> order lifecycle
    -> execution simulation
    -> portfolio accounting
    -> reporting and observability
    -> benchmarking and profiling
    -> concurrency evaluation
```

### Dependency rules

* automated testing precedes major domain expansion;
* domain types precede trusted normalization;
* normalization precedes deterministic replay;
* replay precedes strategy integration;
* market-state views precede strategy dependence on market state;
* risk validation precedes active order creation;
* order lifecyclrules precede execution integration;
* validated executions precede portfolio accounting;
* correctness precedes performance optimization;
* measurement precedes concurrency.

A later subsystem must not be implemented by bypassing an earlier required boundary.

## Definition of Done

Every functional milestone must satisfy the following unless the milestone explicitly documents an exception.

### Implementation

* required behavior exists in the trusted repository;
* placeholder output is not counted as implementation;
* code compiles with supported warning settings;
* ownership is explicit;
* failure behavior is defined;
* no known undefined behavior is accepted.

### Testing

* important success paths are tested;
* important failure paths are tested;
* corrected defects receive regression tests where practical;
* deterministic tests produce repeatable results;
* tests run from documented commands.

### Documentation

* public status is accurate;
* implemented and planned behavior are separated;
* architecture is updated when boundaries change;
* decisions are recorded when finalized;
* current status reflects verified implementation;
* limitations remain visible.

### Repository quality

* changes are reviewed;
* generated artifacts are excluded;
* secrets are absent;
* commit scope is intentional;
* commit messages explain meaningful changes;
* the trusted branch contains no accidental files.

### Demonstration

* the milestone has a reproducible command or test;
* expected behavior is understandable;
* failure behavior can be demonstrated where relevant;
* results do not rely on manual source edits.

A milestone should not be marked completed until these conditions are satisfied.

## Decision Gates

Major decisions should occur as close as practical to the work that requires them.

### Gate A — Verification foundation

Required before R1 completion:

* test framework;
* test command;
* dependency policy;
* build-system direction sufficient for current needs.

### Gate B — Domain representation

Required before trusted normalization:

* price representation;
* quantity representation;
* timestamp representation;
* instrument identifiers;
* validation rules.

### Gate C — Replay semantics

Required before R2 completion:

* ordering rules;
* equal-timestamp behavior;
* out-of-order-input policy;
* malformed-record policy;
* simulation-clock behavior;
* reset behavior.

### Gate D — Strategy and risk contracts

Required before R4 completion:

* market-state view;
* strategy interface;
* order-intent type;
* risk-decision type;
* risk-rejection behavior.

### Gate E — Order lifecycle

Required before execution integration:

* order identifier;
* approved state machine;
* valid transitions;
* terminal states;
* partial-fill rules;
* cancellation rules.

### Gate F — Execution and accounting

Required before R5 completion:

* execution model;
* execution-event representation;
* transaction-cost rules;
* position accounting;
* realized and unrealized profit-and-loss rules.

### Gate G — Performance work

Required before optimization:

* benchmark workload;
* measurement environment;
* baseline result;
* selected profiling method;
* acceptable comparison procedure.

### Gate H — Concurrency

Required before multithreaded core processing:

* measured bottleneck;
* ownership model;
* queue and backpressure model;
* shutdown model;
* race-verification approach;
* deterministic-test strategy;
* demonstrated performance benefit.

## Scope Control

### Core scope through the first recruiting milestone

The first rene should contain:

* C++20 domain values;
* local input;
* parsing;
* validation;
* normalization;
* deterministic replay;
* automated tests;
* command-line demonstration;
* documentation.

Anything beyond this should not delay completion of the core slice.

### Core scope through the first complete simulation

The first complete simulation should contain:

* deterministic replay;
* controlled market state;
* one deterministic strategy;
* pre-trade risk;
* simulated order lifecycle;
* one simple execution model;
* portfolio accounting;
* reproducible reporting;
* automated tests.

### Deferred or optional areas

The following are **Deferred**, **Proposed**, or **Under evaluation** unless later approved:

* full depth-of-book modeling;
* advanced order types;
* exchange-specific protocols;
* brokerage connectivity;
* live trading;
* graphical interfaces;
* web applications;
* distributed services;
* databases;
* message brokers;
* custom allocators;
* memory pools;
* thread pools;
* lock-free queues;
* CPU pinning;
* machine-learning strategies;
* strategy profitability research;
* cloud deployment;
* multi-user support.

These areas must not displace required correctness, testing, documentation, or recruiting milestones.

## Project Risks

### Risk 1 — Excessive scope

**Description:** Too many subsystems are started before the first vertical slice is complete.

**Mitigation:**

* implement one milestone at a time;
* enforce exit criteria;
* defer optional work;
* avoid speculative APIs;
* review the active milestone monthly.

### Risk 2 — Academic overload

**Description:** Project work competes with Fall 2026 or later coursework.

**Mitigation:**

* reduce project cadence during semesters;
* use small tasks;
* pause major integration during examinations;
* preserve continuity through notes and current-status updates;
* move target dates rather than lowering quality.

### Risk 3 — Premature optimization

**Description:** Low-latency techniques are introduced without measured need.

**Mitigation:**

* require correct baselines;
* require benchmarks;
* keep specialized techniques under evaluation;
* reject unsupported performance claims.

### Risk 4 — Documentation drift

**Description:** Documentation describes behavior that the repository no longer implements.

**Mitigation:**

* update documentation in the same change as implementation;
* review status labels;
* maintain `CURRENT_STATUS.md`;
* record decisions;
* include documentation in milestone completion criteria.

### Risk 5 — Agent-generated complexity

**Description:** Generated code is accepted without full understanding.

**Mitigation:**

* isolate agent work in worktrees;
* require review and explanation;
* compare alternatives;
* add tests;
* integrate only approved changes;
* avoid agent-authored architecture decisions without human approval.

### Risk 6 — Weak tests

**Description:** Tests verify only successful examples or depend on nondeterministic behavior.

**Mitigation:**

* test failure paths;
* test invariants;
* use controlled clocks and data;
* add regression tests;
* separate performance tests from correctness tests.

### Risk 7 — Dependency growth

**Description:** Third-party libraries increase build and maintenance complexity.

**Mitigation:**

* document dependency purpose;
* prefer the standard library where sufficient;
* add dependencies only for verified value;
* record consequential dependency decisions;
* preserve reproducible installation instructions.

### Risk 8 — Recruiting delay

**Description:** The project remainsng Fall 2026 applications.

**Mitigation:**

* prioritize R2 over advanced architecture;
* publish complete small milestones;
* maintain résumé and LinkedIn updates;
* prepare technical explanations early;
* avoid waiting for the full platform.

### Risk 9 — Repository inconsistency

**Description:** Trusted and agent worktrees diverge or unintended files enter `main`.

**Mitigation:**

* verify branch and path before changes;
* inspect `git status`;
* review diffs;
* use intentional commits;
* merge only reviewed agent work;
* keep the trusted branch authoritative.

## Roadmap Review Procedure

The roadmap should be reviewed:

* when a milestone is completed;
* when a milestone becomes blocked;
* when a target window changes materially;
* before each academic semester;
* after major recruiting milestones;
* before introducing a major dependency;
* before introducing concurrency;
* before beginning measured optimization.

A roadmap review should answer:

1. What was completed and verified?
2. What remains incomplete?
3. What is blocked?
4. Did architecture change?
5. Were new decisions recorded?
6. Does the current milestone remain the highest-value work?
7. Does the workload remain sustainable?
8. Does recruiting require reprioritization?
9. Are optional features displacing required work?
10. Does documentation still match the repository?

## Roadmap Update Rules

Update this document when:

* milestone sequencing changes;
* milestone scope changes;
* target windows change materially;
* a milestone is deferred or removed;
* a new major milestone is approved;
* recruiting priorities alter implementation order;
* academic constraints materially change project cadence.

Do not update this roadmap merely because a small task was completed.

Small implementation updates belong in [`CURRENT_STATUS.md`](CURRENT_STATUS.md).

Confirmed technical choices belong in [`DECISIONS.md`](DECISIONS.md).

Technical boundary changes belong in [`ARCHITECTURE.md`](ARCHITECTURE.md).

Long-term project-direction changes belong in [`BLUEPRINT.md`](BLUEPRINT.md).

## Immediate Next Actions

After the shared documentation set is approved:

1. verify all six shared documents;
2. verify cross-document links;
3. inspect `git status`;
4. inspect documentation diffs;
5. build the current project;
6. add the approved documentation;
7. create an intentional documentation commit;
8. push the trusted `main` branch;
9. verify the GitHub repository;
10. complete Claude Code installation and authentication;
11. create and verify the Claude worktree and branch;
12. create and review `CLAUDE.md`;
13. confirm all R0 exit criteria;
14. begin R1 planning.

The project should not begin broad subsystem implementation until the documentation foundation is complete and committed.

## Roadmap Maintenance

This roadmap must remain practical rather than aspirational.

A milestone may be reduced when necessary, but its status and scope must remain accurate.

Changes to this roadmap must not weaken or override governance established in:

* [`../AGENTS.md`](../AGENTS.md);
* [`../CODEX.md`](../CODEX.md);
* [`DEVELOPMENT.md`](DEVELOPMENT.md);
* `../CLAUDE.md` after that file is created.
