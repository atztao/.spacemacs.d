;;-----------------
;;This note some day to org agenda
;;-----------------
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)
(setq my-holidays '((holiday-fixed 2 14 "情人节") (holiday-fixed 9 10 "教师节") (holiday-fixed 5 12 "护士节") (holiday-float 6 0 3 "父亲节") (holiday-float 5 0 2 "母亲节")
                    (holiday-lunar 1 1 "春节" 0) (holiday-lunar 1 15 "元宵节" 0) (holiday-solar-term "清明" "清明节") (holiday-lunar 5 5 "端午节" 0) (holiday-lunar 7 7 "七夕情人节" 0) (holiday-lunar 8 15 "中秋节" 0)
                    (holiday-lunar 12 23 "妈妈生日" 0) (holiday-lunar 5 9 "爸爸生日" 0) (holiday-lunar 10 17 "姐夫生日" 0) (holiday-lunar 10 18 "姐姐生日" 0) (holiday-fixed 10 29 "宝宝生日") ))
(setq calendar-holidays my-holidays)
;;(holiday-lunar 9 17 "宝宝生日" 0)

(provide 'init-day)
