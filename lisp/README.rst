========
 README
========

I'm trying to set up a more useful python environment, with features
that GUI/IDE users have -- code completion, finding function
definitions in source files, etc.

The big thing I'm struggling with is having it understand
virtualenvs. I've moved to `pyenv` to manage my python versions, and
our AVAIL project uses `virtualenvwrapper` for development environment
isolation.  How can we get (say) `avail_api` code to find definitions
in its virtualenv from the `avail` code and others?

Progress
========

Dammit, I saw pyvenv-workon suggest avail... and others, but now I'm
not seeing it. It completes nothing.

I need to take a break from this.

Tools
=====

Pip prerequisties
-----------------

pip install jedi        # static code analysis for autocomletion
pip install flake8
pip install importmagic
pip install autopep8    # can override line length on CLI
pip install yapf        # I don't think I want this, too destructive

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

May want `pungi`

flycheck
--------

M-x flycheck-verify-setup

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

After activating with pyvenv-workon, it can't find jedi, autopep8,
etc; looks like we need to pip install these into each venv :-(
This sucks because we'll need it in our requirements.txt and it'll get
forced on ALL devs.

Trying it in avail_pipeline currently gives::

  dyld: Library not loaded: @executable_path/../.Python
  Referenced from: /Users/chris/.virtualenvs/avail_pipeline/bin/python
  Reason: image not found

I expect this is because my `workon` environment still points to brew Python.

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
pip-requrements
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
