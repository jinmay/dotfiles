My dotfiles, managed by chezmoi.

## Use

```bash
chezmoi init --apply jinmay
```

## Ubuntu

```bash
# Install chezmoi
curl -sfL https://git.io/chezmoi | sh
sudo mv ./bin/chezmoi /usr/local/bin/
```

After install, restart session

## Macbook

### backup

```bash
brew bundle dump
```

### restore

```bash
brew bundle
```

### need to install manually

- enpass
- adguard
