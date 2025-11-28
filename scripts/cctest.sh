#!/bin/sh
# /qompassai/cuda/scripts/tests/cctest.sh
# Qompass AI Cuda Compiler Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
OS="$(uname | tr 'A-Z' 'a-z')"
ARCH="$(uname -m)"
case "$OS" in
msys* | cygwin* | mingw*) IS_WINDOWS=1 ;;
*) IS_WINDOWS=0 ;;
esac
XDG_BIN="${XDG_DATA_HOME:-$HOME/.local/share}/bin"
LOCAL_BIN="$HOME/.local/bin"
WIN_LOCAL_BIN="${LOCALAPPDATA:-$HOME/AppData/Local}/Programs/bin"
ANDROID_BIN="$HOME/.local/bin"
check_dir() {
    DIR="$1"
    DESC="$2"
    if [ -d "$DIR" ]; then
        echo "✓ Found $DESC at: $DIR"
        ls "$DIR"
    else
        echo "✗ $DESC NOT found at: $DIR"
    fi
}
if [ "$IS_WINDOWS" -eq 0 ] && [ "$OS" != "android" ]; then
    check_dir "$XDG_BIN" "XDG user bin directory"
    check_dir "$LOCAL_BIN" "User local bin directory"
fi
if [ "$IS_WINDOWS" -eq 1 ]; then
    check_dir "$WIN_LOCAL_BIN" "User Programs bin directory"
fi
if [ "$OS" = "android" ]; then
    check_dir "$ANDROID_BIN" "Android user bin directory"
fi
if [ -n "$NVCOMPILERS" ] && [ -x "$NVCOMPILERS/bin/nvc" ]; then
    CC="$NVCOMPILERS/bin/nvc -noswitcherror"
    CXX="$NVCOMPILERS/bin/nvc++ -noswitcherror"
    FC="$NVCOMPILERS/bin/nvfortran -noswitcherror"
    ZIG_CC="$NVCOMPILERS/bin/nvc -noswitcherror"
    ZIG_CXX="$NVCOMPILERS/bin/nvc++ -noswitcherror"
else
    CC="gcc"
    CXX="g++"
    FC="gfortran"
    ZIG_CC="gcc"
    ZIG_CXX="g++"
fi
if command -v sccache >/dev/null 2>&1; then
    case "$IS_WINDOWS" in
    1) : ;;
    *)
        CC="sccache $CC"
        CXX="sccache $CXX"
        FC="sccache $FC"
        ;;
    esac
fi
HOME_DIR="${HOME:-$USERPROFILE}"
export ZIG_GLOBAL_CACHE_DIR="${XDG_CACHE_HOME:-$HOME_DIR/.cache}/zig"
export ZIG_LOCAL_CACHE_DIR=".zig-cache"
export CC CXX FC
export ZIG_CC ZIG_CXX
export CUDA_TEST_PLATFORM="$OS"
export CUDA_TEST_ARCH="$ARCH"
echo "CUDA compiler env summary:"
echo "  Platform: $OS"
echo "  Arch:     $ARCH"
echo "  CC:       $CC"
echo "  CXX:      $CXX"
echo "  FC:       $FC"
echo "  ZIG_CC:   $ZIG_CC"
echo "  ZIG_CXX:  $ZIG_CXX"
echo "  Zig Cache: $ZIG_GLOBAL_CACHE_DIR"
if [ "$IS_WINDOWS" -eq 1 ] && [ -n "$COMSPEC" ] && echo "$SHELL" | grep -iq "cmd"; then
    echo "For Windows (cmd), check: %LOCALAPPDATA%\\Programs\\bin"
    echo "Batch script check example:"
    echo 'if exist "%LOCALAPPDATA%\\Programs\\bin\\" echo User Programs bin directory found'
fi
