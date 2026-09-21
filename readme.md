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

### macOS 설정 복원

macOS 15.7.9에서 추출한 트랙패드, 키보드, Dock, Finder, 스크린샷 설정입니다.
chezmoi 적용만으로 실행되지 않으며, 시스템 설정 앱을 닫고 직접 실행합니다.

```bash
chezmoi init --apply jinmay  # 처음 가져올 때
# 이미 설정했다면: chezmoi update
bash ~/.local/bin/apply-macos-defaults.sh
```

일반 Git clone으로 받은 경우 저장소 루트에서:

```bash
bash dot_local/bin/executable_apply-macos-defaults.sh
```

완료 후 로그아웃·로그인하세요. sudo는 필요 없습니다.
저장값이 없는 항목은 해당 키를 삭제하여 macOS 기본값 사용 상태로 복원합니다.
이동 속도·스크롤 방향, 확장자·경로·상태 막대, 스크린샷 위치·형식 등은
원본 맥에서 저장값이 없었습니다. macOS 버전이 다르면 기본값·지원 여부도 달라질 수 있습니다.
홈 경로·최근 파일·Dock 앱 목록은 포함하지 않습니다.
