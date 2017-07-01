(setq org-publish-project-alist
      '(("selfdotsend"
         :base-directory "~/Development/metacritical.github.io/articles/org"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "~/Development/metacritical.github.io/pages"
         :publishing-function (org-html-publish-to-html)
         :recursive t          ; descend into sub-folders?
         :section-numbers nil  ; don't create numbered sections
         :with-toc nil         ; don't create a table of contents
         :with-latex t         ; do use MathJax for awesome formulas!
         :html-head-extra ""   ; extra <head> entries go here
         :html-preamble ""     ; this stuff is put before your post
         :html-postamble ""    ; this stuff is put after your post
         :auto-sitemap t
         :sitemap-filename "archive.org"
         :sitemap-title "Archive"
         :sitemap-sort-files anti-chronologically
         :sitemap-style list
         :makeindex t
)))
