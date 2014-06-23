;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(if (string-match "abc" "abe")
	"good"
  "bad")

(substring "abcdefghijk" 1)

(with-temp-buffer 
  (insert "abcdefg")
  (buffer-substring 1 3))

(string "a" "b")

(apply #'string (reverse (string-to-list "abcd")))

(with-temp-buffer
  (insert "abcdefg")
  (goto-char (point-min))
  (while (not (= (char-after) ?b))
	(forward-char))
  (point))


(setq test-str "abcdefg  ")
(when (string-match "[ \t]*$" test-str)
  (message (concat "[" (replace-match "" nil nil test-str) "]")))


(mapconcat 'identity '("" "home" "alex " "elisp" "erc") "/")

(delete-region (region-beginning) (region-end))
(current-word)

(point
 )

(buffer-substring
 (region-beginning) (region-end))

(defun get-line-str ()
  (interactive)
  (let* ((p (point))
		(begin p)
		(end   p))
	(while (not (= (char-before) ?\n))
	  (backward-char))
	(setq begin (point))
	(goto-char p)
	(while (not (= (char-after) ?\n))
	  (forward-char))
	(setq end (point))
	(goto-char p)
	(buffer-substring-no-properties begin end)))

(split-string "int main(int argc, char *argv[])" "[(),]" t)
(split-string "char *argv[123]" "[]\s*[]" t)
(list '(1 2 3) '(4 5 6))

(defun f-elem ()
  (let ((fstring (get-line-str)))
	(let ((fres nil))
	  (mapcar (lambda (x) 
				(push (split-string x "[]\s*[]" t) fres))
			  (split-string fstring "[(),]" t))
	  (reverse fres))))

(defun print-f-elem ()
  (interactive)
  (let ((fres (f-elem)))
	(print fres)
	(dolist (elem fres)
	  (insert (elt elem 1)))))


int main(int argc, char *argv[])

(setq fres nil)
(push '(1 2 3) fres)
(push '(4 5 6) fres)

(print '(1 2 3))
(not (equal nil '(1 2 3)))
(listp (cons (cons '(2 3 4) ()) '(5 6 7)))
(list '(1 2 3))
(insert
123
456789
abcd
ad
bd
cd
constituent
()
