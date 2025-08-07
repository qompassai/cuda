#!/bin/sh
# /qompassai/cuda/scripts/quickstart.sh
# Qompass AI CUDA Quickstart - Rootless/XDG-Compliant User Install
# Copyright (C) 2025 Qompass AI, All rights reserved
###############################################################
set -e
SCRIPT_PATH="$0"
while [ -h "$SCRIPT_PATH" ]; do
	DIR="$(cd -P "$(dirname "$SCRIPT_PATH")" >/dev/null 2>&1 && pwd)"
	SCRIPT_PATH="$(readlink "$SCRIPT_PATH")"
	[ "${SCRIPT_PATH#/}" = "$SCRIPT_PATH" ] && SCRIPT_PATH="$DIR/$SCRIPT_PATH"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SCRIPT_PATH")" >/dev/null 2>&1 && pwd)"
cd "$SCRIPT_DIR"
CUDA_VERSION="12.8.1"
CUDA_RUNFILE="cuda_12.8.1_570.124.06_linux.run"
detect_platform() {
	case "$(uname -s | tr A-Z a-z)" in
	linux*) PLATFORM=linux ;;
	darwin*) PLATFORM=macos ;;
	msys* | mingw* | cygwin*) PLATFORM=windows ;;
	android*) PLATFORM=android ;;
	*)
		echo "Unsupported platform"
		exit 1
		;;
	esac
}
detect_arch() {
	case "$(uname -m)" in
	x86_64) ARCH=x86_64 ;;
	aarch64 | arm64) ARCH=aarch64 ;;
	*)
		echo "Unsupported CPU architecture"
		exit 1
		;;
	esac
}
install_cuda_linux() {
	echo "Downloading CUDA $CUDA_VERSION runfile…"
	URL="https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION}/local_installers/${CUDA_RUNFILE}"
	INSTALL_BASE="$HOME/.local"
	INSTALL_DIR="$INSTALL_BASE/cuda-${CUDA_VERSION}"
	mkdir -p "$INSTALL_BASE"
	cd "$INSTALL_BASE"
	[ -f "$CUDA_RUNFILE" ] && rm -f "$CUDA_RUNFILE"
	if ! wget -q "$URL" -O "$CUDA_RUNFILE"; then
		echo "❌ Download failed: $URL"
		exit 1
	fi
	if ! head -1 "$CUDA_RUNFILE" | grep -q '#!'; then
		echo "❌ Downloaded file is not a valid installer; check URL or network."
		rm -f "$CUDA_RUNFILE"
		exit 1
	fi
	chmod +x "$CUDA_RUNFILE"
	echo "Extracting CUDA Toolkit (no root, toolkit only)…"
	./"$CUDA_RUNFILE" --silent --toolkit --toolkitpath="$INSTALL_DIR"
	rm "$CUDA_RUNFILE"
	echo "✅ CUDA Toolkit extracted to $INSTALL_DIR"
}
install_cuda_macos() {
	echo "CUDA for macOS is subject to device/driver support. Manual steps required."
	echo "See: https://developer.nvidia.com/cuda-downloads for the correct DMG or .pkg installer."
	echo "For rootless install: extract to \$HOME/.local/cuda-${CUDA_VERSION} and manually set PATH/DYLD_LIBRARY_PATH."
}
install_cuda_windows() {
	echo "For Windows rootless, use WSL or Git Bash. Download and run the CUDA installer:"
	echo "  --silent --toolkitpath=%LOCALAPPDATA%\\cuda-${CUDA_VERSION}"
	echo "See: https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/"
}
install_cuda_android() {
	echo "CUDA on Android/Termux is experimental."
	echo "See: https://github.com/zanton123/PixelCuda for community projects and approaches."
}
main() {
	case "$1" in
	"" | auto)
		detect_platform
		detect_arch
		echo "Installing CUDA $CUDA_VERSION for $PLATFORM/$ARCH (rootless, user-space)…"
		case "$PLATFORM" in
		linux) install_cuda_linux ;;
		macos) install_cuda_macos ;;
		windows) install_cuda_windows ;;
		android) install_cuda_android ;;
		esac
		;;
	linux)
		install_cuda_linux
		;;
	macos)
		install_cuda_macos
		;;
	windows)
		install_cuda_windows
		;;
	android)
		install_cuda_android
		;;
	*)
		echo "Usage: $0 [linux|macos|windows|android]"
		exit 1
		;;
	esac
	echo ""
	echo "🔗 Add these to your shell startup (e.g., .bashrc, .zshrc):"
	if [ "$PLATFORM" = "linux" ]; then
		CUDA_ROOT="$HOME/.local/cuda-${CUDA_VERSION}"
		echo "export CUDA_HOME=\"$CUDA_ROOT\""
		echo "export PATH=\"\$CUDA_HOME/bin:\$PATH\""
		echo "export LD_LIBRARY_PATH=\"\$CUDA_HOME/lib64:\$LD_LIBRARY_PATH\""
	elif [ "$PLATFORM" = "macos" ]; then
		CUDA_ROOT="\$HOME/.local/cuda-${CUDA_VERSION}"
		echo "export CUDA_HOME=\"$CUDA_ROOT\""
		echo "export PATH=\"\$CUDA_HOME/bin:\$PATH\""
		echo "export DYLD_LIBRARY_PATH=\"\$CUDA_HOME/lib:\$DYLD_LIBRARY_PATH\""
	elif [ "$PLATFORM" = "windows" ]; then
		echo "Set the PATH and CUDA_HOME in your user variables to the install dir (e.g., %LOCALAPPDATA%\\cuda-${CUDA_VERSION}\\bin)."
	fi
	echo ""
	echo "Check samples/ and docs in your CUDA install directory for verification."
	echo "For cuDNN or other libs, manually unpack them to \$CUDA_HOME."
	echo "For PyTorch/TensorFlow, set CUDA_HOME as above to pick up user-space CUDA."
	echo ""
	echo "✅ Done! Rootless CUDA toolkit is ready for your user-space workflows."
	exit 0
}
main "$@"
