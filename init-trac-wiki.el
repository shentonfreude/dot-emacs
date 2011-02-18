;;; trac-wiki

(autoload 'trac-wiki "trac-wiki" "Trac wiki editing entry-point." t)
(autoload 'trac-wiki-define-project "trac-wiki" "Trac wiki editing entry-point." t)
;; 2010-11-03 trying "newest" versions I can find of trac-wiki and xml-rpc
(trac-wiki-define-project "trac-hacks"
                          "http://trac-hacks.org/" t)
(trac-wiki-define-project "schwa"
                          "https://stacr.hq.nasa.gov/trac/schwa/" t)

;;; Trac Emacs: trac-wiki.el 1.8, xml-rpc.el 1.6.4

;;(autoload 'trac-wiki "trac-wiki" "Trac wiki editing entry-point." t)
;;(autoload 'trac-wiki-define-project "trac-wiki" "Trac wiki editing entry-point." t)
(trac-wiki-define-project "trac-hacks"	"http://trac-hacks.org/" t)
(trac-wiki-define-project "schwa"	"https://stacr.hq.nasa.gov/trac/schwa/")
(trac-wiki-define-project "partfiniti"	"https://koansys.com/trac/partfiniti")
(trac-wiki-define-project "croi"	"https://koansys.com/trac/croi")
(trac-wiki-define-project "wmg"		"https://koansys.com/trac/wmg")
(trac-wiki-define-project "koansys"	"https://koansys.com/trac/koansys")
(trac-wiki-define-project "pcg"		"https://koansys.com/trac/pcg")


