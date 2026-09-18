# Currency Exchange Changelog

## [Add Private macOS Installer] - 2026-09-18

- Package the extension source and a one-time `install.command` in GitHub Actions.
- Import the extension locally without publishing it to the Raycast Store.
- Keep the installed source in a stable Application Support directory for easy updates.

## [Improve Result Layout] - 2026-09-18

- Show the converted amount as the primary, larger text in every result row.
- Add Chinese and English currency names as right-aligned metadata.
- Put CNY and USD at the top of the source-currency selector and always start from CNY.

## [Add Installable Bundle] - 2026-09-18

- Upgrade to Raycast API 2.4.1.
- Build an installable `.rayext` archive in GitHub Actions.
- Upload the archive as a downloadable workflow artifact.

## [CNY-first fork] - 2026-09-18

- Use CNY as the source currency when no saved source currency exists.
- Rename the extension so it can be distinguished from the upstream Store extension during local development.

## [Add UniRateAPI as alternate provider] - 2026-04-29

- Added a "Rate Provider" preference. ExchangeRate-API remains the default; UniRateAPI is selectable as an alternative.
- API key field now applies to whichever provider is selected.

## [Added missing contributor] - 2025-11-25

## [Update] - 2025-11-04

- Toggled on windows support

## [Update] - 2024-10-01

- Add currency formating to all display

## [Upgraded dependencies] - 2023-04-11

## [Update] - 2023-01-02

- Add query based on historical currency new function

## [Update] - 2022-09-20

- Updated currency code and country mapping file
- Fixed an issue which could lead to a crash

## [Initial release] - 2022-06-09
