# chromebuf

> chromebuf lets you jump bewteen buffers like chrome does with tabs cmd+# on OSX or ctrl+# on others

## Installation

### Vundle
1. in your vimrc: `Bundle 'dciccale/vim-chromebuf.git'`
2. run `:BundleInstall` in vim
3. for updating the plugin run `:BundleUpdate` in vim

### Pathogen
1. cd ~/.vim/bundle
2. git clone git://github.com/dciccale/vim-chromebuf.git
3. for updating the plugin run:

```bash
$ cd ~/.vim/bundle/vim-chromebuf.vim
$ git pull
```

## Usage

`:BufJump(1)` jumps to buffer index 1 (use numbers up to 9)

### Options

Default mappings are `<d-#>` on OSX and `<c-#>` on other OSs

Define your own mappings

```vim
let g:chromebuf_default_mappings = 0

nmap <s-1> :call BufJump(1)<cr>
nmap <s-2> :call BufJump(2)<cr>
nmap <s-3> :call BufJump(3)<cr>
nmap <s-4> :call BufJump(4)<cr>
nmap <s-5> :call BufJump(5)<cr>
nmap <s-6> :call BufJump(6)<cr>
nmap <s-7> :call BufJump(7)<cr>
nmap <s-8> :call BufJump(8)<cr>
nmap <s-9> :call BufJump(9)<cr>
```

### Help

`:help chromebuf`

## License
http://denis.mit-license.org/
