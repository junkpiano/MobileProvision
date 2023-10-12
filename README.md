# MobileProvision

## Usage

Package.swift

```
dependencies: [
    .package(url: "ssh://git@gitpub.rakuten-it.com:7999/ecma/mobileprovision.git", from: "1.0.0"),
],
targets: [
    .target(name: "AwesomeApp",
            dependencies: [
                            .product(name: "MobileProvision", package: "MobileProvision")
                          ]),
]
```

In Swift files,

```
import MobileProvision

func readMobileProvision() {
    let mp = MobileProvision()
    let plist = mp.parse()

    print(plist.name)
    print(plist.expirationDate)
}
```