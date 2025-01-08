My dotfiles, managed by chezmoi.

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
