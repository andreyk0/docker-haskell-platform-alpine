[static-compilation-with-stack](https://www.fpcomplete.com/blog/2016/10/static-compilation-with-stack)

```bash
stack --allow-different-user install --test --ghc-options '-optl-static -fPIC -optc-Os'
upx --best --ultra-brute /path/to/app
```
