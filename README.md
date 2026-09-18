# Raycast Currency Exchange for Yuan

A lightweight Raycast currency converter based on the open-source
[Currency Exchange extension](https://github.com/raycast/extensions/tree/main/extensions/currency-exchange).

This fork uses **CNY (Chinese Renminbi)** as the default source currency when no previously selected source currency exists.

## Features

- CNY is the default source currency on first use
- Supports 160+ currencies
- Supports arithmetic expressions such as `1+2/3*4`
- Filters target currencies with queries such as `100 in USD`
- Pins frequently used target currencies in a configurable order
- Remembers an explicitly selected source currency
- Supports ExchangeRate-API and UniRateAPI

## Requirements

- macOS with Raycast installed
- Node.js and npm
- An API key from either:
  - [ExchangeRate-API](https://www.exchangerate-api.com/)
  - [UniRateAPI](https://unirateapi.com/)

## Install privately on macOS

Every GitHub Actions build produces a personal installer. The extension is imported locally and is not published to the Raycast Store.

1. Open the latest successful run on the repository's **Actions** page.
2. Download the `currency-exchange-cny-macos-installer` artifact.
3. Unzip the GitHub artifact, then unzip `currency-exchange-cny-macos.zip`.
4. Open the extracted `currency-exchange-cny` folder and double-click `install.command`.
5. If macOS blocks it, Control-click `install.command`, choose **Open**, and confirm.

The installer requires Raycast and Node.js 22.14 or newer. It copies the extension to `~/Library/Application Support/Raycast Extensions/currency-exchange-cny`, installs its dependencies, and imports it into Raycast. The development process stops automatically after import; it does not need to stay running.

To install an update on this Mac or another Mac, download the newest CI artifact and run its `install.command` again.

## Install as a development extension

```bash
git clone https://github.com/Miantang/raycast-currency-exchange.git
cd raycast-currency-exchange
npm install
npm run dev
```

`npm run dev` builds the extension and registers it with Raycast. You only need to do this once for installation; the extension remains available after the development process stops. Run it again only when you want Raycast to pick up source changes with live reload.

After it appears in Raycast, search for **Currency Exchange for Yuan**. You can assign a global hotkey in Raycast Settings → Extensions.

To configure permanent pinned results and their order, open the extension preferences and edit **Pinned Currencies**. For example, `USD,EUR,GBP,AUD,CAD` displays USD first, followed by EUR, GBP, AUD, and CAD.

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
