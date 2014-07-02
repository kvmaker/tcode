(defvar *db* nil)

(setq *db* ())

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd) (push cd *db*))

(defun init ()
  (progn
    (add-record (make-cd "Roses" "Kathy Mattea" 7 t))
    (add-record (make-cd "Fly" "Dixie Chicks" 8 t))
    (add-record (make-cd "Home" "Dixie Chicks" 9 t))
    ))

(defun save-db (filename)
  (with-temp-buffer
    (print *db* (current-buffer))
    (write-file filename))
  (message "Saving database...done")
  )

(defun load-db (filename)
  (with-temp-buffer
    (insert-file-contents filename)
        (setq *db* (read (current-buffer)))))

(defun dump-db ()
  (dolist (cd *db*)
    (print cd)))

(provide 'db)
