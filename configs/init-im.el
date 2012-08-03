(defvar bitlbee-password "Art11")

(defun will-be-social ()
  "Connect to IM networks using bitlbee."
  (interactive)
  (erc :server "localhost" :port 6667 :nick "artart"))
