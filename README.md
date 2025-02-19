# Guide to the `pqbl` command-line interface (CLI)

> [!IMPORTANT]
> This guide assumes **macOS** as the operating system. 

> [!IMPORTANT]
> To use the CLI you need an OpenAI API key, which is used under the hood during generation. If you do not have a key, [sign up at OpenAIs developer platform](https://platform.openai.com/) and then follow the instructions to [create and export an API key](https://platform.openai.com/docs/quickstart).
>
> If you already have signed up and created a key, you can find it under the [API keys tab on the developer dashboard](https://platform.openai.com/api-keys).

## Table of Contents

> [!TIP]
> To get up and running, complete the [setup and installation](#setup) and then look at some [examples of how to use the CLI](#usage-examples).

- [Setup](#setup)
  - [1. Install `Node.js`](#1-install-nodejs)
  - [2. Clone This Repo](#2-clone-this-repo)
  - [3. Install the CLI](#3-install-the-cli)
  - [4. Set Environment Variables](#4-set-environvment-variables)
  - [5. Finishing Up](#5-finishing-up)
- [Usage Examples](#usage-examples)
  - [Generating Skillmap: `pqbl skillmap`](#generating-questions-pqbl-course)
  - [Generating Questions: `pqbl course`](#generating-questions-pqbl-course)
  - [Exporting to Torus: `pqbl digest`](#exporting-to-torus-pqbl-digest)
- [AI Input](#ai-input)
- [Uninstalling](#uninstalling)
  <!-- - About the Format
  - Preparing Generation
  - Generating a Skillmap
  - Exporting -->
<!-- - About This Repo -->

## Setup

### 1. Install `Node.js`

Node.js is a JavaScript runtime that the CLI uses under the hood.

You can download and install it from [the official `Node.js` website](https://nodejs.org/en/download/).

### 2. Clone This Repo

> [!TIP]
> For more details, see [GitHubs documentation on how to clone a repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository#cloning-a-repository).

To clone (download), begin by navigating to the local directory on your computer where you want the cloned repo to be stored. Then run this command in the terminal:

```bash
git clone git@github.com:pQBL/cli-onboarding.git
```

This should only take a few seconds.

> [!IMPORTANT]
> For cloning to work, you need to have an active SSH key added to GitHub.
> 
> An SSH key is a public-private pair of randomly generated strings, which GitHub uses as a security measure to make sure you are who you say you are.
>
> If you do not have an active SSH key, you first need to generate one. This can be done by following step 1-3 in [GitHubs guide to generating an SSH-key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key).
>
> When you have your SSH key, add the _**public**_ key (with filename ending in `.pub`) to GitHub on the [settings page for SSH keys](https://github.com/settings/keys).
>
> After this is done, you should be able to clone the repo.


### 3. Install the CLI

> [!IMPORTANT]
> When running the installation script, you will be prompted to enter you password.
>
> This is needed to make the script executable.

> [!NOTE]
> When installing the CLI, all commands are assumed to be run in the cloned repo.
> 
> Begin by navigating into the cloned repo.
> 
> If you just cloned the repo, and have not changed directory, run:
> 
> ```bash
> cd cli-onboarding
> ``` 
>
> Now you are ready to complete the rest of the installation.


To install the CLI, run:

```bash
./cli-install-macos.sh
```

The installation should only take about a minute.

Try to rune the following command to make sure everything works:

```bash
pqbl --version
```

This should print the version number.

### 4. Set Environvment Variables

> [!IMPORTANT]
> The CLI will not work without setting the variables.
> 
> For more information on getting an OpenAI API keys, see [the beginning of this README](#guide-to-the-pqbl-command-line-interface-cli).

> [!TIP]
> Here are guides on how to set the environment for different shells:
> - [`bash`](https://phoenixnap.com/kb/set-environment-variable-mac#Set_Permanent_Environment_Variable)
> - [`zsh`](https://phoenixnap.com/kb/zsh-environment-variables#How_to_Create_Permanent_Environment_Variables_in_ZSH)

These environment variables are used by the CLI and need to be set:

| Variable| Description|
|--|--|
| `PQBL_CLI_ROOT_DIR` |  Should point to the CLI directory that is downloaded when [running the CLI installation script](#3-install-the-cli). |
| `PQBL_OPENAI_KEY` | Your OpenAI API key (necessary for generating). |

### 5. Finishing Up

If you completed all the previous setup steps, **you are now ready to start using the CLI!**

Check out the [usage examples](#usage-examples) below to get started quickly.

You can also read about the [AI input](#ai-input) for more details.

## Usage Examples

> [!NOTE]
> The CLI uses `pqbl` as the main command, and then uses different _**subcommands**_ for different functionality.
> 
> These subcommands are specified in the examples.

> [!TIP]
> Here is a suggested course structure (a similar strucure is assumed in the examples):
> 
> ```bash
> .
> ├── ai-input
> │   ├── course-description.txt
> │   ├── course-material-processed
> │   └── course-unit-list.txt
> ├── course
> │   ├── info.json # ← Needs to be added manually in v0.0.2 of the CLI
> │   ├── unit_01.json
> │   ├── unit_02.json
> │   ├── unit_03.json
> │   ├── unit_04.json
> │   └── unit_05.json
> └── skillmap
>     ├── unit_01.json
>     ├── unit_02.json
>     ├── unit_03.json
>     ├── unit_04.json
>     └── unit_05.json
> ```

### Generating Skillmap

**Subcommand:** `skillmap`

**Input:**
- Learning materials
- Skillmap storage path
- Course description
- Units file (optional using `-u` flag, but recommended)

**Example:**

```bash
pqbl skillmap ai-input/course-material-processed . ai-input/course-description.txt -u ai-input/course-unit-list.txt
```

> [!NOTE]
> The dot (`.`) adds the generated files to the current directory. Use a path to an **_existing_** folder if you want to change it.

### Generating Questions

**Subcommand:** `course`

**Input:**
- Skillmap directory
- Storage path for questions (use `.` to store in current directory)
- Course description

**Example:**

```bash
pqbl course skillmap/ . ai-input/course-description.txt
```

> [!NOTE]
> The dot (`.`) adds the generated files to the current directory. Use a path to an **_existing_** folder if you want to change it.

### Exporting to Torus

**Subcommand:** `digest`

**Input:**
- Course directory
- Storage path for questions

**Example:**
```bash
pqbl digest course .
```

> [!WARNING]
> In `v0.0.2` of the CLI you need to **add an `info.json` file to the directory given as the argument `<course_path>`**. This is the directory containing all the unit `.json` files.
> 
>Without the `info.json` file the `digest` subcommand will not work. 
> 
> It must contain a `title` and `description`.
> Use this as a template:
>
> ```json
> {
>   "title": "Course title here",
>   "description": "Course description here"
> }
> ```


> [!NOTE]
> The dot (`.`) adds the generated files to the current directory. Use a path to an **_existing_** folder if you want to change it.

> Torus supports importing course files, which it calls *ingesting* a course. There are two versions, use the newer version: [Ingest V2](https://dev.qblearning.eu/admin/ingest/upload).
> 
> To ingest a course you must provide a file called the *course digest* (or just *digest*). The digest is a ZIP file containing a bunch of JSON files in a specific format. More details can be found on the [Torus GitHub Wiki](https://github.com/Simon-Initiative/oli-torus/wiki/Course-Ingestion).

## AI Input

This section explains the _input format_ used for generation.

See the linked examples for how to actually generate.

### Learning Material

> [!NOTE] 
> All learning material must be contained in **a single directory with no subdirectories**.

**Generation step:** [skillmap](#generating-skillmap) only.

Files used by the AI to extract learning objectives.

They can be one of the following file types:

- `.pdf`
- `.docx`
- `.pptx`
- plain text: `.txt`, `.md`, etc.

### Course Description

**Generation step:** both [skillmap](#generating-skillmap) and [questions](#generating-questions).

A plain text file with relevant information about the course.

Used to give the AI a more detailed picture of the course content.

### Unit List

**Generation step:** both [skillmap](#generating-skillmap) and [questions](#generating-questions).

A plain text file containing a list of units.

Used to give the AI a structure of the course to generate on top of.

## Uninstalling

> [!NOTE]
> When uninstalling the CLI, all commands are assumed to be run in the cloned repo.
> 
> Begin by navigating into the cloned repo:
> 
> ```bash
> cd path/to/cli-onboarding
> ``` 
>
> Now you are ready to uninstall.

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

