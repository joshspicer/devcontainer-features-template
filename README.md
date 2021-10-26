# Devcontainer Features Template

To create your own remote [devcontainer features](#), use this repo as a template.  This repo contains one "feature" called `helloworld`.


## Release Flow

Push a tag to your repo, which will trigger the [deploy-features workflow](https://github.com/joshspicer/devcontainer-features-template/blob/main/.github/workflows/deploy-features.yml).

Assets will be compressed and added as a release artifact with the name `features.tgz`. 

The latest set can be directly downloaded with a URI like:

`https://github.com/USER/PROJECT/releases/latest/download/features.tgz`

Download from a previous tag (eg: `v0.0.1`) like so:

`https://github.com/USER/PROJECT/releases/v0.0.1/download/features.tgz`


## Include feature in your project's devcontainer 

To include your feature in a project's devcontainer, provide the following `feature` like so.

```jsonc
features: {
    "<PUBLISHER>/<REPO>/helloworld": {
        greeting: "Hello!"
    }
}
```

- Where PUBLISHER is the repo owner (for this template, `joshspicer`).
- Where REPO is the repo name (for this template, `devcontainer-features-template`)

Providing no version implies the latest release's artifacts.  To supply a tag as a version, use the following notation.

```jsonc
features: {
    "<PUBLISHER>/<REPO>/helloworld@v0.0.1": {
        greeting: "Hello!"
    }
}
```
