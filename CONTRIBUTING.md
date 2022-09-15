# How to contribute?


## How to prepare a new package release?

### 1. Perform a dry run

First, run a dry-run to detect any issues related to publishing the new version:

```shell
 dart pub publish --dry-run
```

Continue to the next step only when all the `dry-run` issues are addressed.

### 2. Increase version string

Update `version` at `pubspec.yaml` and `changelog.config.json` by following [SemVer v2.0](https://semver.org/lang/es/).

### 3. Update CHANGELOG

Regenerate the `CHANGELOG.md` file by running: 

```shell
conventional-changelog -p angular -i CHANGELOG.md -s -r 0 -c "changelog.config.json"
```

### 4.Commit version bump

```shell
git add CHANGELOG.md changelog.config.json pubspec.yaml
git commit -m "chore: bump version to <X.X.X+X>"
```

Where `<X.X.X+X>` is the version number from step 1.

Bump commit examples:
- [chore: bump version to 0.1.0](https://github.com/luisburgos/buzz/commit/18fc6263cede0ce23f2bb994d2e7880dc6aa7288)
- [chore: bump version to 0.0.6](https://github.com/luisburgos/buzz/commit/ee8214f41da8fd35a6a008803b9105499e6a4c20)
- [chore: bump version to 0.0.5](https://github.com/luisburgos/buzz/commit/2cb8756188c50d374d17e6d2fafe055ff1fa3795)
- [chore: bump version to 0.0.4](https://github.com/luisburgos/buzz/commit/44842aeb6cc197101ff07c0e44a7d1976b783b50)

### 5. Create Git tag

```shell
 git tag -a <X.X.X+X> -m "A short tag description"
```

Here is a list of existing [tags](https://github.com/luisburgos/buzz/tags) in the repo.

### 6. Push everything!

```shell
git push origin main
git push --tags
```

### 7. Publish the package

When everyhing is ok, publish the package:

```shell
 dart pub publish
```
