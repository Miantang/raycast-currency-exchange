# Raycast Currency Exchange for Yuan

A lightweight Raycast currency converter based on the open-source
[Currency Exchange extension](https://github.com/raycast/extensions/tree/main/extensions/currency-exchange).

This fork uses **CNY (Chinese Renminbi)** as the default source currency when no previously selected source currency exists.

## Features

- CNY is the default source currency on first use
- Supports 160+ currencies
- Supports arithmetic expressions such as `1+2/3*4`
- Filters target currencies with queries such as `100 in USD`
- Pins frequently used target currencies
- Remembers an explicitly selected source currency
- Supports ExchangeRate-API and UniRateAPI

## Requirements

- macOS with Raycast installed
- Node.js and npm
- An API key from either:
  - [ExchangeRate-API](https://www.exchangerate-api.com/)
  - [UniRateAPI](https://unirateapi.com/)

## Install as a Raycast development extension

```bash
git clone https://github.com/Miantang/raycast-currency-exchange.git
cd raycast-currency-exchange
npm install
npm run dev
```

`npm run dev` builds the extension and registers it with Raycast. After it appears in Raycast, search for **Currency Exchange for Yuan**. You can assign a global hotkey in Raycast Settings → Extensions.

## Verify the build

```bash
npm ci
npm run build
npm run lint
```

The production bundle is generated in `dist/` and is intentionally ignored by Git.

## Upstream and license

This project is derived from `raycast/extensions/extensions/currency-exchange` and retains its MIT license and contributor attribution. See [LICENSE](./LICENSE).
