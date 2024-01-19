### 0.1.10 (2022-02-08)
* Update dependencies
* Fix Windows CO
* Add sponsor for Duckly

### 0.1.9 (2021-10-12)
* Fix potential security vulnerabilities

### 0.1.8 (2021-07-31)
* Fix potential security vulnerabilities

### 0.1.7 (2021-07-09)
* Support new vscode apis
* Fix bugs

### 0.1.6 (2021-01-06)
* Also check linkedEditing setting
* Fix [#562](https://github.com/formulahendry/vscode-auto-rename-tag/issues/562)

### 0.1.5 (2020-10-11)
* [#556](https://github.com/formulahendry/vscode-auto-rename-tag/pull/556): Improve auto renaming with React

### 0.1.4 (2020-07-03)
* [#541](https://github.com/formulahendry/vscode-auto-rename-tag/pull/541): fix tag starting with $
* [#544](https://github.com/formulahendry/vscode-auto-rename-tag/pull/544): fix script and style rename

### 0.1.3 (2020-05-16)
* Skip HTML and Handlebars files when the setting `editor.renameOnType` is enabled

### 0.1.2 (2020-04-21)
* Kudos to [@SimonSiefke](https://github.com/SimonSiefke) for [rewriting the logic of this extension](https://github.com/formulahendry/vscode-auto-rename-tag/pull/511)

### 0.1.1 (2019-10-27)
* Add notice about performance issue

### 0.1.0 (2019-06-02)
* [#105](https://github.com/formulahendry/vscode-auto-rename-tag/pull/105): Bug fixes

### 0.0.15 (2017-11-04)
* Add support for Multi Root Workspace

### 0.0.14 (2017-06-19)
* Fix [#30](https://github.com/formulahendry/vscode-auto-rename-tag/issues/30)

### 0.0.13 (2017-06-18)
* Fix [#24](https://github.com/formulahendry/vscode-auto-rename-tag/issues/24) and [#29](https://github.com/formulahendry/vscode-auto-rename-tag/issues/29)

### 0.0.12 (2017-05-21)
* Fix [#15](https://github.com/formulahendry/vscode-auto-rename-tag/issues/15) and [#21](https://github.com/formulahendry/vscode-auto-rename-tag/issues/21): Undo and redo are broken

### 0.0.11
* Fix [GitHub issue#12](https://github.com/formulahendry/vscode-auto-rename-tag/issues/12): Not work when using OPTION+DELETE (or CTRL+BACKSPACE)

### 0.0.10
* Fix [GitHub issue#17](https://github.com/formulahendry/vscode-auto-rename-tag/issues/17): Unexpected renaming when moving row with "alt+down"

### 0.0.9
* Fix [GitHub issue#14](https://github.com/formulahendry/vscode-auto-rename-tag/issues/14): Avoid renaming tag when moving rows with "alt+up/down"

### 0.0.8
* Fix [GitHub issue#11](https://github.com/formulahendry/vscode-auto-rename-tag/issues/11)

### 0.0.7
* Fix [GitHub issue#8](https://github.com/formulahendry/vscode-auto-rename-tag/issues/8)

### 0.0.6
* Merge [PR#7](https://github.com/formulahendry/vscode-auto-rename-tag/pull/7): Remove console.log
* Update README.md to clarify the configuration for `auto-rename-tag.activationOnLanguage`

### 0.0.5
* Fix [GitHub issue#6](https://github.com/formulahendry/vscode-auto-rename-tag/issues/6)

### 0.0.4
* Add support for tag name that contains ```- _ : .```

### 0.0.3
* Fix paired tags not updated when there are void elements or self-closing tags between paired tags
* Fix [GitHub issue#2](https://github.com/formulahendry/vscode-auto-rename-tag/issues/2)
* Fix [GitHub issue#3](https://github.com/formulahendry/vscode-auto-rename-tag/issues/3)
* Parse document independently instead of using SAXParser of parse5 npm package to avoid uncontrollable parse behavior

### 0.0.2
* Update logo

### 0.0.1
* Initial Release