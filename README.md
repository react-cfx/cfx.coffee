# cfx.coffee

## deno

* deno

```bash
export DENO_INSTALL="/root/.deno" 
export PATH="$DENO_INSTALL/bin:$PATH"
```

* drake

** fish

```fish
function drake
  deno run -A Drakefile.ts $argv
end
```

```bash
alias drake='_a(){ deno run -A Drakefile.ts $@;};_a $1'
```
