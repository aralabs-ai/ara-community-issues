# ARA Community Issues

**Issue tracker for [ARA Community Edition](https://aralabs.ai/community)**

This repository is the single place to report bugs, request features, and track the progress of ARA Community Edition (CE). ARA's source code is closed-source; this public repo exists so the community can participate in product direction.

---

## Before You Open an Issue

| Need | Where to go |
|------|-------------|
| **Bug in CE** | Open a [Bug Report](../../issues/new?template=bug_report.yml) here |
| **Feature request** | Open a [Feature Request](../../issues/new?template=feature_request.yml) here |
| **General question / how-to** | Open a [Support Question](../../issues/new?template=question.yml) here |
| **Docs correction** | Open a [Docs Issue](../../issues/new?template=docs.yml) here |
| **Security vulnerability** | **Do not open a public issue.** Email [security@aralabs.ai](mailto:security@aralabs.ai) — see [Security Policy](https://aralabs.ai/security) |
| **Enterprise / commercial** | [Contact form](https://aralabs.ai/enterprise) |

---

## Issue Lifecycle

```
filed → [triage] → [confirmed] → [in-progress] → [fixed-in-next] → closed on release
                ↘ [needs-info] ↗
                ↘ [wont-fix]    (closed)
                ↘ [duplicate]   (closed, linked to original)
```

Issues tagged `status: triage` are in the review queue. The ARA team triages new issues within **5 business days**.

---

## Label Reference

### Type
| Label | Meaning |
|-------|---------|
| `type: bug` | Something is broken |
| `type: enhancement` | New capability or improvement |
| `type: question` | Support / how-to |
| `type: documentation` | Docs missing, wrong, or unclear |
| `type: performance` | Latency or throughput regression |
| `type: security` | ⚠ Use email — see above |

### Priority (set by maintainers)
| Label | Criteria |
|-------|---------|
| `P0: critical` | Data loss, crash on start, all users affected |
| `P1: high` | Core functionality broken, no workaround |
| `P2: medium` | Significant issue with a workable workaround |
| `P3: low` | Minor, cosmetic, or nice-to-have |

### Component
`component: server` · `component: sdk/python` · `component: sdk/java` · `component: sdk/cpp` · `component: config` · `component: install` · `component: docs`

### Status (set by maintainers)
`status: triage` · `status: confirmed` · `status: needs-info` · `status: in-progress` · `status: fixed-in-next` · `status: wont-fix` · `status: duplicate`

### Special
`good first issue` — well-scoped issues where community help is welcome (reproduction cases, doc PRs).

---

## Version Support

Only the **latest released** CE version receives fixes. Please reproduce on the latest before filing.

Current release: [aralabs.ai/download](https://aralabs.ai/download)

---

*ARA is built by [ARA AI Labs](https://aralabs.ai) · Pune, India*
