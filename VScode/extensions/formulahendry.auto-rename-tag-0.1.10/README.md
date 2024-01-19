# Auto Rename Tag

[![Marketplace Version](https://vsmarketplacebadge.apphb.com/version/formulahendry.auto-rename-tag.svg)](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag) [![Installs](https://vsmarketplacebadge.apphb.com/installs/formulahendry.auto-rename-tag.svg)](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag) [![Rating](https://vsmarketplacebadge.apphb.com/rating/formulahendry.auto-rename-tag.svg)](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag) [![Build Status](https://travis-ci.org/formulahendry/vscode-auto-rename-tag.svg?branch=master)](https://travis-ci.org/formulahendry/vscode-auto-rename-tag)

Automatically rename paired HTML/XML tag, same as Visual Studio IDE does.

## Sponsors

[![Tabnine](https://github.com/formulahendry/vscode-auto-rename-tag/raw/HEAD/images/tabnine.png)](https://bit.ly/2LZsrQ9)<br>
Increase your coding productivity with Tabnine’s AI code completions! Tabnine is a free powerful Artificial Intelligence assistant designed to help you code faster, reduce mistakes, and discover best coding practices - without ever leaving the comfort of VS Code.<br>
Tabnine is trusted by more than a million developers worldwide. [Get it now](https://bit.ly/2LZsrQ9).

<p><a title="Try CodeStream" href="https://sponsorlink.codestream.com/?utm_source=vscmarket&amp;utm_campaign=autorenametag&amp;utm_medium=banner"><img src="https://alt-images.codestream.com/codestream_logo_autorenametag.png"></a><br>
Eliminate context switching and costly distractions. Create and merge PRs and perform code reviews from inside your IDE while using jump-to-definition, your keybindings, and other IDE favorites.<br> <a title="Try CodeStream" href="https://sponsorlink.codestream.com/?utm_source=vscmarket&amp;utm_campaign=autorenametag&amp;utm_medium=banner">Learn more</a></p>

[![Stepsize](https://github.com/formulahendry/vscode-auto-rename-tag/raw/HEAD/images/stepsize.png)](https://bit.ly/3wmQ72y)<br>
Track and prioritise tech debt and maintenance issues, straight from your IDE. Bookmark code while you work, organise TODOs and share codebase knowledge with your team. [Try it out for free today](https://bit.ly/3wmQ72y).

[![Bloop](https://github.com/formulahendry/vscode-auto-rename-tag/raw/HEAD/images/bloop.png)](https://bloop.ai/?utm_source=vscmarket&utm_campaign=formulahendry&utm_medium=banner)<br>
Bored of trawling through the docs? Get JS and TS code examples from documentation and Open Source right in your IDE. [Learn more](https://bloop.ai/?utm_source=vscmarket&utm_campaign=formulahendry&utm_medium=banner).

[![Duckly](https://storage.googleapis.com/gitduck/img/duckly-sponsor-vsc-opt.png)](https://bit.ly/3gvmQ00)<br>
Easy pair programming with any IDE. Duckly enables you to talk, share your code in real-time, server and terminal with people using different IDEs. [Try it out for free](https://bit.ly/3gvmQ00).

## Book for VS Code

[《Visual Studio Code 权威指南》](https://union-click.jd.com/jdc?e=jdext-1261348777639735296-0&p=AyIGZRhbHQsWAVIaXxEyEgRdG1sRBxU3EUQDS10iXhBeGlcJDBkNXg9JHUlSSkkFSRwSBF0bWxEHFRgMXgdIMkRxFAUJD1RQZT0cBnwKDE4%2BaDpgB2ILWStbHAIQD1QaWxIBIgdUGlsRBxEEUxprJQIXNwd1g6O0yqLkB4%2B%2FjcePwitaJQIWD1cfWhwKGwVSG1wlAhoDZc31gdeauIyr%2FsOovNLYq46cqca50ytrJQEiXABPElAeEgRSG1kQCxQBUxxZHQQQA1YTXAkDIgdUGlscChECXRs1FGwSD1UbWRALFwRWK1slASJZOxoLRlUXU1NONU9QEkdXWRlJbBUDVB9TFgAVN1caWhcA)：带你深入浅出 VS Code！

![Book](https://github.com/formulahendry/vscode-auto-rename-tag/raw/HEAD/images/book.jpg)

## ❤️ Contributors

Kudos to [@SimonSiefke](https://github.com/SimonSiefke) for rewriting the logic of this extension!

## Features

- When you rename one HTML/XML tag, automatically rename the paired HTML/XML tag

## Usages

![Usage](https://github.com/formulahendry/vscode-auto-rename-tag/raw/HEAD/images/usage.gif)

## Configuration

Add entry into `auto-rename-tag.activationOnLanguage` to set the languages that the extension will be activated.
By default, it is `["*"]` and will be activated for all languages.

```json
{
  "auto-rename-tag.activationOnLanguage": ["html", "xml", "php", "javascript"]
}
```

The setting should be set with language id defined in [VS Code](https://github.com/Microsoft/vscode/tree/master/extensions). Taking [javascript definition](https://github.com/Microsoft/vscode/blob/master/extensions/javascript/package.json) as an example, we need to use `javascript` for `.js` and `.es6`, use `javascriptreact` for `.jsx`. So, if you want to enable this extension on `.js` file, you need to add `javascript` in settings.json.

## Note

From 1.44, VS Code offers the built-in [auto update tags](https://code.visualstudio.com/docs/languages/html#_auto-update-tags) support for HTML and Handlebars that can be enabled with the setting `editor.linkedEditing`. If this setting is enabled, this extension will skip HTML and Handlebars files regardless of the languages listed in `auto-rename-tag.activationOnLanguage`
## Change Log

See Change Log [here](https://github.com/formulahendry/vscode-auto-rename-tag/blob/HEAD/CHANGELOG.md)

## Issues

Submit the [issues](https://github.com/formulahendry/vscode-auto-rename-tag/issues) if you find any bug or have any suggestion.

## Contribution

Fork the [repo](https://github.com/formulahendry/vscode-auto-rename-tag) and submit pull requests.

<!--
TODO REACT BUG: const Navigation = ()=><>
</>
type nav
-->
