# GHC toolchain that enables compilation of fully statically linked linux binaries

All real work was done by fpcomplete: [static-compilation-with-stack](https://www.fpcomplete.com/blog/2016/10/static-compilation-with-stack)
This repo has a Dockerfile and some wrapper scripts around it.

```bash
export PATH=$PATH:/path/to/docker-haskell-platform-alpine

cd /my/project
docker-haskell-build-linux-static
```

Generated files end up under `$HOME/.alpine/local/bin`.
