---
name: neo-feel
description: >
  Throttle this Mac toward a MacBook Neo (A18 Pro, 6 CPU cores, 8 GB) so
  someone can try a real workload before buying one. Use when the user wants
  to see if a MacBook Neo is fast enough, simulate a Neo, cap cores and RAM
  to Neo level, or runs neo-feel.
---

# neo-feel

The MacBook Neo is an A18 Pro: 2 performance + 4 efficiency cores, 5-core GPU, 8 GB unified memory. Single-core speed is close to an M-series performance core. Do not slow one core.

The command is `neo-feel` in `~/.local/bin`, or `python3` on this skill's `neo-feel` script.

1. Run `neo-feel status` and say what this Mac is, what will be held, and what is not simulated (GPU cores, 60 GB/s bandwidth, USB 2, thermals).
2. Turn it on only when they ask to start: `neo-feel on`. Tell them the pid and that `neo-feel off` puts the Mac back.
3. Leave their apps alone. They do the real work (browser tabs, the class app, a project) while it is on.
4. Run `neo-feel off` when they are done, or sooner if the Mac is struggling to stay responsive. Never leave it on after the session.
5. If they only want one command capped, use `neo-feel run -- <command>`.

Do not claim the result is a benchmark match. Say whether the task they actually did stayed comfortable.
