## TODOs ##

### Compliant with windows-NT system ###

#### Tricky problem remained with cygwin on windows system ####
+ environment varible "HTTP_PROXY" does not work well, this lead to the using of *text translator* not working well.

#### Current work-around ####
+ launch the emacs program from cygwin  
```shell
nohup emacs &
```


## Extends compilation ##

### python for emacs ###

#### install and config ####
- check if pymacs can work
  make check EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs PYTHON=/usr/bin/python
- install pymacs for python part  
  ```shell
  sudo make install
  ```
  after the compile, you can excute "from Pymacs import lisp" in python session and receive no error.
- install rope ( a refactor tool)  
  ```shell
  sudo python setup.rb install
  ```
- install ropemacs  
  ```shell
  sudo python setup.rb install
  ```

#### usage ####
- auto complete
  need to add auto_complete.el to load path first.
  use TAB to auto complete the code
- C-c d
  show docs
- C-c C-c
  excute the current file
- C-c !
  open a python shell
  

### java dev ###
#### jdee install ####
- prerequisite
  - ecb 2.40
  - cedet 1.1
  - jdee 2.4.0.1
- problem
  - cedet 1.1 is not compatible well with ecb 2.40 and jdee 2.4.0.1. And here comes a solution:
  <http://blog.jeoygin.org/2012/06/emacs24-cedet-ecb-jdee.html>
  - auto complete not work on Mac OS, error of can not find the tools.jar. And solution for it is:
  <https://github.com/shyamalprasad/jdee/commit/51604758af9fc9984618260953f02dc7d6a325c1>
  


### AucTex ###
#### Mac OS ####
- prerequisite
  - tex live 2012

- install
  - version 11.87, latex-preview has problem with 11.86.
  - compile
  
  ```shell
  ./configure --with-emacs=/Applications/Emacs.app/Contents/MacOS/Emacs --with-lispdir=/Applications/Emacs.app/Contents/Resources/site-lisp --with-texmf-dir=/usr/local/texlive/texmf-local
  ```
  
  ```shell
  make
  ```
  
  ```shell
  sudo make install
  ```

#### Ubuntu ####
- install
  - compile  
  ```shell
  ./configure --with-emacs=/usr/local/bin/emacs --with-lispdir=/usr/local/share/emacs/24.2/lisp
  ```
  
  ```shell
  make
  ```
  
  ```shell
  sudo make install 
  ```
