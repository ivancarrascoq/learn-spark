# README.md

## Description

This repository contains scripts to build and run a Docker container for a Jupyter Notebook with PySpark. The scripts automate the process of building the Docker image, running the container, connecting to it, and cleaning up afterward. Your work within the Jupyter Notebook will be saved locally, even after the container is removed.

## Prerequisites

- **Docker Desktop** installed and running.
- Permissions to execute scripts.
- A `data` directory with write permissions in the same directory as the `Dockerfile`.

## Usage Instructions

### For Unix/Linux/macOS Users

1. **Navigate to the repository directory:**

   ```bash
   cd path/to/your/repository
   ```

2. **Ensure the script has execution permissions:**

   ```bash
   chmod +x run_docker.sh
   ```

3. **Run the script:**

   ```bash
   ./run_docker.sh
   ```

4. **Access Jupyter Notebook:**

   - Open your web browser and go to: [http://localhost:8887](http://localhost:8887)
   - Create a new Jupyter Notebook or open an existing one.
   - All your work will be saved in the `data` directory of your local repository.

5. **After Working:**

   - Save your work within the Jupyter Notebook.
   - Return to the terminal where the script is running.
   - Type `exit` to leave the container's bash shell.

6. **Automatic Cleanup:**

   - After exiting, the script will automatically remove the Docker container and image.
   - This helps save disk space without losing any of your work.

### For Windows Users

1. **Open PowerShell as Administrator.**

2. **Navigate to the repository directory:**

   ```powershell
   cd path\to\your\repository
   ```

3. **Set the execution policy if necessary:**

   ```powershell
   Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
   ```

   - When prompted, type `Y` to confirm.

4. **Run the script:**

   ```powershell
   .\run_docker.ps1
   ```

5. **Access Jupyter Notebook:**

   - Open your web browser and go to: [http://localhost:8887](http://localhost:8887)
   - Create a new Jupyter Notebook or open an existing one.
   - All your work will be saved in the `data` directory of your local repository.

6. **After Working:**

   - Save your work within the Jupyter Notebook.
   - Return to the PowerShell window where the script is running.
   - Type `exit` to leave the container's bash shell.

7. **Automatic Cleanup:**

   - After exiting, the script will automatically remove the Docker container and image.
   - This helps save disk space without losing any of your work.

## How It Works

- **Persistent Data Storage:**
  - The `data` directory in your repository is mounted into the Docker container at `/home/jovyan/work`.
  - Any notebooks or files you create or modify are saved in this directory.
  - Even after the container is removed, your work remains in the `data` directory on your local machine.

- **Automatic Cleanup:**
  - The scripts are designed to clean up the Docker environment after you're done.
  - This prevents unused containers and images from consuming disk space.
  - You can modify the scripts if you prefer to keep the container and image for future use.

- **Reusability:**
  - Since your work is saved locally, you won't lose any projects you've saved in Jupyter Notebook.
  - You can rerun the script anytime to recreate the environment and continue working.

## Notes

- **Script Location:** Run the scripts in the same directory where the `Dockerfile` is located.
- **Data Directory:** Ensure the `data` folder exists and has the appropriate permissions.
- **Customization:**
  - Feel free to tweak the scripts if you want to retain the container or image after exiting.
  - You can adjust the port number or Docker image name by modifying the variables in the scripts.
- **Execution Policy:** You may reset your PowerShell execution policy to its original state after running the script.

## Troubleshooting

- **Docker Issues:** Ensure Docker Desktop is installed and running properly.
- **Permissions:** Make sure you have the necessary permissions to execute scripts and access directories.
- **Script Execution Errors:** If you encounter execution policy errors in PowerShell, you can bypass them by running:

  ```powershell
  powershell -ExecutionPolicy Bypass -File .\run_docker.ps1
  ```

- **Port Conflicts:** If port `8887` is already in use, you can change it by modifying the `PORT` variable in the scripts and updating the URL accordingly.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to reach out if you have any questions or need further assistance!