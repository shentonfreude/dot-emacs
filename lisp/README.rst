========
 README
========

I want a Python environment with features that GUI/IDE users have --
code completion, finding function definitions in source files, PDB
breakpoint setting, etc.

I've moved to `pyenv` and `pipenv` to manage my python versions an
virtualenvironments.

Progress
========

Real Python's post `Emacs - The Best Python Editor?
<https://realpython.com/emacs-the-best-python-editor/>`_ has been super
helpful.

* Elpy
* Jedi
* pyenv
* pipenv

Missing Features
================

* pdb mode with VSCode/PyCharm-like setting of breakpoints in code
  buffer; look at the `realgud` debugger which claims to have this,
  and more

Tools
=====

Pip/pipenv prerequisties
------------------------

pip install jedi        # static code analysis for autocomletion
pip install flake8
pip install importmagic


Emacs packages
--------------

I'm using MELPA and add to it:

* material-theme: I'm liking this better than the solarized variations
* ein: for IPython
* py-autopep8: formats code to conform to PEP8
* blacken: I might use this to fix old/bad python for a clean start,
  better than py-autopep8? it seems the new hotness

Some of these can have configurations, like specifying maximum line
length for PEP8-compliance.
TODO: indicate dot-files and config files for this, global and project-specific

Emacs Initialization
====================

packages
--------

Instructions from https://github.com/magit/magit#installation ::

  M-x package-list-packages
  M-x package-refresh-contents
  M-x package-install RET magit RET

init-0-package.el
-----------------

Must install before using them, with `use-package` or old style.
Starting to use `use-package` since lots of docs use this.

virtual environments
--------------------

TODO: add more

flycheck
--------

M-x flycheck-verify-setup

jedi
----

TODO: There's a way to get it to install or verify its environment

auto-complete/company
---------------------

Seem to do the same thing, pick one. With `company` use
`company-jedi`; with `auto-comlete` use `jedi`.

elpy
----

This looks promising, if it can understand virtualenvs with workon:

  Elpy minor mode (indicator Elpy):
  Minor mode in Python buffers for the Emacs Lisp Python Environment.
  This mode fully supports virtualenvs. Once you switch a
  virtualenv using M-x pyvenv-workon, you can use
  M-x elpy-rpc-restart to make the elpy Python process use your
  virtualenv.

After activating with pyvenv-workon, it can't find jedi, autopep8, etc; looks
like we need to pip install these into each venv :-( This sucks because we'll
need it in our requirements.txt/Pipfile and it'll get forced on ALL devs.

See what Elpy thinks of your virtualenvironment, etc, VERY useful:

  M-x elpy-enable

OMG, it's full of knobs -- tons of options.

Using pyenv in shell
--------------------

I had set the global with 3 versions with::

  pyenv global 3.6.3 3.4.7 2.7.14

which is helpful but Emacs `pyenv` gags::

  pyenv: version `3.6.33.4.72.7.14' is not installed (set by PYENV_VERSION environment variable)

That's a bug, but we'll work aroudn it by setting a single default::

  pyenv global 3.6.3

In avails/avail, avail_api, avail_imageresizer, avail_pipeline::

  pyenv local 3.4.7

Then remove the old .virtualenvs/... and `mkvirtualenv ...` the new ones
with the pyenv pythons.

This allows me to build within a terminal.

BUG: when using an Emacs shell, after setting "pyenv local 3.4.7", I
can't build::

  chris@pcp447770pcs:avail$ make develop
  virtualenv -p `which python3.4` $WORKON_HOME/avail
  Running virtualenv with interpreter /Users/chris/.pyenv/shims/python3.4
  pyenv: python3.4: command not found
  The `python3.4' command exists in these Python versions:
    3.4.7

  $ pyenv version
  3.6.3 (set by PYENV_VERSION environment variable)

That `PYENV_VERSION` is not set in my iTerm window. Using::

  unset PYENV_VERSION

allows Emacs shell to build ok.

I hack .bashrc and echo PYENV_VERSION multiple places and see it's set
even at the very beginning of the file. For now, config the file to
unset it at the top -- I have no idea where it's being set that Emacs
would get it in a shell whille bash would not.

Using Pyenv in emacs
--------------------

I believe elpy and our setup does this now:

  We can change python versions with pyenv-mode (in melpa) and
  automatically when there is a .python-version file with
  pyenv-mode-auto.

Once it's installed, we just have to switch with M-x pyenv-mode-set.

Projectile
----------

TBD might be useful

TODO
====

pylint
projectile
pycoverge.el -- highlight (un)covered code
yasnippet -- already installed? used for inserting pdb, copyright mostly
helm

$ pip install ipdb
py: import ipdb; ipdb.set_trace() # nicer debugging with ipython/jupyter

pdb track: pdbtrack, for nonemacs terminal pdbpp

sphinx-doc: insert/update docstrings for method's args

References
==========

Good HOWTO for setting up elpy and pyenv:
http://rakan.me/emacs/python-dev-with-emacs-and-pyenv/

Elpy for: refactoring (with rope), run unit tests, send region to python,
jump to definition; checks with flymake, completion with jedi/company,
code nav, change virtualenvs:
https://elpy.readthedocs.io/en/latest/index.html

Flymake, Flycheck...

Emacs Tools for Python:
http://wikemacs.org/wiki/Python

Jedi docs (see get-in-function-call and show-doc):
https://jedi.readthedocs.io/en/latest/
