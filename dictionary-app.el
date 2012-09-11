;;; dictionary-app.el --- Search item to OSX Dictionary.app

;; Copyright © 2012 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>

;; Author: Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
;; Keywords: emacs, 
;; Created: 2012-08-14
;; Last changed: 2012-09-11 16:56:33
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; 


;;; Code:

(eval-when-compile
  (require 'thingatpt)
  (require 'url-util))

;;;###autoload
(defun dictionary-app-search (&optional term)
  "Search for TERM in OSX Dictionary.app.

If TERM is nil, try in order terms in the region, then
`word-at-point' finally read from minibuffer."
  (interactive)
  (let ((term
	 (cond
	  (term term)
	  ((region-active-p) (buffer-substring-no-properties (mark) (point)))
	  ((word-at-point) (substring-no-properties (word-at-point)))
	  (t (read-from-minibuffer "Look up for: ")))))
    (when term
      (shell-command (format "open 'dict://%s'" (url-hexify-string term))))))



(provide 'dictionary-app)

;; dictionary-app.el ends here
