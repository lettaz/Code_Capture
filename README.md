# Capture Project

This project contains a script to capture all files and their contents from a specified directory, excluding certain files or directories specified in an ignore list. The captured contents are written to a single output file.

## Why This Project?

When working on complex projects, it's often necessary to share the entire codebase with others, especially when seeking help or feedback from colleagues, mentors, or online communities. Copying and pasting the content of each file manually is not only tedious and time-consuming but also prone to errors. This process becomes even more cumbersome when dealing with large projects that contain numerous files and directories.

Moreover, when trying to get assistance from language models (LLMs) like OpenAI's GPT, it's essential to provide a complete and accurate context of the project. Manually consolidating the content of all files into a single input can be overwhelming and inefficient.

### How This Script Helps

This script automates the process of capturing the content of all files in a project directory. By running the script, you can:

- Automatically read and compile the content of all files within your project directory, with ability to copy only specific files or files from a directory.
- Exclude specific files or directories (like `node_modules`, build directories, or log files) using an ignore list.
- Generate a single, comprehensive output file (`captured_code.txt`) that contains the content of all relevant files in your project.

This output file can be easily shared with others or input into an LLM, providing a complete and accurate picture of your project. This automation not only saves time but also ensures consistency and completeness, making it easier to get the help you need.


## Project Structure

```
capture-project/
├── example_result.txt
├── ignore_list.txt
├── README.md
└── capture_files.sh
```

- `example_result.txt`: Example output of the script.
- `ignore_list.txt`: List of files and directories to ignore.
- `README.md`: Project documentation.
- `capture_files.sh`: Shell script to capture files and their contents.

## Usage

### Step 1: Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/capture-project.git
cd capture-project
```

### Step 2: Copy Script and Ignore List to Your Project

Copy `capture_files.sh` and `ignore_list.txt` from this repository to the root directory of your project.

```bash
cp capture_files.sh /path/to/your/project/
cp ignore_list.txt /path/to/your/project/
```

### Step 3: Modify the Ignore List

Navigate to your project directory and update the `ignore_list.txt` file with the patterns of files and directories you want to ignore.

```bash
cd /path/to/your/project/
nano ignore_list.txt
```

Add patterns to the `ignore_list.txt`, for example:

```
node_modules
.env
dist
*.log
```

### Step 4: Run the Script

Make the script executable and run it:

```bash
chmod +x capture_files.sh
./capture_files.sh
```

### Step 5: View the Output

The captured contents will be written to `captured_code.txt` in your project directory. You can open this file to view the combined contents of all captured files.

## Example Result

An example result is provided in `example_result.txt` to show what the output looks like.

### Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### License

This project is licensed under the MIT License.
