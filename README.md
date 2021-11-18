# BrainKit

## How to use

* Add `brainpods` repository to the local CocoaPods instalation

```
pod repo add brainpods https://bitbucket.org/userbrain/brainpods.git
```

* Add explicit sources to the Podfile

```
source 'https://github.com/CocoaPods/Specs.git'
source 'https://bitbucket.org/userbrain/brainpods.git'
```

* Add BrainKit to the Podfile

```
pod 'BrainKit'
```

## Creating new version

- Commit your changes
- Update version in `podspec`
- Add version tag, like `0.0.1` and make sure it is also pushed
- Push update by runing `./update-brainpods`
