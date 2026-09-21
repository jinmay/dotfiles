#!/bin/bash
set -euo pipefail

# macOS 15.7.9에서 추출. 저장되지 않은 항목은 기본값 사용 상태로 복원합니다.
if [[ "$(uname -s)" != Darwin ]]; then
  echo "macOS에서 실행하세요." >&2
  exit 1
fi

# 시스템 설정을 닫은 뒤 실행하세요. 완료 후 로그아웃/로그인하세요.
# 키가 이미 없으면 건너뛰고, 실제 삭제 실패는 오류로 처리합니다.
reset_default() {
  if defaults "$@" >/dev/null 2>&1; then
    local args=("$@")
    local i
    for i in "${!args[@]}"; do
      if [[ "${args[$i]}" == read ]]; then args[$i]=delete; break; fi
    done
    defaults "${args[@]}"
  fi
}

# 트랙패드
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -int 0

# 외장 트랙패드
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHandResting -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHorizScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad USBMouseStopsTrackpad -int 0

# 트랙패드·키보드·확장자
reset_default read NSGlobalDomain com.apple.trackpad.scaling
reset_default read NSGlobalDomain com.apple.swipescrolldirection
reset_default read NSGlobalDomain com.apple.mouse.tapBehavior
defaults write NSGlobalDomain KeyRepeat -float 2.0
defaults write NSGlobalDomain InitialKeyRepeat -float 15.0
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
reset_default read NSGlobalDomain AppleShowAllExtensions

# Dock
defaults write com.apple.dock tilesize -float 24.0
defaults write com.apple.dock orientation -string left
reset_default read com.apple.dock autohide
reset_default read com.apple.dock magnification
reset_default read com.apple.dock largesize

# 배터리 퍼센트 표시
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Finder
reset_default read com.apple.finder ShowPathbar
reset_default read com.apple.finder ShowStatusBar

# 스크린샷
reset_default read com.apple.screencapture location
reset_default read com.apple.screencapture type

# 기기별 트랙패드 설정
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 3
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -int 1
reset_default -currentHost read NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior

# Spotlight 끄기, 한영 전환은 ⌘ Space. 다른 시스템 단축키는 보존합니다.
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add \
    64 '<plist version="1.0"><dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict></plist>' \
    65 '<plist version="1.0"><dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>1572864</integer></array><key>type</key><string>standard</string></dict></dict></plist>' \
    60 '<plist version="1.0"><dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict></plist>' \
    61 '<plist version="1.0"><dict><key>enabled</key><false/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>786432</integer></array><key>type</key><string>standard</string></dict></dict></plist>'

# Alfred 호출키: ⌥ Space. 새 맥의 경로·기기 식별자는 Alfred가 만든 값을 사용합니다.
# Alfred를 한 번 실행한 뒤 Alfred와 Alfred Preferences를 종료하고 적용하세요.
alfred_state="$HOME/Library/Application Support/Alfred/prefs.json"
if [[ -f "$alfred_state" ]]; then
    alfred_preferences=$(plutil -extract current raw -o - "$alfred_state")
    alfred_localhash=$(plutil -extract localhash raw -o - "$alfred_state")
    alfred_hotkey="$alfred_preferences/preferences/local/$alfred_localhash/hotkey/prefs.plist"
    mkdir -p "$(dirname "$alfred_hotkey")"
    if [[ ! -f "$alfred_hotkey" ]]; then plutil -create xml1 "$alfred_hotkey"; fi
    plutil -replace default -json '{"key":49,"mod":524288,"string":" "}' "$alfred_hotkey"
else
    echo "Alfred 단축키 건너뜀: Alfred를 한 번 실행·종료한 뒤 다시 적용하세요." >&2
fi

# 디스플레이: 밝기 100%, 자동 밝기·True Tone·Night Shift 끄기.
# 비공개 macOS API 사용. 밝기는 내장 화면만 변경하며 해상도·배치는 변경하지 않습니다.
osascript -l JavaScript <<'JAVASCRIPT'
ObjC.import('Cocoa');
ObjC.import('CoreGraphics');
['DisplayServices', 'CoreBrightness'].forEach(function (name) {
    if (!$.NSBundle.bundleWithPath('/System/Library/PrivateFrameworks/' + name + '.framework').load) {
        throw new Error(name + ' 로드 실패');
    }
});
ObjC.bindFunction('DisplayServicesEnableAmbientLightCompensation', ['int', ['unsigned int', 'bool']]);
ObjC.bindFunction('DisplayServicesSetBrightness', ['int', ['unsigned int', 'float']]);
var screens = $.NSScreen.screens;
for (var i = 0; i < screens.count; i++) {
    var id = ObjC.unwrap(screens.objectAtIndex(i).deviceDescription.objectForKey('NSScreenNumber'));
    if (!$.CGDisplayIsBuiltin(id)) continue;
    if ($.DisplayServicesEnableAmbientLightCompensation(id, false) !== 0) {
        throw new Error('자동 밝기 설정 실패');
    }
    if ($.DisplayServicesSetBrightness(id, 1.0) !== 0) {
        throw new Error('내장 화면 밝기 설정 실패');
    }
}
var toneClass = $.NSClassFromString('CBTrueToneClient');
var nightClass = $.NSClassFromString('CBBlueLightClient');
if (!toneClass || !nightClass) throw new Error('화면 색상 설정 API를 사용할 수 없습니다.');
var tone = toneClass.alloc.init;
if (tone.supported && !tone.setEnabled(false)) throw new Error('True Tone 설정 실패');
if (nightClass.supportsBlueLightReduction) {
    var night = nightClass.alloc.init;
    if (!night.setMode(0) || !night.setEnabled(false) || !night.setStrengthCommit(0.5, true)) {
        throw new Error('Night Shift 설정 실패');
    }
}
JAVASCRIPT

echo "설정 적용 완료. 로그아웃 후 다시 로그인하세요."
