# Full-Stack Critic

A portable senior full-stack engineering critic for Claude Code, Gemini CLI, QoderCLI, Antigravity, and IDE terminals.

## Quick start

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
cd your-project
cat ~/fullstack-critic/CRITIC.md ~/fullstack-critic/prompts/fullstack-review.md | claude
```

Replace `claude` with `gemini`, `qoder`, or another CLI that accepts a prompt.

The critic reviews backend, frontend, APIs, databases, security, observability, tests, and scalability toward 100,000 requests per minute. It does not modify files unless explicitly asked.
