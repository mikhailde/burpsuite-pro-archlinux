# Burp Suite Professional for Arch Linux (Community PKGBUILD)

This repository provides a community-maintained PKGBUILD to build and install Burp Suite Professional on Arch Linux. This setup enables access to the full feature set of the Professional edition.

**Current Burp Suite Version targeted by PKGBUILD:** `2025.4.2`

---

**⚠️ IMPORTANT CONSIDERATIONS & DISCLAIMER – PLEASE READ CAREFULLY ⚠️**

*   **Community Maintained, Not Official:** This PKGBUILD and the resulting Arch Linux package are community-maintained. They are **not** official, affiliated with, or endorsed by PortSwigger Ltd., the creators of Burp Suite.
*   **Licensing and Activation Component:**
    *   To enable all Professional features, this setup utilizes a third-party Java agent (referred to as `loader.jar`). **You must obtain this `loader.jar` component yourself.**
    *   The use of such a component to activate Burp Suite Professional bypasses its standard licensing mechanism. This action is **not in compliance with PortSwigger's End User License Agreement (EULA)**.
    *   This package and method are intended for **educational, research, or personal evaluation purposes only**, especially in situations where obtaining a full commercial license may not be immediately feasible.
    *   **For any commercial, production, or professional use of Burp Suite Professional, purchasing an official license from PortSwigger Ltd. is the correct and ethical approach to support their valuable work.**
*   **Your Responsibility:** You are solely responsible for understanding and adhering to all applicable software licenses and for any consequences arising from your use of this package and the method described. The maintainer of this PKGBUILD and repository assumes **no liability**.
*   **Third-Party Component Security:** The `loader.jar` is a third-party component. Its security, integrity, and functionality are not guaranteed by the maintainer of this PKGBUILD. Obtain it from sources you trust and understand the inherent risks.

---

## Prerequisites

Before you begin, ensure your system meets the following requirements:

1.  **Arch Linux System:**
    *   `base-devel` package group installed.
        ```bash
        sudo pacman -S --needed base-devel
        ```
    *   `git` installed.
        ```bash
        sudo pacman -S --needed git
        ```

2.  **Java Development Kit (JDK) - Version 21 or Newer:**
    *   Install a suitable JDK:
        ```bash
        sudo pacman -S jdk-openjdk
        ```
    *   Set it as the default:
        ```bash
        sudo archlinux-java set <name_of_your_jdk21+_environment>
        # Example: sudo archlinux-java set java-21-openjdk
        ```
    *   Verify: `java -version`

3.  **`loader.jar` (Activation Agent):**
    *   **This component must be obtained by you separately.**
    *   A common source for such components is the `BurpLoaderKeygen` project by user `h3110w0r1d-y` on GitHub (search for it).
    *   The `PKGBUILD` expects a `loader.jar` with the SHA256 checksum:
        ```
        dcdf28acf360554a5a98d78f403c96ccea500be24b27d02b020e142820637c0a
        ```
        Verify with: `sha256sum loader.jar`.
    *   **Place the `loader.jar` file in the same directory where you clone this repository** (alongside `PKGBUILD`).

---

## Installation Guide

1.  **Clone This Repository:**
    ```bash
    git clone https://github.com/mikhailde/burpsuite-pro-archlinux.git
    cd burpsuite-pro-archlinux/ 
    ```

2.  **Place `loader.jar`:**
    Ensure your `loader.jar` (matching the specified SHA256 sum) is in the current directory.

3.  **(Optional) Review `PKGBUILD`:**
    *   Check `_burp_display_version`.
    *   Confirm `sha256sums` for `loader.jar`.

4.  **Build and Install:**
    ```bash
    makepkg -si
    ```
    This will download Burp Suite, verify files, build the package, and install it.

5.  **Post-Installation & Activation:**
    *   The `.install` script will provide brief guidance after installation.
    *   **Activation (if prompted by Burp Suite):**
        1.  Launch the `loader.jar` agent:
            ```bash
            java -jar /opt/burpsuite-professional/loader.jar
            ```
        2.  Launch Burp Suite Professional:
            ```bash
            burpsuite-professional
            ```
            (Or from your application menu).
        3.  In Burp Suite, choose **manual activation**.
        4.  Copy the "license request" from Burp Suite to the loader.
        5.  Copy the generated "license response" from the loader back to Burp Suite.
        6.  Complete activation in Burp Suite.
    *   Burp Suite must be launched via the `burpsuite-professional` script/desktop entry for the agent to be active.

---

## Usage

*   **Application Menu:** "Burp Suite Professional".
*   **Terminal:**
    ```bash
    burpsuite-professional [arguments]
    ```

---

## Updating the Package

1.  `cd burpsuite-pro-archlinux/`
2.  `git pull origin main`
3.  Verify `loader.jar` and its checksum in the updated `PKGBUILD`.
4.  `makepkg -si`

---

## Uninstallation

```bash
sudo pacman -Rns burpsuite-professional
```

---

## Troubleshooting

*   **`UnsupportedClassVersionError`:** Ensure Java 21+ is default.
*   **`loader.jar` Checksum Mismatch:** Get `loader.jar` matching PKGBUILD's sum or update sum if you trust your file.
*   **Activation Issues:** Double-check manual activation steps; ensure loader is running.

---

*This PKGBUILD is provided by the community. Please use software responsibly and respect licensing terms.*
