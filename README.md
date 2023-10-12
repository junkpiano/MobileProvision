## Usage

```
import MobileProvision

func readMobileProvision() {
    let mpf = MobileProvision()
    let plist = mpf.parse()

    print(plist.name)
    print(plist.expirationDate)
}
```