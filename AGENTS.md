# Repository Guidelines

## Project Structure

A free and strong UCI chess engine.

- `src/` — application or library source.
- `tests/` — automated tests and fixtures.
- `scripts/` — development and operational scripts.

## Development and Validation

Run commands from the repository root unless the component documentation says otherwise. Configure local dependencies and test services before application tests.

- `make -C src help` — list compiler and architecture build options.
- `make -C src -j2 build ARCH=x86-64` — build an x86-64 engine; choose the documented ARCH for other CPUs.

## Coding and Testing

Match the indentation and naming of neighboring files; avoid unrelated reformatting. Use the checks documented in the README and component directories; do not claim an automated suite exists without verifying it. Keep changes focused and follow existing test filenames. Add regression coverage for behavior changes, using isolated fixtures instead of live customer data. For documentation-only edits, verify commands, local links, and `git diff --check`.

## Working Agreement

Read `CONTRIBUTING.md` and `SECURITY.md` before contributing. Honor directory-specific agent instructions. Preserve existing local changes and use a separate branch or worktree when other work is in progress. Keep credentials, private datasets, and generated artifacts out of commits. Deployment, publishing, and live service changes require authorization for that environment.

Use concise commit subjects consistent with recent history (for example, `docs: clarify setup`). Pull requests should explain the change, link relevant issues, and record validation results and any skipped checks. Include screenshots when user-visible behavior changes.

## Licensing

Existing upstream license terms and notices remain in force; see [Copying.txt](Copying.txt).
