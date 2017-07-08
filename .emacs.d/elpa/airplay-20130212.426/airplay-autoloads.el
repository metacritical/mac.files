;;; airplay-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "airplay" "airplay.el" (22880 55141 948850
;;;;;;  202000))
;;; Generated autoloads from airplay.el

(autoload 'airplay/image:view "airplay" "\


\(fn IMAGE_FILE &optional TRANSITION)" nil nil)

(autoload 'airplay:stop "airplay" "\


\(fn)" t nil)

(autoload 'airplay/video:play "airplay" "\


\(fn VIDEO_LOCATION)" nil nil)

(autoload 'airplay/video:scrub "airplay" "\
Retrieve the current playback position.

\(fn &optional CB)" nil nil)

(autoload 'airplay/video:seek "airplay" "\


\(fn POSITION)" nil nil)

(autoload 'airplay/video:info "airplay" "\


\(fn &optional CALLBACK)" nil nil)

(autoload 'airplay/video:pause "airplay" "\


\(fn)" t nil)

(autoload 'airplay/video:resume "airplay" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("airplay-pkg.el" "airplay-video-server.el")
;;;;;;  (22880 55141 946283 47000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; airplay-autoloads.el ends here
