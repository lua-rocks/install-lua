# Lua installation guide

Here is a super simple step-by-step instruction to install the latest versions
of `lua` + `luajit` + `luarocks` on `linux` and use them together without
conflicts.

The main differences between this method and more complex scripts that allow you
to manage versions:

**<details><summary>📋 Spoiler </summary>**

- First at all this is not a lua version manager. Instead of switching between
  lua and luarocks, they are used simultaneously: `lua ...` or `luajit ...` to
  **run** and `luarocks --lua-version=5.4 ...` or `luarocks ...` to **install
  packages**. Installing multiple versions the same way is possible, but not
  recommended.
- So, the main priority is stability (conflict-free). Complex scripts most often
  installing different versions of lua but do not care about how they integrate
  with luarocks. This causes luarocks to install the wrong packages versions and
  leads to unpredictable errors.
- In order to achieve my goal, I had to adhere to the most standard standards!
  The libraries by default will be installed and searched only in
  `/usr/local/lib/lua/` or `/usr/local/share/lua/`. The installation is almost
  exactly the same as the recommended instructions on the official sites and my
  scripts doesn't touch the source files at all. Sudo is required, because the
  untouched lua installed locally doesn't know where to search local libraries.
- Luarocks itself works on luajit.

</details>

## 1. Install dependencies

This instruction is for Ubuntu but it should not be much different for other
distributions:

```sh
sudo apt install build-essential libreadline-dev unzip libssl-dev
```

Optionally (read below):

```sh
sudo apt install rlwrap
```

## 2. Download and unpack

- [lua](https://www.lua.org/versions.html)
- [luajit](https://luajit.org/download.html)
- [luarocks](https://github.com/luarocks/luarocks/wiki/Download)

## 3. Build and install

0. Update versions in the scripts to yours.
1. [install-lua.sh](install-lua.sh)
2. [install-luajit.sh](install-luajit.sh)
3. [install-luarocks.sh](install-luarocks.sh)
4. [install-core-packages.sh](install-core-packages.sh)

## 4. Check installation

Run commands: `luarocks` and `luarocks --lua-version=5.4`. You should see
something like this:

**<details><summary>📋 Spoiler </summary>**

```sh
Configuration:
   Lua:
      Version    : 5.1
      Interpreter: /usr/local/bin/luajit (ok)
      LUA_DIR    : /usr/local (ok)
      LUA_BINDIR : /usr/local/bin (ok)
      LUA_INCDIR : /usr/local/include/luajit-2.1 (ok)
      LUA_LIBDIR : /usr/local/lib (ok)

   Configuration files:
      System  : /usr/local/etc/luarocks/config-5.1.lua (ok)
      User    : disabled in this LuaRocks installation.
```

```sh
Configuration:
   Lua:
      Version    : 5.4
      Interpreter: /usr/local/bin/lua (ok)
      LUA_DIR    : /usr/local (ok)
      LUA_BINDIR : /usr/local/bin (ok)
      LUA_INCDIR : /usr/local/include (ok)
      LUA_LIBDIR : /usr/local/lib (ok)

   Configuration files:
      System  : /usr/local/etc/luarocks/config-5.4.lua (ok)
      User    : disabled in this LuaRocks installation.
```

</details>

If everything is `(ok)` then ok. 👌

## 5. Solve problems

There is a known issue: when you run `lua` or `luajit` in terminal and try to
use arrow keys, you will most likely see some gibberish, like this: `^[[D^[[C`.

To solve this problem run [wrap.sh](wrap.sh). If this problem doesn't bother
you, though, I don't recommend using this hack.

Another minor problem is that luajit's default paths are a bit retarded and if
you have an "init.lua" file in the directory "folder", you cannot require
"folder" from luajit, although everything works fine in lua.

Of course, you could tweak the configuration files and fix everything, but just
because you fix it doesn't mean that all other users will do the same. So the
best solution I see here is to add the
`package.path = "?/init.lua;" .. package.path` to your scripts.
