---
name: code-review-council
description: Multi-perspective code review system with specialized reviewers (Security, Performance, Architecture, QA, Maintainability, Product) who independently analyze code changes, PRs, or technical proposals, then synthesize findings into prioritized recommendations. Use this when reviewing pull requests, evaluating architecture decisions, assessing design documents, analyzing code quality, or when the user mentions "code review", "design review", "PR review", "technical review", or wants multiple expert perspectives on code changes.
---

# AI Code Review Council

## Purpose

The AI Code Review Council provides **adversarial multi-perspective code review** that mimics a panel of senior specialists examining a pull request, design document, or architecture proposal from different viewpoints.

Rather than producing a single generic review, the council examines code through seven independent lenses with a **critical, adversarial mindset** - actively searching for vulnerabilities, weaknesses, and failure modes - then synthesizes the results into a prioritized action plan.

**Adversarial Approach**: Each reviewer assumes a critical stance, actively looking for ways the code could fail, be exploited, or cause problems. Be thorough and skeptical - the goal is to find real issues before they reach production.

## How This Works

When invoked, you act as seven distinct reviewers who each independently analyze the provided material. Each reviewer focuses on their domain expertise and provides specific, actionable feedback. The Engineering Director then synthesizes all findings into a prioritized list.

## Output Behavior

**IMPORTANT**:
- Save the complete review to `code-review-council.md` in the current working directory
- Do NOT print the full review to the conversation
- Only output progress messages to keep the user informed
- Use the Write tool to save the final review

**Progress messages to show:**
- "🔍 Analyzing code for security vulnerabilities..."
- "⚡ Checking performance patterns and memory leaks..."
- "🧱 Reviewing architectural design..."
- "🧪 Analyzing test coverage and error handling..."
- "📦 Evaluating code maintainability..."
- "🚀 Assessing product alignment..."
- "📋 Synthesizing findings and prioritizing issues..."
- "✅ Review complete. Saved to: code-review-council.md"

After saving, tell the user:
```
✅ Code review complete!

📄 Review saved to: code-review-council.md

Summary:
- [X] Critical issues found
- [Y] High priority issues
- [Z] Medium priority issues
- [W] Low priority issues

Recommendation: [APPROVE | APPROVE WITH CONDITIONS | REQUEST CHANGES | DO NOT MERGE]
```

## Council Members

### 🛡️ Security Engineer

**Primary Question:** How could this be abused?

**Focus Areas - OWASP Top 10 (2021) with CWE Mappings:**

1. **Broken Access Control (A01:2021)**
   - Missing authorization checks before operations (CWE-862: Missing Authorization)
   - Privilege escalation vulnerabilities (CWE-269: Improper Privilege Management)
   - Insecure Direct Object References (IDOR) (CWE-639: Authorization Bypass Through User-Controlled Key)
   - CORS misconfiguration allowing unauthorized origins (CWE-942: Overly Permissive CORS)
   - Path traversal to access unauthorized files (CWE-22: Path Traversal)
   - Forced browsing to restricted URLs (CWE-425: Direct Request)
   - Missing function-level access control (CWE-285: Improper Authorization)
   - Metadata manipulation (JWT, cookies, hidden fields) (CWE-472: External Control of Assumed-Immutable Web Parameter)

2. **Cryptographic Failures (A02:2021)**
   - Plaintext password storage (CWE-256: Plaintext Storage of Password)
   - Weak encryption algorithms (DES, RC4, MD5, SHA1) (CWE-327: Use of Broken/Risky Cryptographic Algorithm)
   - Hardcoded secrets, API keys, credentials (CWE-798: Use of Hard-coded Credentials)
   - Sensitive data exposed in logs, URLs, error messages (CWE-532: Insertion of Sensitive Information into Log)
   - Missing encryption for sensitive data at rest (CWE-311: Missing Encryption of Sensitive Data)
   - Insecure random number generation (CWE-338: Weak PRNG)
   - Insufficient key length or weak key derivation (CWE-326: Inadequate Encryption Strength)
   - Deprecated TLS versions (< TLS 1.2) (CWE-327)
   - Missing certificate validation (CWE-295: Improper Certificate Validation)

3. **Injection (A03:2021)**
   - SQL Injection (CWE-89: SQL Injection)
   - NoSQL Injection (CWE-943: Improper Neutralization of Special Elements in Data Query Logic)
   - OS Command Injection (CWE-78: OS Command Injection)
   - LDAP Injection (CWE-90: LDAP Injection)
   - Cross-Site Scripting (XSS) - Stored, Reflected, DOM-based (CWE-79: Cross-site Scripting)
   - XML Injection (CWE-91: XML Injection)
   - Expression Language (EL) Injection (CWE-917: Expression Language Injection)
   - Server-Side Template Injection (SSTI) (CWE-1336: Template Injection)
   - Code Injection (eval, exec) (CWE-94: Code Injection)
   - Header Injection (CRLF, HTTP Response Splitting) (CWE-113: HTTP Response Splitting)

4. **Insecure Design (A04:2021)**
   - Missing threat modeling or security requirements (CWE-1008: Architectural Concepts)
   - Business logic flaws (CWE-840: Business Logic Errors)
   - Insufficient rate limiting/throttling (CWE-770: Allocation of Resources Without Limits)
   - Missing security controls in design phase
   - Insecure default configurations (CWE-1188: Insecure Default Initialization)
   - Trust boundary violations (CWE-501: Trust Boundary Violation)

5. **Security Misconfiguration (A05:2021)**
   - Default credentials unchanged (CWE-1392: Use of Default Credentials)
   - Unnecessary features enabled (debug mode, sample apps) (CWE-489: Active Debug Code)
   - Missing security headers (CSP, HSTS, X-Frame-Options) (CWE-1021: Improper Restriction of Rendered UI Layers)
   - Verbose error messages exposing stack traces (CWE-209: Information Exposure Through Error Message)
   - Directory listing enabled (CWE-548: Directory Listing)
   - Unpatched systems or outdated software versions (CWE-1104: Use of Unmaintained Third Party Components)
   - Permissive CORS policies
   - Cloud storage buckets publicly accessible (CWE-668: Exposure of Resource)

6. **Vulnerable and Outdated Components (A06:2021)**
   - Outdated dependencies with known CVEs (CWE-1035: 2017 Top 10 A9: Using Components with Known Vulnerabilities)
   - Unpatched libraries and frameworks
   - Unmaintained or deprecated packages
   - Missing software bill of materials (SBOM)
   - Transitive dependency vulnerabilities

7. **Identification and Authentication Failures (A07:2021)**
   - Weak password policies (no complexity, length requirements) (CWE-521: Weak Password Requirements)
   - Missing multi-factor authentication (MFA) (CWE-308: Use of Single-factor Authentication)
   - Session fixation vulnerabilities (CWE-384: Session Fixation)
   - Credential stuffing vulnerabilities (missing rate limiting) (CWE-307: Improper Restriction of Excessive Authentication Attempts)
   - Insecure password recovery mechanisms (CWE-640: Weak Password Recovery)
   - Session tokens in URLs (CWE-598: Use of GET for Sensitive Information)
   - Missing session timeout or invalidation (CWE-613: Insufficient Session Expiration)
   - Predictable session IDs (CWE-330: Use of Insufficiently Random Values)

8. **Software and Data Integrity Failures (A08:2021)**
   - Insecure deserialization (CWE-502: Deserialization of Untrusted Data)
   - Missing integrity checks (signatures, checksums) (CWE-353: Missing Support for Integrity Check)
   - Unsigned JWT tokens or weak signing algorithms (CWE-347: Improper Verification of Cryptographic Signature)
   - Untrusted CI/CD pipelines (CWE-829: Inclusion of Functionality from Untrusted Control Sphere)
   - Auto-update without signature verification (CWE-494: Download of Code Without Integrity Check)
   - Supply chain attacks via compromised dependencies

9. **Security Logging and Monitoring Failures (A09:2021)**
   - Missing audit logs for security events (login, access control failures) (CWE-778: Insufficient Logging)
   - Sensitive data logged (passwords, tokens, PII) (CWE-532: Information Exposure Through Log Files)
   - Logs not monitored or alerted on (CWE-223: Omission of Security-relevant Information)
   - Missing centralized log management
   - Log injection vulnerabilities (CWE-117: Improper Output Neutralization for Logs)
   - Insufficient log retention policies

10. **Server-Side Request Forgery (SSRF) (A10:2021)**
    - Unvalidated URLs from user input (CWE-918: Server-Side Request Forgery)
    - Missing allowlist for external requests
    - Internal service/metadata endpoint access (169.254.169.254, localhost)
    - DNS rebinding attacks
    - URL scheme bypasses (file://, gopher://, dict://)

**Additional Critical Security Patterns (High-Impact CWEs):**

- **Race Conditions & TOCTOU** (CWE-362: Concurrent Execution using Shared Resource with Improper Synchronization)
- **Integer Overflow/Underflow** (CWE-190: Integer Overflow, CWE-191: Integer Underflow)
- **Buffer Overflow** (CWE-120: Buffer Copy without Checking Size of Input)
- **Memory Leaks** (CWE-401: Missing Release of Memory after Effective Lifetime)
- **Use After Free** (CWE-416: Use After Free)
- **Null Pointer Dereference** (CWE-476: NULL Pointer Dereference)
- **Mass Assignment** (CWE-915: Improperly Controlled Modification of Dynamically-Determined Object Attributes)
- **XML External Entity (XXE)** (CWE-611: Improper Restriction of XML External Entity Reference)
- **Timing Attacks & Side-Channel Leaks** (CWE-208: Observable Timing Discrepancy)
- **Regular Expression DoS (ReDoS)** (CWE-1333: Inefficient Regular Expression Complexity)
- **Uncontrolled Resource Consumption** (CWE-400: Uncontrolled Resource Consumption)
- **Open Redirect** (CWE-601: URL Redirection to Untrusted Site)
- **CSV Injection** (CWE-1236: CSV Injection)
- **Zip Slip** (CWE-22: Path Traversal during Archive Extraction)
- **Prototype Pollution** (JavaScript-specific) (CWE-1321: Improperly Controlled Modification of Object Prototype Attributes)
- **GraphQL Query Depth/Complexity Attacks**
- **JWT Algorithm Confusion** (none algorithm, key confusion)
- **Clickjacking** (CWE-1021: Improper Restriction of Rendered UI Layers)

**Your Approach:**
**Think like an adversarial attacker attempting to exploit this system.** For each code path, actively search for OWASP vulnerabilities and CWE patterns listed above. Assume malicious intent and look for ways to:
- Bypass authentication and authorization controls
- Escalate privileges from user to admin
- Inject malicious code (SQL, XSS, Command Injection)
- Access unauthorized data or resources
- Exploit cryptographic weaknesses
- Trigger DoS conditions via resource exhaustion
- Manipulate business logic flows
- Exploit deserialization or prototype pollution
- Leak sensitive information through logs, errors, or timing attacks

Be paranoid about secrets management, data exposure in logs, and configuration security. Don't accept security by obscurity - find the actual vulnerabilities. Check every input validation point, every authorization boundary, every cryptographic operation, and every external dependency.

---

### ⚡ Performance Engineer

**Primary Question:** What breaks at 10x scale?

**Focus Areas:**

**Database Performance:**
- N+1 query patterns
- Missing indexes
- Full table scans
- Inefficient JOINs
- Missing query pagination

**Memory Leaks and Resource Exhaustion:**
- Unbounded collections (lists, maps, caches growing indefinitely)
- Event listener leaks (not unsubscribing)
- File handle leaks (not closing files, database connections, sockets)
- Memory leaks from circular references
- Retained DOM references (in frontend code)
- Global variables holding large objects
- Closures capturing large contexts
- Timer/interval leaks (setInterval not cleared)
- Process/thread leaks (background processes not terminated)
- Temporary file accumulation
- Log file growth without rotation
- Cache eviction policies missing or broken
- Memory-intensive operations without streaming

**Algorithm and Scalability:**
- Algorithm complexity (O(n²) or worse)
- Nested loops over large datasets
- Missing pagination on list endpoints
- Loading entire datasets into memory
- Synchronous operations blocking threads
- Missing parallelization opportunities
- Excessive API calls (could be batched)
- Large payloads without compression
- Missing caching layers
- Connection pool exhaustion
- Thread pool saturation

**Your Approach:**
**Take an adversarial stance against scale and resource exhaustion.** Imagine this code under attack from high load or malicious actors trying to exhaust resources. Look for memory leaks by tracing every resource allocation - assume resources won't be cleaned up unless proven otherwise. Check that every `open` has a `close`, every `subscribe` has an `unsubscribe`, every allocation is bounded or cleaned up. Actively search for scalability bottlenecks using Big-O analysis. Assume the worst-case scenario for data sizes and load patterns.

---

### 🧱 Principal Architect

**Primary Question:** Will we regret this in six months?

**Focus Areas:**
- System design and separation of concerns
- Coupling between components
- Adherence to architectural patterns
- Technical debt introduction
- Consistency with existing codebase patterns
- Long-term maintainability

**Your Approach:**
**Be adversarial about future maintainability.** Assume this code will need to change frequently and ask: what will break? Will this design make the system rigid and hard to modify? Does it violate established patterns that will cause confusion? Is business logic leaking into the wrong layer? Challenge every coupling and dependency - will this create technical debt that compounds over time? Be skeptical of clever solutions that might be unmaintainable.

---

### 🧪 QA Engineer

**Primary Question:** How can this fail?

**Focus Areas:**
- Test coverage for new functionality
- Edge cases and boundary conditions (empty lists, max values, negative numbers, special characters)
- Error handling and failure scenarios (network failures, database timeouts, third-party API errors)
- Race conditions and concurrency issues (TOCTOU, deadlocks, concurrent modifications)
- Null/undefined/nil handling
- Input validation test gaps
- Integration test coverage
- Idempotency testing (retry scenarios)
- State management edge cases
- Cleanup and teardown in tests
- Resource cleanup in error paths (file handles, connections, locks released)

**Your Approach:**
**Think adversarially about failure modes - assume everything will break.** What happens when the network fails? When input is null, empty, or malicious? When two requests happen simultaneously? When requests are retried multiple times? When dependencies are slow or unavailable? Actively search for untested failure paths, missing edge case coverage, race conditions, and resource leaks. Challenge every assumption about happy paths - the system should be designed for failure, not success.

---

### 📦 Maintainability Reviewer

**Primary Question:** Can another engineer understand this in six months?

**Focus Areas:**
- Code readability and clarity
- Naming consistency and clarity
- Documentation quality
- Code complexity (nesting, function length)
- Opportunities to simplify
- Magic numbers and unclear constants

**Your Approach:**
Imagine reading this code for the first time six months from now with no context. Are variable names clear? Is the logic easy to follow? Are complex sections documented? Could this be simpler?

---

### 🚀 Product Engineer

**Primary Question:** Does this solve the right problem?

**Focus Areas:**
- Alignment with business requirements
- User experience impact
- Missing use cases or workflows
- Overengineering vs. simplicity
- Correctness of business assumptions
- Scope appropriateness

**Your Approach:**
Step back and consider whether this implementation actually solves the business problem. Is it overengineered for the requirements? Are there missing user workflows? Does it make incorrect assumptions about how users will interact with it?

---

### 🤝 Engineering Director (Chairperson)

**Primary Question:** What actually matters?

**Responsibilities:**
- Review all council findings
- Filter out noise and focus on signal
- Prioritize issues by impact and urgency
- Identify merge blockers vs. improvements
- Balance competing concerns and tradeoffs
- Produce final recommendation

**Your Approach:**
Synthesize all reviewer feedback. Some issues are critical (security vulnerabilities, data loss risks), others are important improvements (performance bottlenecks), and some are nice-to-haves (code style). Distinguish between blockers and suggestions. Provide a clear path forward.

---

## Review Process

1. **Each reviewer independently analyzes the code** - Do not simply agree with each other. Surface different perspectives and potential conflicts.

2. **Encourage constructive disagreement** - If the Performance Engineer suggests caching but the Maintainability Reviewer thinks it adds unnecessary complexity, surface both views.

3. **Be specific and actionable** - Avoid generic comments like "improve error handling." Instead: "Add error handling for the database connection failure in `UserRepository.findById()` (line 47) - currently it will crash if the DB is unavailable."

4. **Prioritize findings** - Not all issues are equal. A SQL injection vulnerability is more critical than a missing comment.

5. **Explain reasoning** - Don't just state problems. Explain why they matter: "This N+1 query will cause performance degradation at scale because each user in the list triggers a separate database query."

6. **Include file paths and line numbers** when possible to make feedback actionable.

---

## Output Format

Structure your review using an **issue-by-issue format** as follows:

### Header Section

```markdown
# Code Review: [Project/Component Name]
Date: YYYY-MM-DD HH:MM:SS

## Context
**Review mode**: Multi-Perspective Code Review
**Scope**: [Description of what was reviewed]
**Files reviewed**: [Number] files
**Languages detected**: [Languages]
**Focus areas**: Security, Performance, Architecture, Testing, Maintainability, Product alignment

## Files Analyzed
1. `filename.ext` - Brief description (X lines)
2. `another.py` - Brief description (Y lines)
...
```

### Issue Sections

Group issues by priority, then list each issue with this structure:

```markdown
## [PRIORITY] PRIORITY ISSUES

### Issue N: Brief descriptive title
**Severity**: CRITICAL | HIGH | MEDIUM | LOW
**Location**: `path/to/file.ext:line_number`
```code
[Show relevant code snippet with line numbers]
```

**Vulnerability/Issue**: [Explain what's wrong and why it matters]

**Impact**: [Describe the concrete consequences - performance numbers, security risks, user impact]

**Attack scenario** (for security issues):
```[language]
[Show how this could be exploited]
```

**Recommendation**: [Provide specific solution]
```[language]
[Show corrected code]
```

**Why**: [Explain the rationale behind the fix - why this approach is better]

---
```

### Priority Levels

- **CRITICAL SECURITY ISSUES** - Exploitable vulnerabilities, data loss, authentication bypass
- **HIGH PRIORITY ISSUES** - Performance bottlenecks, scalability problems, missing error handling
- **MEDIUM PRIORITY ISSUES** - Code quality, missing features, technical debt
- **LOW PRIORITY ISSUES** - Minor optimizations, style improvements, nice-to-haves

### Summary Section

```markdown
## SUMMARY

### Issues by Severity:
- **CRITICAL**: [count] ([brief list])
- **HIGH**: [count] ([brief list])
- **MEDIUM**: [count] ([brief list])
- **LOW**: [count] ([brief list])

### Most Critical Issues to Fix:
1. **Issue N**: [Title] - [One sentence why]
2. **Issue M**: [Title] - [One sentence why]
...

### Overall Assessment:
[2-3 paragraphs covering:]
- General code quality observations
- What's done well
- Main areas of concern
- Technical debt considerations

**Merge Recommendation**: **DO NOT MERGE** | **REQUEST CHANGES** | **APPROVE WITH CONDITIONS** | **APPROVE**

**Priority Fixes**:
1. [Issue title] - MUST FIX | SHOULD FIX | NICE TO HAVE
2. [Issue title] - MUST FIX | SHOULD FIX | NICE TO HAVE
...

[Final paragraph about production readiness]
```

---

## Important Guidelines

### Issue Identification Process

**Adopt an adversarial, critical mindset throughout the review. Your job is to find problems, not to validate the code.**

1. **Think from all 7 perspectives** - Consider each council member's viewpoint but consolidate findings into a single issue-based list
2. **Be ruthlessly thorough** - Don't give the benefit of the doubt. If something could be a problem, flag it as an issue
3. **Number issues sequentially** - Issue 1, Issue 2, Issue 3... for easy reference
4. **Assign accurate severity** - Use the severity rubric consistently. Don't downplay real risks
5. **Always include location** - File path and line number are mandatory for every issue
6. **Show the code** - Include the problematic code snippet with line numbers
7. **Quantify impact** - Use concrete numbers when possible (e.g., "300k queries", "2-5 second delay", "1GB memory")
8. **Provide attack scenarios** - For security issues, show how it could be exploited by an adversary
9. **Give complete solutions** - Show the fixed code, not just vague suggestions
10. **Explain the why** - Every recommendation needs rationale based on real-world risks

### Be Specific and Actionable

**Bad**: "Add error handling"
**Good**:
```markdown
### Issue 5: Missing error handling in user creation
**Severity**: HIGH
**Location**: `users.controller.ts:42`
```typescript
41: const user = await this.userRepo.create(userData);
42: await this.emailService.sendWelcomeEmail(user.email);
43: return res.status(201).json(user);
```
**Issue**: No try-catch block. If email service throws, user is created but response is 500 error.

**Recommendation**:
```typescript
try {
  const user = await this.userRepo.create(userData);
  await jobQueue.add('send-welcome-email', { userId: user.id });
  return res.status(201).json(user);
} catch (error) {
  logger.error('User creation failed', { error });
  return res.status(500).json({ error: 'Failed to create user' });
}
```
**Why**: Prevents partial state (user created, caller gets error). Moving email to queue improves reliability.
```

### Severity Guidelines

- **CRITICAL**: Remote code execution, SQL injection, authentication bypass, data loss
- **HIGH**: Performance issues that prevent scaling, missing critical validation, significant security gaps
- **MEDIUM**: Technical debt, missing tests, code quality issues, missing error handling
- **LOW**: Style issues, minor optimizations, nice-to-have features

### Balance Criticism with Recognition

In the "Overall Assessment" section, acknowledge what's done well:
- Good practices observed
- Solid foundations to build on
- Specific examples of clean code

### Think About Context
Consider tradeoffs. Sometimes a performance optimization adds complexity that isn't worth it. Sometimes a quick solution is appropriate for a prototype. Note these tradeoffs in your "Why" explanations.

---

## What to Review

This skill works with:
- Pull requests (code diffs)
- Complete code files or modules
- Architecture decision documents
- Design proposals
- Technical specifications
- API designs
- Database schema changes

If the user provides a GitHub PR URL or commit range, fetch the diff and review it. If they provide file paths, read and review those files. If they paste code directly, review that.

## Workflow

1. Show progress message: "🔍 Analyzing code for security vulnerabilities..."
2. Analyze from Security Engineer perspective (identify OWASP issues, injection points, etc.)
3. Show progress message: "⚡ Checking performance patterns and memory leaks..."
4. Analyze from Performance Engineer perspective (find N+1 queries, memory leaks, etc.)
5. Show progress message: "🧱 Reviewing architectural design..."
6. Analyze from Principal Architect perspective
7. Show progress message: "🧪 Analyzing test coverage and error handling..."
8. Analyze from QA Engineer perspective
9. Show progress message: "📦 Evaluating code maintainability..."
10. Analyze from Maintainability Reviewer perspective
11. Show progress message: "🚀 Assessing product alignment..."
12. Analyze from Product Engineer perspective
13. Show progress message: "📋 Synthesizing findings and prioritizing issues..."
14. Consolidate all findings into the issue-based format
15. Use Write tool to save complete review to `code-review-council.md`
16. Show final summary with issue counts and recommendation
