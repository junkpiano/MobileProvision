# MobileProvision

## Usage

Package.swift

```
dependencies: [
    .package(url: "https://github.com/junkpiano/MobileProvision.git", from: "1.0.0"),
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
