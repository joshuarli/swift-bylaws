# TODO

## BYL-1 P2: SwiftPM cancellation test times out on Swift 6.4.2

`SwiftPMCancellationProcessTests` exceeds its 2-minute limit on macOS 27.2 with Swift 6.4.2, so
`make test` fails. The same test fails the same way on unmodified `theblixguy/swift-bylaws` main.

Reproduce:

```sh
BYLAWS_BUILD_PLUGIN_FROM_SOURCE=1 swift test --filter SwiftPMCancellationProcessTests
```

Done when that command passes without skipping the test.
