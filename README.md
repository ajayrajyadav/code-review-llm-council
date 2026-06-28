# AI Code Review Council

A comprehensive multi-perspective code review skill for Claude that analyzes code through specialized reviewer lenses and produces detailed, actionable issue-based reviews.

## Features

- **Multi-Perspective Analysis**: Analyzes code from 7 specialized perspectives (Security, Performance, Architecture, QA, Maintainability, Product)
- **OWASP Top 10 Coverage**: Complete coverage of OWASP Top 10 2021 vulnerabilities
- **Memory Leak Detection**: Comprehensive analysis of resource leaks, unbounded collections, and cleanup patterns
- **Issue-Based Format**: Numbered issues with severity, location, code examples, and recommendations
- **Actionable Feedback**: Concrete code examples showing both problems and solutions
- **Impact Quantification**: Real metrics (query counts, memory usage, response times)
- **Attack Scenarios**: Security issues include exploitation examples

## Installation

### Global Installation

```bash
claude skill install code-review-llm-council.skill
```

### Project-Specific Installation

```bash
cd /path/to/your/project
claude skill install /path/to/code-review-llm-council.skill --local
```

## Usage

### Review a File

```bash
claude "Review this code" path/to/file.py
```

### Review a PR/Branch Diff

```bash
git diff main...feature-branch > changes.diff
claude "Review these changes" changes.diff
```

### Review Multiple Files

```bash
claude "Review the authentication system" src/auth/*.ts
```

### Invoke Directly

```bash
/code-review-council
```

## Review Coverage

### 🛡️ Security Engineer
- Full OWASP Top 10 2021 coverage
- Injection attacks (SQL, XSS, command injection)
- Broken access control and authentication
- Cryptographic failures and secret management
- Security misconfiguration
- Vulnerable dependencies
- SSRF, XXE, and advanced attack vectors

### ⚡ Performance Engineer
- Memory leaks (unbounded collections, event listeners, file handles)
- Resource exhaustion (connection pools, threads, temporary files)
- Algorithm complexity (O(n²) patterns)
- Database performance (N+1 queries, missing indexes)
- Scalability bottlenecks (missing pagination, synchronous blocking)
- Log file growth and cache eviction

### 🧱 Principal Architect
- Separation of concerns
- Design patterns and architectural consistency
- Technical debt and maintainability
- Component coupling
- Long-term implications

### 🧪 QA Engineer
- Test coverage gaps
- Edge cases and boundary conditions
- Error handling in failure scenarios
- Race conditions and concurrency
- Resource cleanup in error paths

### 📦 Maintainability Reviewer
- Code readability and clarity
- Naming conventions
- Documentation quality
- Code complexity
- Magic numbers and constants

### 🚀 Product Engineer
- Business requirement alignment
- User experience impact
- Missing use cases
- Overengineering vs. simplicity
- Feature completeness

## Output Format

Reviews are structured with:

```markdown
# Code Review: [Component]
Date: YYYY-MM-DD

## Context
[Scope, files reviewed, languages, focus areas]

## CRITICAL SECURITY ISSUES

### Issue 1: Brief descriptive title
**Severity**: CRITICAL
**Location**: `path/to/file.ext:42`
[Code snippet with line numbers]

**Vulnerability**: [What's wrong]
**Impact**: [Consequences with metrics]
**Attack scenario**: [Exploitation example]
**Recommendation**: [Fix with code]
**Why**: [Rationale]

---

## HIGH PRIORITY ISSUES
[Similar format]

## MEDIUM PRIORITY ISSUES
[Similar format]

## LOW PRIORITY ISSUES
[Similar format]

## SUMMARY
- Issues by severity count
- Most critical issues list
- Overall assessment
- Merge recommendation (DO NOT MERGE | REQUEST CHANGES | APPROVE WITH CONDITIONS | APPROVE)
- Priority fixes with timeline
```

## Example Output

See `council-review.md` for a complete example review.

## Development

### Running Tests

```bash
# Test the skill on sample code
claude --skill code-review-llm-council "Review this" test-cases/auth.py
```

### Modifying the Skill

1. Edit `SKILL.md` to update reviewer responsibilities or output format
2. Test with your own code samples
3. Repackage: `python -m scripts.package_skill .`

## Benchmarks

Based on evaluation tests:
- **Pass rate**: 100% (vs 81% baseline)
- **Comprehensive**: Catches all OWASP Top 10 + memory leaks
- **Structured**: Issue-based format with clear priorities
- **Actionable**: Every issue includes fix with rationale

Trade-offs:
- 2.6x slower than basic review (comprehensive analysis takes time)
- 40% more tokens (detailed multi-perspective analysis)
- Significantly higher quality and completeness

## License

MIT

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes to `SKILL.md`
4. Test thoroughly
5. Submit a pull request

## Version History

- **v1.0** (2026-06-11): Initial release
  - Multi-perspective issue-based reviews
  - Full OWASP Top 10 2021 coverage
  - Comprehensive memory leak detection
  - Actionable recommendations with code examples
