# remove-whitespace package

Remove, shrink, replace whitespace in the selected text.

## Install
```sh
apm install remove-whitespace
```

Or search for `remove-whitespace` in Atom settings view.

## Commands

### Remove Whitespace: Remove

```
aa bb   c c  dd => aabbccdd
```

### Remove Whitespace: Shrink

```
aa bb   c c  dd => aa bb c c dd
```

### Remove Whitespace: Replace

You can change the inserted string in package setting.

```
aa bb   c c  dd => aa-bb-c-c-dd
```

## Keymap

No keymap by default. Please edit `~/.atom/keymap.cson`.

For example:
```coffeescript
'atom-workspace':
  'ctrl-alt-r': 'remove-whitespace:remove'
  'ctrl-alt-s': 'remove-whitespace:shrink'
  'ctrl-alt-p': 'remove-whitespace:replace'
```
