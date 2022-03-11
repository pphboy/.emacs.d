
(setq foo "the real setq of foo")

foo

(defvar foo "Did i have the value ?"
	"the foo maybe cant be usage")

foo

(defvar value "i can show the real value"
	"the value not need to change")

value


(defun circle-area (radix)
  "get the area of circle radix"
	(let ((pi 3.14) area))
	(setq area (* pi radix radix))
	(message "直径为 %.2f 的圆面积是 %.2f " radix area)
  )

(circle-area 10)



