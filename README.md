# Burp Suite Professional for Arch Linux (Community PKGBUILD)

This repository provides a community-maintained PKGBUILD to build and install Burp Suite Professional on Arch Linux. It is designed to integrate with your system seamlessly, providing a `.desktop` entry for application launchers and a command-line script.

**Current Burp Suite Version targeted by PKGBUILD:** `2025.4.2`

---

**⚠️ IMPORTANT: PLEASE READ CAREFULLY BEFORE PROCEEDING ⚠️**

## Disclaimer & Usage Terms

*   **Unofficial & Community-Maintained:** This PKGBUILD and the resulting Arch Linux package are **not** official, affiliated with, or endorsed by PortSwigger Ltd., the creators of Burp Suite.
*   **Loader Requirement & Licensing:**
    *   To unlock Professional features, this setup relies on a third-party `loader.jar` Java agent. **You must obtain `loader.jar` yourself.**
    *   Using `loader.jar` to activate Burp Suite Professional bypasses its intended licensing mechanism and constitutes a **violation of PortSwigger's End User License Agreement (EULA)**.
    *   This package and setup are intended for **educational, research, or personal evaluation purposes only**, particularly in scenarios where acquiring a full license might be prohibitive.
    *   **If you use Burp Suite Professional for commercial activities, production environments, or any form of professional work, you are ethically and legally obligated to purchase an official license from PortSwigger Ltd. to support their continued development.**
*   **Use at Your Own Risk:** You are solely responsible for any and all legal, ethical, or technical consequences arising from the use of this package and the associated loader. The maintainer of this PKGBUILD and repository assumes **no liability** whatsoever.
*   **Security of `loader.jar`:** The `loader.jar` is a third-party component. While this guide may refer to common sources, its security, integrity, and functionality **cannot be guaranteed** by the maintainer of this PKGBUILD. Always obtain software from trusted sources and understand the risks involved when using unofficial tools.

---

## Prerequisites

Before you begin, ensure you have the following:

1.  **An Arch Linux System:**
    *   `base-devel` package group installed (for `makepkg` and other build tools).
        ```bash
        sudo pacman -S --needed base-devel
        ```
    *   `git` installed (for cloning this repository).
        ```bash
        sudo pacman -S --needed git
        ```

2.  **Java Development Kit (JDK) - Version 21 or Newer:**
    Burp Suite Professional (recent versions) requires Java 21 or a more recent version to run.
    *   Install a suitable JDK (OpenJDK is recommended):
        ```bash
        sudo pacman -S jdk-openjdk 
        # Or specifically jdk21-openjdk if you prefer that version and it's available
        ```
    *   Set the newly installed JDK as the default for your system:
        ```bash
        sudo archlinux-java set <name_of_your_jdk21+_environment>
        # Example: sudo archlinux-java set java-21-openjdk
        # Check available environments with: archlinux-java status
        ```
    *   Verify your active Java version:
        ```bash
        java -version
        ```

3.  **`loader.jar` (The Key Agent):**
    *   **You must obtain this file yourself.** This PKGBUILD does **not** download it for you.
    *   A common source for such loaders is the **`BurpLoaderKeygen`** project by user `h3110w0r1d-y` on GitHub. You will need to search for this repository.
    *   Download the `loader.jar` from a trusted release or build it from source if you prefer.
    *   The `PKGBUILD` in this repository expects a `loader.jar` file with the following **SHA256 checksum**:
        ```
        dcdf28acf360554a5a98d78f403c96ccea500be24b27d02b020e142820637c0a
        ```
        You can verify the checksum of your downloaded file with: `sha256sum loader.jar`.
    *   **Crucial Step:** After downloading, **place the `loader.jar` file in the same directory where you clone this repository** (i.e., alongside the `PKGBUILD` file). `makepkg` will look for it there.

---

## Installation Guide

Follow these steps carefully to build and install Burp Suite Professional:

1.  **Clone This Repository:**
    Open your terminal and navigate to a directory where you want to download the build files. Then, clone this repository:
    ```bash
    git clone https://github.com/mikhailde/burpsuite-pro-archlinux.git
    cd burpsuite-pro-archlinux/ 
    ```

2.  **Place `loader.jar`:**
    As mentioned in the Prerequisites, ensure your downloaded `loader.jar` (matching the specified SHA256 sum) is now located in this cloned directory. The directory structure should look something like:
    ```
    .
    ├── PKGBUILD
    ├── burpsuite-professional.desktop
    ├── burpsuite-professional.install
    ├── burpsuite-professional.sh
    ├── burp_suite.ico
    ├── loader.jar  <-- YOUR DOWNLOADED LOADER HERE
    └── README.md
    ```

3.  **(Optional) Verify and Update `PKGBUILD`:**
    *   Open the `PKGBUILD` file.
    *   Ensure the `_burp_display_version` variable reflects the Burp Suite version you intend to install (the download URL fetches the latest, this is mostly for display).
    *   Double-check that the `sha256sums` entry for `loader.jar` matches the checksum of your file. If you are using a different (but trusted) `loader.jar`, you'll need to update this checksum in the `PKGBUILD` or `makepkg` will fail.

4.  **Build and Install the Package:**
    From within the cloned repository directory (where the `PKGBUILD` is), run:
    ```bash
    makepkg -si
    ```
    This command will:
    *   Download the latest official Burp Suite Professional JAR from PortSwigger.
    *   Verify the checksums of all source files (including your local `loader.jar`).
    *   Build the Arch Linux package (`.pkg.tar.zst`).
    *   Install the package onto your system using `pacman` (it will ask for your sudo password).
    *   Install any missing dependencies (like Java, if not already present).

5.  **Post-Installation & Activation:**
    *   After successful installation, the `.install` script will provide brief instructions.
    *   **First-time Activation (if Burp Suite prompts for a license):**
        1.  Launch the Key Generator/Loader:
            ```bash
            java -jar /opt/burpsuite-professional/loader.jar
            ```
        2.  Launch Burp Suite Professional:
            ```bash
            burpsuite-professional
            ```
            (Or find "Burp Suite Professional" in your application menu).
        3.  In Burp Suite, when prompted for a license, choose the **manual activation** option.
        4.  Copy the "license request" string from Burp Suite and paste it into the appropriate field in the `loader.jar` window.
        5.  The loader will generate a "license response". Copy this response.
        6.  Paste the "license response" back into Burp Suite's manual activation window.
        7.  Click "Next" or "Activate". Burp Suite Professional should now be activated.
    *   The loader acts as a Java agent, so Burp Suite needs to be launched via the provided `burpsuite-professional` script (or `.desktop` entry) for the loader to be active.

---

## Usage

*   **Launch from Application Menu:** Search for "Burp Suite Professional".
*   **Launch from Terminal:**
    ```bash
    burpsuite-professional
    ```
    You can pass command-line arguments to Burp Suite as well:
    ```bash
    burpsuite-professional --help
    burpsuite-professional --project-file=/path/to/project.burp --user-config-file=/path/to/config.json
    ```

---

## Updating the Package

When a new version of Burp Suite Professional is released, or if this PKGBUILD is updated:

1.  **Navigate to the Cloned Repository Directory:**
    ```bash
    cd burpsuite-pro-archlinux/
    ```

2.  **Pull Latest Changes from this Git Repository:**
    ```bash
    git pull origin main
    ```
    This will update the `PKGBUILD` and other helper scripts if they've changed.

3.  **Check `loader.jar`:**
    *   Ensure your `loader.jar` is still present in the directory.
    *   The `sha256sums` for `loader.jar` in the updated `PKGBUILD` might have changed if a new "standard" loader is recommended. Verify and update your `loader.jar` or the checksum if necessary.

4.  **Rebuild and Reinstall:**
    ```bash
    makepkg -si
    ```
    `pacman` will handle the upgrade process. Your existing Burp Suite settings should generally be preserved.

---

## Uninstallation

To remove the package from your system:
```bash
sudo pacman -Rns burpsuite-professional
```
The `-n` flag prevents `pacman` from saving configuration files (Burp Suite typically stores its user configs in `~/.BurpSuite` or `~/.java/.userPrefs/burp`, which this command won't touch). The `-s` flag removes unneeded dependencies.

---

## Troubleshooting

*   **`UnsupportedClassVersionError`:** You are using an older version of Java. Ensure Java 21+ is installed and set as default (see Prerequisites).
*   **`loader.jar` Checksum Mismatch:** The `sha256sum` of your `loader.jar` does not match the one in `PKGBUILD`. Either get the correct `loader.jar` or update the checksum in `PKGBUILD` (if you trust your `loader.jar`).
*   **Activation Issues:** Double-check the manual activation steps. Ensure the loader is running and you are copying/pasting the request/response keys correctly. Some loaders may have specific quirks.

---

*This PKGBUILD is provided in the hope that it will be useful, but WITHOUT ANY WARRANTY. Use responsibly.*
