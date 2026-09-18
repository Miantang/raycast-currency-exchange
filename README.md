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

## Install the packaged extension

Every GitHub Actions build produces `currency-exchange-cny.rayext`:

1. Open the latest successful run on the repository's **Actions** page.
2. Download the `currency-exchange-cny-rayext` artifact.
3. Unzip the downloaded GitHub artifact.
4. Open `currency-exchange-cny.rayext` to import it into Raycast.

The `.rayext` file is an optimized Raycast extension archive built by the official Raycast CLI. It does not require a continuously running `npm run dev` process.

## Install as a development extension

```bash
git clone https://github.com/Miantang/raycast-currency-exchange.git
cd raycast-currency-exchange
npm install
npm run dev
```

`npm run dev` builds the extension and registers it with Raycast. You only need to do this once for installation; the extension remains available after the development process stops. Run it again only when you want Raycast to pick up source changes with live reload.

After it appears in Raycast, search for **Currency Exchange for Yuan**. You can assign a global hotkey in Raycast Settings → Extensions.

## Verify the build

```bash
npm ci
npm run build
npm run lint
npm run bundle
```

`npm run bundle` generates `currency-exchange-cny.rayext` in the project root.

## Upstream and license

This project is derived from `raycast/extensions/extensions/currency-exchange` and retains its MIT license and contributor attribution. See [LICENSE](./LICENSE).
