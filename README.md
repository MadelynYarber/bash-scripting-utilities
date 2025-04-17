# Bash Scripting Utilities

This repository contains a complete suite of Bash scripting projects that demonstrate a variety of system-level tools, file utilities, and user-interactive scripts. Built as part of coursework and independent practice, these scripts showcase command-line automation, input handling, file processing, and reporting tasks in Unix/Linux environments.

---

## Project Categories

### System Tools (`system_tools/`)
| Script | Description |
|--------|-------------|
| `log_analyzer.sh` | Analyzes log files for keyword frequency and common IPs. |
| `user_report.sh` | Reports usernames, home directories, and login history. |
| `database_interaction.sh` | Prompts and displays mock SQL interaction for practice. |
| `generate_report.sh` | Parses log or data files and outputs a formatted report. |
| `process_data.sh` | Uses `awk` to calculate sums and averages from `.csv` files. |

---

### File Utilities (`file_utilities/`)
| Script | Description |
|--------|-------------|
| `file_manager.sh` | Copies `.txt` files to backup directory and logs results. |
| `data_cleanup.sh` | Removes empty lines and trims unnecessary whitespace. |
| `word_counter.sh` | Counts lines and words in a selected file. |
| `yarber.sh` | Extracts unique words from a file and writes them alphabetically to another file. |

---

### Backup Tools (`backup_tools/`)
| Script | Description |
|--------|-------------|
| `backup_restore.sh` | Creates and restores `.tar.gz` backups of a directory. |
| `data_backup_restore.sh` | Variation of the above with additional prompts. |

---

### User Interaction (`user_interaction/`)
| Script | Description |
|--------|-------------|
| `calculator.sh` | Performs basic arithmetic from user input. |
| `user_info.sh` | Collects name/age and reports voting eligibility. |

---

## Skills Demonstrated

- Shell scripting fundamentals
- Input validation & user prompts
- File handling and logging
- Text parsing using `awk`, `grep`, `wc`
- Log and data reporting
- Backup/restore automation
- Intro to CLI-database style prompts

---

## How to Run

```bash
chmod +x scriptname.sh
./scriptname.sh
