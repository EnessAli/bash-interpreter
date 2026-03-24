# Bash Interpreter

A POSIX-compliant Unix shell built from scratch in C, supporting command execution, pipes, redirections, heredoc, environment variables, and signal handling — closely mirroring Bash behavior.

## Features

### Execution
- Command resolution via `PATH` traversal
- Absolute and relative path execution
- Exit status propagation (`$?`)

### Built-in Commands
| Command | Description |
|---------|-------------|
| `echo` | Print with `-n` flag support |
| `cd` | Change directory with `~` and `-` |
| `pwd` | Print working directory |
| `export` | Set/display environment variables |
| `unset` | Remove environment variable |
| `env` | Display environment |
| `exit` | Exit with status code |

### Redirections & Pipes
- `>` output redirect, `>>` append
- `<` input redirect
- `<<` heredoc with delimiter
- `|` pipeline with proper process chaining

### Quoting & Expansion
- Single quotes: literal string
- Double quotes: variable expansion inside
- `$VAR` and `${VAR}` expansion
- `$?` last exit status

### Signal Handling
- `Ctrl+C` → new prompt (SIGINT)
- `Ctrl+D` → clean exit (EOF)
- `Ctrl+\` → ignored (SIGQUIT)

## Build & Run

```bash
make
./minishell

minishell$ echo "Hello, $USER!"
Hello, yourname!
minishell$ ls -la | grep .c | wc -l
42
```

## Architecture

```
lexer → tokenizer → parser (AST) → expander → executor
                                                ├── builtin handler
                                                ├── pipe manager
                                                └── redirect handler
```

## Tech Stack

`C` `Readline` `POSIX` `Fork/Exec` `Pipe` `Signal Handling` `AST`

