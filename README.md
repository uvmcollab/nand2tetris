# Nand2Tetris Project Review

## Repository proposal

## Overview
This repository marks the beginning of a collaborative project to study and work through the book **"The Elements of Computing Systems"** by Noam Nisan and Shimon Schocken. The book, together with its accompanying course, guides readers in building a computer system from the ground up — from logic gates to a full operating system.

Our goal is to:
- Review the concepts presented in the book.
- Implement the exercises and projects step by step.
- Document our progress and insights as a team.

## Collaboration
The repository will be organized into branches, one for each participant.  
- Each participant will develop solutions to the exercises in their own branch.  
- We will use pull requests and code reviews to share, compare, and refine our work.  
- Collaboration will emphasize learning, experimentation, and constructive feedback.

## Resources
We will rely on:
- The official book: *The Elements of Computing Systems*  
- The authors’ website and course materials: [nand2tetris.org](https://www.nand2tetris.org/)  
- Additional references and tools provided by the course.

## Participants
This project is a joint effort by three collaborators, each contributing their perspective and solutions. Branches will be named accordingly to reflect individual contributions.

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/<your-org-or-user>/<repo-name>.git 

## Setup

From the root directory run the following:

### For `bash`

```bash
export GIT_ROOT="$(git rev-parse --show-toplevel)"
export TB_WORK="$GIT_ROOT/work/tb"
export TB_SCRIPTS="$GIT_ROOT/verification/directed/scripts"
mkdir -p "$TB_WORK" && cd "$TB_WORK"
ln -sf $TB_SCRIPTS/makefiles/Makefile.vcs Makefile
ln -sf $TB_SCRIPTS/setup/setup_synopsys_eda.tcsh
make
```

### For `tcsh`

```bash
setenv GIT_ROOT `git rev-parse --show-toplevel`
setenv TB_WORK $GIT_ROOT/work/tb
setenv TB_SCRIPTS $GIT_ROOT/verification/directed/scripts
mkdir -p $TB_WORK && cd $TB_WORK
ln -sf $TB_SCRIPTS/makefiles/Makefile.vcs Makefile
ln -sf $TB_SCRIPTS/setup/setup_synopsys_eda.sh
source setup_synopsys_eda.sh
make
```



