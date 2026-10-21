# Setting this up on a new machine

The repo holds inputs, results and notes only. The environment (pixi,
LocalColabFold, AlphaFold weights, PyMOL) is ~14 GB of machine-specific
binaries and is deliberately not tracked — rebuild it with the steps below.

Takes 30-60 min, mostly downloads.

## 1. Clone

    git clone https://github.com/Brzeska/MAP2_project.git
    cd MAP2_project

## 2. Install pixi into the project

Nothing is written to your home directory or shell profile.

    curl -fsSL https://pixi.sh/install.sh | PIXI_NO_PATH_UPDATE=1 sh

## 3. Install LocalColabFold

    git clone https://github.com/YoshitakaMo/localcolabfold.git

Then run the installer for your platform from inside `localcolabfold/`:

- **Linux + NVIDIA GPU:** `bash install_colabbatch_linux.sh`
- **Apple Silicon Mac:** `bash v1.5.5_old_installers/install_colabbatch_M1mac.sh`
- **Intel Mac:** `bash v1.5.5_old_installers/install_colabbatch_intelmac.sh`

Installed version on the Linux box: colabfold 1.6.3 / alphafold-colabfold 2.3.23.

## 4. Start a session

    source env.sh
    cd "$PROJ"

Needed in every new terminal. Puts `colabfold_batch` and `pymol` on PATH and
keeps caches and configs inside the project folder.

## 5. Check it works

    colabfold_batch inputs/jR2R3.fasta results/jR2R3_rerun

jR2R3 is short, so it finishes quickly. AlphaFold weights (~4 GB) download on
the first run only. From then on, see colabfold_workflow.txt for normal use.

## Mac caveat

No CUDA on macOS, so predictions run on CPU — minutes become hours, and the
log will not say "Running on GPU". Short peptides like jR2R3 are fine; the
441-residue full-length tau is not practical. Do long runs on the Linux box.

## Pushing from the Linux box

`env.sh` redirects `XDG_CONFIG_HOME` into the project, so the GitHub login
lives in `.config/gh/` (gitignored) rather than the home directory. Source
`env.sh` first and `git push` works normally in that shell.
