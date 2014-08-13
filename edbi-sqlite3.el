(require 'edbi)

;;;###autoload
(defun edbi-sqlite3 (filename)
  "Open sqlite3 files with `edbi'."
  (interactive (list (read-file-name "SQLite3: ")))
  (let* ((uri (format "dbi:SQLite:dbname=%s" (file-truename filename)))
         (data-source (edbi:data-source uri nil nil))
         (conn (edbi:start)))
    (edbi:connect conn data-source)
    (edbi:dbview-open conn)))
