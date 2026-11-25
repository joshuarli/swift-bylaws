Prefix: BYL
Next: 2

# TODO

### BYL-1 · P3 · SwiftPM fails to interrupt build tools on Swift 6.4.2

- **Area:** SwiftPM cancellation
- **Where:** Tests/ProcessTests/SwiftPMCancellationProcessTests.swift
- **Problem:** On macOS 27.2 with Swift 6.4.2, SwiftPM exits on SIGINT without forwarding it to a build tool in its own process group. The tool becomes an orphan. The cancellation test retains its assertion as a known issue on Swift 6.4 and later.
- **Recommendation:** Remove the known issue when SwiftPM forwards SIGINT to the tool; the test then reports an unexpected pass and identifies when the workaround is no longer needed.
- **Fix with:** none
- **Effort:** S

To reproduce independently of Bylaws, use the mock package defined in
`SwiftPMCancellationProcessTests.project()`, open its `events` FIFO for reading,
and run `swift build --disable-sandbox --target App` in the package directory.
After HoldTool reports its PID and process group to the FIFO, send SIGINT to the
`swift build` PID. On the affected toolchain, the build exits from SIGINT, the
FIFO never receives `interrupted`, and `ps -o pid,ppid,pgid -p <tool-pid>` shows
parent PID 1. Send SIGKILL to the negative tool process group to clean up.
