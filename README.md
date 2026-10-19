# neo-feel

Run your Mac as if it were a [MacBook Neo](https://www.apple.com/macbook-neo/specs/) long enough to see whether a workload still feels fine, then turn it off.

The Neo is an Apple A18 Pro: 2 performance cores and 4 efficiency cores, a 5-core GPU, and 8 GB of unified memory. Its single core is about as fast as a recent M-series performance core. What it lacks is extra cores and extra RAM.

`neo-feel` does the two things macOS allows without root or a kernel extension:

- It locks enough memory that about 8 GB is left for macOS and your apps.
- When something tries to use more than 6 cores, it burns the surplus so the rest of the machine keeps about 6. A one-core task is left alone, so opening an app still feels like this Mac.

It does not slow the GPU, cut memory bandwidth to 60 GB/s, or pretend a Thunderbolt port is USB 2. Games and single-thread bursts will still feel faster than a real Neo.

## Install

```bash
git clone https://github.com/vagdotdev/neo-feel.git
cd neo-feel
./install.sh
```

That copies the command to `~/.local/bin/neo-feel` and the agent skill to `~/.agents/skills/neo-feel`. Add `~/.local/bin` to your `PATH` if it is not there.

## Use

```bash
neo-feel status
neo-feel on
# use the Mac the way your friend would: browser, class apps, a project
neo-feel off
```

`neo-feel on --dry-run` prints the plan and changes nothing.

`neo-feel run -- <command>` only limits that command (thread pools set to 6). The whole-Mac cap is `on` / `off`.

State lives in `~/.neo-feel/`. `off` releases the memory lock and stops the CPU cap. Quit the tool before sleep if the Mac feels tight; it does not survive a reboot, which also clears it.

## License

MIT
