;;; dictionary-app.el --- Search item to OSX Dictionary.app

;; Copyright © 2012 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>

;; Author: Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
;; Keywords: emacs, 
;; Created: 2012-08-14
;; Last changed: 2012-08-14 19:52:11
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; 


;;; Code:

(defun dictionary-app-search (&optional term)
  "Search for TERM in OSX Dictionary.app.

If TERM is nil, try in order terms in the region, then
`word-at-point'."
  (interactive)
  (let ((term
	 (cond
	  (term term)
	  ((region-active-p) (buffer-substring-no-properties (mark) (point)))
	  ((word-at-point) (substring-no-properties (word-at-point))))))
    (when term
      (shell-command (format "open 'dict://%s'" (url-hexify-string term))))))



(provide 'dictionary-app)

;; dictionary-app.el ends here
