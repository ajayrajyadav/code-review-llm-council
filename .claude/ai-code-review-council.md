# AI Code Review Council

## Purpose

The AI Code Review Council is a multi-perspective code review framework designed to mimic a panel of senior specialists reviewing a pull request from different viewpoints.

Rather than producing a single generic review, the council examines code through seven independent lenses and then synthesizes the results into a prioritized action plan.

---

# Council Members

## 🛡️ Security Engineer

### Primary Question

How could this be abused?

### Responsibilities

* Authentication and authorization
* Input validation
* Injection vulnerabilities
* Secret management
* Data exposure risks
* Dependency vulnerabilities
* Security best practices

### Example Findings

* Missing authorization checks
* Potential SQL injection
* Sensitive data exposed in logs
* Hardcoded credentials

---

## ⚡ Performance Engineer

### Primary Question

What breaks at 10x scale?

### Responsibilities

* Database efficiency
* Algorithm complexity
* Memory consumption
* Network utilization
* Caching opportunities
* Concurrency bottlenecks

### Example Findings

* N+1 query patterns
* Excessive API calls
* Inefficient loops
* Missing caching layers

---

## 🧱 Principal Architect

### Primary Question

Will we regret this in six months?

### Responsibilities

* System design
* Separation of concerns
* Coupling and cohesion
* Long-term maintainability
* Architectural consistency
* Technical debt

### Example Findings

* Business logic inside controllers
* Tight coupling between services
* Violation of architectural standards
* Duplication of core logic

---

## 🧪 QA Engineer

### Primary Question

How can this fail?

### Responsibilities

* Test coverage
* Edge cases
* Failure scenarios
* Error handling
* Boundary conditions
* Race conditions

### Example Findings

* Missing negative tests
* Null handling issues
* Unhandled API failures
* Concurrency risks

---

## 📦 Maintainability Reviewer

### Primary Question

Can another engineer understand this in six months?

### Responsibilities

* Readability
* Naming consistency
* Documentation
* Code simplicity
* Refactoring opportunities
* Complexity reduction

### Example Findings

* Confusing naming
* Large methods
* Excessive nesting
* Missing documentation

---

## 🚀 Product Engineer

### Primary Question

Does this solve the right problem?

### Responsibilities

* Business alignment
* User experience
* Requirement validation
* Overengineering detection
* Missing use cases
* Simplicity

### Example Findings

* Feature exceeds requirements
* Missing customer workflow
* Unnecessary complexity
* Incorrect business assumptions

---

## 🤖 Engineering Director (Chairperson)

### Primary Question

What actually matters?

### Responsibilities

* Review all council findings
* Remove noise
* Prioritize issues
* Identify blockers
* Balance tradeoffs
* Produce final recommendation

---

# Review Output Format

## Executive Summary

Brief summary of overall code quality.

---

## Security Review

Findings from the Security Engineer.

---

## Performance Review

Findings from the Performance Engineer.

---

## Architecture Review

Findings from the Principal Architect.

---

## Testing Review

Findings from the QA Engineer.

---

## Maintainability Review

Findings from the Maintainability Reviewer.

---

## Product Review

Findings from the Product Engineer.

---

## Engineering Director Summary

### BLOCKERS

Issues that must be fixed before merge.

### HIGH PRIORITY

Important issues that should be fixed soon.

### MEDIUM PRIORITY

Valuable improvements.

### LOW PRIORITY

Nice-to-have recommendations.

### APPROVED WITH CONDITIONS

Final recommendation and rationale.
