# devcontainers-features

This repository contains a collection of devcontainer features related to smart-contract programming

## Example Usages

This repository contains at the moment a _collection_ of two Features - `foundry` and `slither`. TEach sub-section below shows a sample `devcontainer.json` alongside example usage of the Feature.

### `foundry`

Install foundry framework, with an optional specific version.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/astrodevs-labs/devcontainers-features/foundry:1": {
            /* Non mandatory option */
            "commit": "43b4e23252b00a871923fb0acff3550519af0e68"
        }
    }
}
```

```bash
$ forge -v

forge X.X.X (xxxxxx ...)
```

### `slither`

Install slither static analyzer

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/astrodevs-labs/devcontainers-features/slither:1": {}
    }
}
```

```bash
$ slither --version

X.X.X
```

## Repo and Feature Structure

Similar to the [`devcontainers/features`](https://github.com/devcontainers/features) repo, this repository has a `src` folder.  Each Feature has its own sub-folder, containing at least a `devcontainer-feature.json` and an entrypoint script `install.sh`. 

```
├── src
│   ├── foundry
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
│   ├── slither
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
...
```

An [implementing tool](https://containers.dev/supporting#tools) will composite [the documented dev container properties](https://containers.dev/implementors/features/#devcontainer-feature-json-properties) from the feature's `devcontainer-feature.json` file, and execute in the `install.sh` entrypoint script in the container during build time.  