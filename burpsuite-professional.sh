#!/bin/bash

INSTALL_DIR="__INSTALL_DIR__"
PKG_NAME="__PKG_NAME__"

BURP_JAR="${INSTALL_DIR}/burpsuite_pro.jar"
LOADER_JAR="${INSTALL_DIR}/loader.jar"

# Check if essential files exist
if [ ! -f "${BURP_JAR}" ]; then
    echo "Error (${PKG_NAME}): Burp Suite JAR not found at ${BURP_JAR}" >&2
    echo "The package might be corrupted. Please try reinstalling." >&2
    exit 1
fi
if [ ! -f "${LOADER_JAR}" ]; then
    echo "Error (${PKG_NAME}): Loader JAR not found at ${LOADER_JAR}" >&2
    echo "The package might be corrupted. Please try reinstalling." >&2
    exit 1
fi

JAVA_CMD="java"
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA_CMD="$JAVA_HOME/bin/java"
elif ! command -v java &> /dev/null; then
    echo "Error (${PKG_NAME}): Java command not found." >&2
    echo "Please install Java (e.g., 'jdk-openjdk' version 21 or newer) and ensure it's in your PATH," >&2
    echo "or set JAVA_HOME, then use 'archlinux-java' to set the default version." >&2
    exit 1
fi

JAVA_OPTS=(
    "--add-opens=java.desktop/javax.swing=ALL-UNNAMED"
    "--add-opens=java.base/java.lang=ALL-UNNAMED"
    "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED"
    "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED"
    "--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED"
    "-Dfile.encoding=utf-8"
    "-javaagent:${LOADER_JAR}"
    "-noverify"
    "-jar"
    "${BURP_JAR}"
)

exec "${JAVA_CMD}" "${JAVA_OPTS[@]}" "$@"
