==================
 README dot-emacs
==================

Motivation
==========

I've been hating having to re-create my Emacs environment on each new
machine I use -- especially with the advent of cheap disposable
virtual machines.  So it's about time I made my emacs settings and
environment accessible to all my various computers.  I've used
~/.emacs and ~/elisp/* for aeons, but all the kool kids these days are
using ~/.emacs.d/*, which has the advantage of having emacs look for
init.el in that dir.  This makes it a snap to store my settings and
.el files in one dir which can be checked into a repo like GitHub.
Done.

It's far from perfect, and as the plaintive whinging in the screed
below hints, I've got a long way to go before I achieve nirvana.

Python
======

I do mostly Python these days.  PyFlakes and flymake are a huge win
here (though [cough] sometimes it hangs hard and I have to kill Emacs,
thus losing all the buffers, shells, and inferior pythons I've been
working on).

I'd love to have some sexy autocomplete like the Java
IDE guys have.

  I don't think there's a built-in way [in Emacs] to make a
  "drag-word-left", but it would be easy to write a short function to do
  it. The corresponding Eclipse plug-in would be 5,000 lines of code in
  60 source files and would take nine days to write and debug.
  -- http://opal.cabochon.com/~stevey/blog-rants/effective-emacs.html

Of course it should be language-aware, and needs to know about my
current virtualenv environment and all the libraries I'm using via
buildout et al.  It can't be that hard, right?

  Emacs outshines all other editing software in approximately the same way
  that the noonday sun does the stars.  It is not just bigger and brighter;
  it simply makes everything else vanish.
  -- Neal Stephenson: author of Cryptonomicon, Diamond Age, Snow Crash, etc

Autocomplete
------------

The auto-complete suite looks big and powerful and very clever; it
even seems to learn.

Just as useful in non-Python environments. Just TAB to complete a
suggestion.



Yasnippets
----------

Yasnippets seems very helpful for including common hunks of code (it
must really save the Java guys some serious RSI pain).  It's easy to
add snippets, like for inserting the standard PDB invocation.  I could
see it being really handy for common Pyramid/Colander schemas and CRUD
handling patterns.

Like auto-complete, it works in non-Python environments, and it too
wants TAB for completion... let's fight!

python.el vs python-model.el
----------------------------

python.el is now part of Emacs, tho python-mode.el predates it.  My
biggest hangup with the latter is that I can not figure a way to spawn
an inferior Python (e.g., to eval a buffer function) with the Python
of my choice -- a Python I've installed, or a virtualenv's Python; it
always uses the system's Python, which is frequently ancient, and
never has the libraries I need.

So I'm staying with built-in python.el for the while.  Clues welcomed.

Virtualenv
----------

There are three variants of virtualenv.el out there, but all three
assume you use Doug Hellman's virtualenvwrapper.  I rarely use that,
instead creating virtualenv right in the dir of the project I'm
working on.

I did find a couple other simple ones which might do the trick, I'm
just starting with those so nothing conclusive to report yet.

ipython
-------

At one point, I was able to coerce Emacs to do completion from within
an ipython shell of my virtual environment -- including the massive
set of libraries within my Plone project.  Oh bliss -- a huge win for
introspecting absurdly complicated structures.

Except that my kluged setup was in a shell, which Emacs desperately
wanted to autocomplete with normal shell things, like filenames.  When
it worked, it was brilliant but I kept having to shift in and out of
zope's python shell and bash shell.

There's probably a better way to do it.  Cobblers' sons' shoes and all
that.

Ropemacs, Pymacs, etc
---------------------

EnigmaCurry and others have combined Ropemacs, Pymacs, autocomplete,
lions and tigers and bears, oh my! With this arsenal, they appear to
be able to do auto-completion of python entities including namespaced
packages from within their working environment.  Oh, baby, I gotta get
me some of that.

In the past when I've tried, tentatively, I still couldn't get it to
use my local virtualenv's python and its libraries, making the utility
more futile than utile.   I need to try this again.

Gnus
====

Back when Usenet existed, I depended on Emacs with Gnus to quickly
read -- or rather, dispense with -- the huge volume of static that is
Usenet News.  To filter the noise and find the technical tidbits (and
beer recipes) I was looking for.

For the same reason, Gnus is exceptionally useful for plowing through
mountains of email, old and new, read and undeleted, zombies and more.

Sadly, its IMAP support wasn't as spunky and its search was a bit
weak.  But I put up with it because I truly hate grope-n-poke gooey
candy-coated interfaces for something so noise/data-intensive.

Then I got a Mac. And it had Mail.app.  Built in.  It's IMAP and
search were excellent.  But I absolutely abhor not being able to do
sophisticated editing within it, pulling code and stuff I'm working
on. For crissakes, it still can't even wrap text like
gods-own-teletype should. WTF?

I hear the Gnus folks have revamped it, and maybe I'll give it a shot
again.  GUIs just suck for this and if I read mail on my FreeBSD or
Lunix machines, I don't want whatever Gnome mail monstrosity is
fashionable... or at least I don't want to have to learn a new
mouse-clicky UI.

Git
===

"Get off my lawn!"  After having started with SCCS, RCS, P4, and SVN,
I'm slowly being dragged into the DVCS world.  Git seems to be winning
the hearts and minds. And GitHub's pretty nice.  Gitx is a huge triumph
over Git's amazingly cruel and Byzantine command structure.  Magit
gives me lots of Gitx-like features without having to wake up my
mouse, great stuff, especially for someone like me who's still
suffering from Git culture shock.

Trac-wiki
=========

Another huge win for the grope-n-poke averse. Or do you actually
*like* editing nontrivial amounts of text in a f'ing web textarea?
You poor bastard.

The key bindings almost make Trac's wiki syntax tolerable.  But I'd
prefer RST.

RST-mode
========

Yeah, there's an app for that.  Or at least an Emacs mode.

Another huge win.  Especially if you're writing Sphinx docs.
