;;; trac-wiki

(autoload 'trac-wiki "trac-wiki" "Trac wiki editing entry-point." t)
(autoload 'trac-wiki-define-project "trac-wiki" "Trac wiki editing entry-point." t)
;; 2010-11-03 trying "newest" versions I can find of trac-wiki and xml-rpc
(trac-wiki-define-project "trac-hacks"
                          "http://trac-hacks.org/" t)
(trac-wiki-define-project "schwa"
                          "https://stacr.hq.nasa.gov/trac/schwa/" t)

