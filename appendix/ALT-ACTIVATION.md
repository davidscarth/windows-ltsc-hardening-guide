# Alternative Activation Procedure: Microsoft Activation Scripts (MAS)

**Audience:** This document is intended for users in non-production, lab, or testing environments who require an alternative method for OS activation.

**Source:** The scripts are maintained in the [massgravel/Microsoft-Activation-Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts) repository on GitHub.

## Procedure
1. **Download the Scripts:**
   * On a machine with internet access, navigate to the official GitHub repository.

   * Download the latest release ZIP file (click Code > Download ZIP).

   * Transfer the ZIP file to the target machine via a USB drive.

2. **Extract the Files:**
   * Extract the contents of the ZIP file to a folder on the target machine (e.g., `C:\Temp\MAS`).

3. **Execute the Script:**
   * Open an **Administrator Command Prompt** (`cmd.exe`).

   * Navigate to the directory where you extracted the files. Specifically, enter the `All-In-One-Version` sub-folder.

     ```
     cd C:\Temp\MAS\All-In-One-Version
     ```

   * Run the main script file:

     ```
     MAS_AIO.cmd
     ```

4. **Select Activation Method:**

   A menu will appear in the command prompt window. Select the activation option by entering the corresponding number and pressing `Enter`. The script will perform the activation process. Follow any on-screen prompts.
   * **HWID (Digital License):**
        * *Best for:* **Online** machines.
        * *Requirement:* **Must have active Internet connection.**
        * *Result:* Permanently activates the machine with a digital license tied to the hardware ID. Survives re-installs.
    * **TSforge:**
        * *Best for:* **Offline / Air-Gapped** machines.
        * *Requirement:* No internet required.
        * *Result:* Permanently activates Windows offline.

6. **Verification:**
   * Once the script completes, you can verify the activation status in `Settings -> Update & Security -> Activation`. It should show that Windows is activated with a digital license.
