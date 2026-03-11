# Proposal: Automated Pub.dev Release

## Overview

This proposal outlines a GitHub Actions-based automation for publishing the `neon_ui` package to pub.dev.

## Architecture

### Workflow 1: Release Preparation (`release-prep.yml`)
**Trigger**: Manual workflow dispatch (with optional version bump type: patch/minor/major)

**Purpose**: 
- Generates changelog from git history since last release tag
- Creates a PR with version bump and changelog
- Allows manual review before merge

**Steps**:
1. Checkout code
2. Setup Flutter
3. Get latest git tag (or default to `0.0.0`)
4. Generate changelog using `git log --pretty=format:"* %s (%h)"` since last tag
5. Bump version in `pubspec.yaml` based on semantic version type
6. Create a branch `release/v<new-version>`
7. Commit changes and push
8. Create a PR for review

### Workflow 2: Publish to Pub.dev (`publish.yml`)
**Trigger**: On merge to `main` branch (or on tag push)

**Purpose**:
- Publishes the package to pub.dev when PR is merged
- Creates a git tag for the release

**Steps**:
1. Checkout code at merged commit
2. Setup Flutter
3. Run `dart pub get` to ensure dependencies
4. Run `dart pub publish --dry-run` to validate
5. Run `dart pub publish` to publish
6. Create git tag `v<version>`

## Integration with Pub.dev

### Authentication
The workflow requires:
1. **Pub.dev API token** stored as a GitHub secret (`PUB_DEV_API_TOKEN`)
2. Configure token via `dart pub token add https://pub.dev` in the workflow

### Required Permissions
- `contents: write` - for creating tags and commits
- `pull-requests: write` - for creating release PRs

## Files to Create

```
.github/workflows/
├── release-prep.yml    # Creates release PR
└── publish.yml         # Publishes on merge
```

## Usage

1. **Trigger release prep**: Go to Actions → "Release Prep" → "Run workflow" → Select version bump type
2. **Review PR**: Check the generated changelog and version
3. **Merge PR**: Automatically triggers publish to pub.dev

## Example Workflow Files

### release-prep.yml
```yaml
name: Release Prep

on:
  workflow_dispatch:
    inputs:
      bump_type:
        description: 'Version bump type'
        required: true
        default: 'patch'
        type: choice
        options:
          - patch
          - minor
          - major

jobs:
  prepare-release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6
        with:
          fetch-depth: 0

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Get latest tag
        id: get_tag
        run: |
          TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
          echo "tag=$TAG" >> $GITHUB_OUTPUT

      - name: Generate changelog
        id: changelog
        run: |
          CHANGELOG=$(git log --pretty=format:"- %s (%h)" ${{ steps.get_tag.outputs.tag }}..HEAD)
          echo "changelog<<EOF" >> $GITHUB_OUTPUT
          echo "$CHANGELOG" >> $GITHUB_OUTPUT
          echo "EOF" >> $GITHUB_OUTPUT

      - name: Bump version
        run: |
          # Use a Dart script or action to bump version
          # Update pubspec.yaml with new version

      - name: Create PR
        run: |
          # Create branch, commit, and PR
```

### publish.yml
```yaml
name: Publish

on:
  pull_request:
    types: [closed]
    branches: [main]

jobs:
  publish:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Add pub.dev token
        run: echo '${{ secrets.PUB_DEV_API_TOKEN }}' | dart pub token add https://pub.dev

      - name: Publish
        run: dart pub publish --force

      - name: Create tag
        run: |
          git config user.name "GitHub Action"
          git config user.email "action@github.com"
          git tag v${{ steps.version.outputs.new_version }}
          git push origin v${{ steps.version.outputs.new_version }}
```

## Notes
- Requires `PUB_DEV_API_TOKEN` secret in repository settings
- Changelog generation uses conventional commit format (consider adding conventional-commits linter)
- Version bumping can use `flutter_version_bump` action or custom script
