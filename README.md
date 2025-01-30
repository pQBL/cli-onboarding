# Guide to the `pqbl` CLI

> [!NOTE]
> This guide assumes you are on macOS. If not, you may have to adapt certain steps to fit your operating system.
>
> You may also have to give the installation/uninstallation scripts premission to execute when used for the first time. Do this with the following command (with the correct script name):
>
> ```bash
> chmod +x script-name.sh
> ```

The CLI is built with:

- [Node.js](https://nodejs.org/en) - a JavaScript (JS) runtime, making JS available outside the browser.
- [TypeScript](https://www.typescriptlang.org/) (TS) - a superset of Javascript with static typing, compiled to pure JS.

For more info when using the CLI, run:

```bash
pqbl help
```

# Setup

To install the CLI you first need the Node Package Manager (`npm`), which handles package installation and dependencies.

You can install `npm` [here](https://nodejs.org/en/download/).

These environment variables also need to be set:

| Variable| Description|
|--|--|
| `PQBL_CLI_ROOT_DIR` |  Should point to the CLI directory cloned from GitHub. |
| `PQBL_OPENAI_KEY` | Your OpenAI API key (necessary for generating). |

> [!WARNING]
> The CLI will not work without setting the variables.

# Installation

After `npm` is installed, run the CLI install scrip:

```bash
./cli-install-macos.sh
```

Then, print the CLI version to make sure it installed correctly:

```bash
pqbl --version
```

This should print the version number.

## Uninstalling

Run the CLI uninstall script:

```bash
./cli-uninstall-macos.sh
```

Then, print the CLI version:

```bash
pqbl --version
```

This should give an error that `pqbl` can not be found.

If it does, the CLI was successfully uninstalled.

## AI Input

This section explaines the _input format_ used for generation.

For details on how to actually generate, see the description for each generation step.

### Learning Material

**Generation step:** skillmap only.

Files used by the AI to extract learning objectives.

They can be one of the following file types:

- `.pdf`
- `.docx`
- `.pptx`
- plain text: `.txt`, `.md`, etc.

All learning material must be contained in **a single directory with no subdirectories**.

### Course Description

**Generation step:** both skillmap and questions.

A plain text file with relevant information about the course.

Used to give the AI a more detailed picture of the course content.

### Unit List

**Generation step:** both skillmap and questions.

A plain text file containing a list of units.

Used to give the AI a structure of the course to generate on top of.

## Generating Skillmap

### Command

```bash
pqbl skillmap
```

### Input

- Learning materials
- Skillmap storage path (use `.` to store in current directory)
- Course description
- Units file (optional using `-u` flag, but strongly recommended)

### Example

```bash
pqbl skillmap ai-input/course-material-processed . ai-input/course-description.txt -u ai-input/course-unit-list.txt
```

> This is the assumed directory structure:
>
> ```bash
> .
> └── ai-input
>     ├── course-description.txt
>     ├── course-material-processed
>     └── course-unit-list.txt
> ```

## Generating Questions

### Command

```bash
pqbl course
```

### Input

- Skillmap directory
- Storage path for questions (use `.` to store in current directory)
- Course description
<!-- - Units file (optional using `-u` flag, but strongly recommended) -->

### Example

```bash
pqbl course skillmap . ai-input/course-description.txt
```

> This is the assumed directory structure:
>
> ```bash
> .
> ├── ai-input
> │   ├── course-description.txt
> │   └── ...
> └── skillmap
>     ├── unit_01.json
>     ├── unit_02.json
>     ├── unit_03.json
>     ├── unit_04.json
>     └── unit_05.json
> ```

## Importing Into Torus Development

> [!NOTE]
> In `v0.0.2` of the CLI you need to add an `info.json` file to the course directory before creating the digest. It must contain a `title` and `description`.
> Use this as a template:
>
> ```json
> {
>   "title": "Course title here",
>   "description": "Course description here"
> }
> ```

Torus supports importing course files, which it calls *ingesting* a course. There are two versions, use the newer version: [Ingest V2](https://dev.qblearning.eu/admin/ingest/upload).

To ingest a course you must provide a file called the *course digest* (or just *digest*). The digest is a ZIP file containing a bunch of JSON files in a specific format. More details can be found on the [Torus GitHub Wiki](https://github.com/Simon-Initiative/oli-torus/wiki/Course-Ingestion).

### Command

```bash
pqbl digest
```

### Input

- Course directory
- Storage path for questions (use `.` to store in current directory)

### Example

```bash
pqbl digest course .
```

> This is the assumed directory structure:
>
> ```bash
> .
> ├── ai-input
> │   └── ...
> ├── course
> │   ├── info.json # Needs to be added manually in v0.0.2
> │   ├── unit_01.json
> │   ├── unit_02.json
> │   ├── unit_03.json
> │   ├── unit_04.json
> │   └── unit_05.json
> └── skillmap
>     └── ...
> ```
