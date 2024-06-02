#import "../conf.typ": *

= Производная Фурье и свёртка в пространствах $L_1(RR)$ и $L_2(RR)$
== Определения и основные свойства. Формула умножения. Преобразование Фурье свёртки.
#definition[
  Пусть $f in L_1(RR)$. Тогда *преобразованием Фурье* функции $f$ называется
  функция, заданная следующим образом:
  #eq[
    $hat(f)(y) = F[f](y) := integral_RR f(x)e^(-i x y)dif mu(x)$
  ]
]

#proposition[
  Преобразование Фурье отображает функции из $L_1(RR)$ в $B(RR)$ -- множество
  ограниченных функций.
]

#proof[
  #eq[
    $abs(F[f](y)) <= integral_RR abs(f(x))dot 1 dif mu(x) = norm(f)_L_1 => norm(F[f])_L_oo <= norm(f)_L_1$
  ]
]

#proposition[
  Преобразование Фурье отображает функции из $L_1(RR)$ в $C_0(RR)$ -- множество
  непрерывных функций, стремящеся к нулю на бесконечности.
]

#proof[
  Рассмотрим преобразование Фурье индикатора отрезка:
  #eq[
    $hat(II_[a,b])(y) = (e^(-i a y) - e^(-i b y)) / (i y) in C_0(RR)$
  ]
  А как мы знаем, любая функция из $L_1(RR)$ приближается ступенчатыми.

  Значит преобразование Фурье любой ступенчатой функции лежит в $C_0(RR)$. Более
  того, $F$ -- непрерывный оператор, и поэтому образы будут равеномерно сходится.
]

#proposition(
  "Формула умножения",
)[
  Пусть $f, g in L_1(RR)$. Тогда
  #eq[
    $integral_RR f(y)hat(g)(y) dif mu(y) = integral_RR hat(f)(y)g(y) dif mu(y)$
  ]
]

#note[
  Для применения теоремы Фубини (о перестановке интегралов), мы должны доказать,
  что хотя бы один из повторных интегралов конечен.
]

#proof[
  Распишем преобразование Фурье по определению:
  #eq[
    $abs(integral_RR f(y)hat(g)(y) dif mu(y)) &<= integral.double_(RR times RR) abs(f(y)g(x)e^(- i x y))dif mu(x) dif mu(y) = \ integral.double_(RR times RR) abs(f(y)g(x))dif mu(x) dif mu(y) &<= norm(g)_L_1 integral_RR abs(f(y)) dif mu(y) <= norm(f)_L_1norm(g)_L_1 < +oo$
  ]
]

#definition[
  Пусть $f, g in L_1(RR)$. Тогда *свёрткой функций* $f$ и $g$ называется функция:
  #eq[
    $(f * g)(x) = integral_RR f(y)f(x - y)dif mu(y)$
  ]
]

#proposition[
  Свёртка функций $f, g in L_1(RR)$ тоже лежит в пространстве $L_1(RR)$.
]

#proof[
  Докажем, что ограничен интеграл от модуля свёртки:
  #eq[
    $integral.double_(RR times RR) abs(f(y)g(x - y))dif mu(y) dif mu(x) &attach(=, t: "Фубини") integral.double_(RR times RR) abs(f(y)g(x - y))dif mu(x) dif mu(y) = \
    integral_RR abs(f(y))integral_RR abs(g(x - y)) dif mu(x) dif mu(y) &= integral_RR abs(f(y))integral_RR abs(g(x - y)) dif mu(x - y) dif mu(y) = \
    integral_RR abs(f(y)) dif mu(y) integral_RR abs(g(t)) dif mu(t)    &= norm(f)_L_1norm(g)_L_1 < +oo$
  ]
]

#proposition("Преобразование Фурье свёртки")[
  Пусть $f, g in L_1(RR)$. Тогда верна формула:
  #eq[
    $hat(f * g) = hat(f)dot hat(g)$
  ]
]

#proof[
  Распишем преобразование Фурье от свёртки:
  #eq[
    $hat(f * g)(y) = integral_RR (f * g)(x) e^(-i x y) dif mu(x) = integral.double_(RR times RR) f(xi)g(x - xi)e^(-i x y) dif mu(xi) dif mu(x)$
  ]
  Выше мы уже доказали, что свёртка "хороших" функций лежит в $L_1(RR)$, а значит
  мы можем применить теорему Фубини. Итак:
  #eq[
    $hat(f * g)(y) = integral_RR f(xi)integral_RR g(x - xi) e^(- i x y) dif mu(x) dif mu(xi) attach(=, t: 1 = e^(i xi y)e^(- i xi y)) \
    integral_RR f(xi) e^(-i xi y) integral_RR g(x - xi) e^(-i(x - xi) y) dif mu(x - xi) dif mu(xi) = hat(f)(y)dot hat(g)(y)$
  ]
]

#definition[
  *Пространством Шварца* $S subset L_1(RR) sect L_2(RR)$ называется множество
  бесконечно дифференцируеых функций, которые вместе со всеми своими производными
  убывают на бесконечности быстрее любой степени:
  #eq[
    $S = {f in C^oo(RR) | forall n in NN union {0}, m in NN : space lim_(x -> oo) x^m f^((n))(x) = 0 }$
  ]
]

#proposition[
  Если $f in L_1(RR)$ и $forall p in NN : x^p f(x) in L_1(RR)$, то преобразование
  фурье $g = F[f]$ дифференцируемо бесконечное число раз на $RR$.
]

#proof[
  Функции пространства Шварца можно описать эквивалентным образом:
  #eq[
    $forall f in S : exists C_(n,m) in RR_+ : space forall x in RR : abs(x^m f^((n))(x)) <= C_(n,m)$
  ]
  Покажем, что из этого факта следует $x^p f(x) in L_1(RR)$ при любом $p in NN$.
  Действительно, можно написать следующее:
  #eq[
    $forall m in NN : exists C_(0, m + 2) in R_+ : space forall x in RR : abs(x^m f(x)) <= C_(0, m + 2) / x^2$
  ]
  Отсюда тривиальным образом получаем абсолютную интегрируемость. Стало быть,
  преобразование Фурье $g = F[f]$ обладает всеми производными.

  Чтобы доказать, что они тоже являются функциями из пространства Шварца,
  воспользуемся следующим равенством:
  #eq[
    $(i y)^q g^((m))(y) = (-i)^q F[(x^m f(x))^((q))](y)$
  ]
  Из непрерывности преобразования Фурье, требуемое установлено.
]

#proposition[
  Преобразование Фурье на $S$ обладает следующими свойствами:
  + $F : S -> S$ -- биекция
  + $F : S -> S$ -- изометрия
  + $F^4 = I$ (Более того, $F^2[f](x) = f(-x)$)
]

#proof[
  + Достаточно показать, что для любой $g in S$ найдётся прообраз по преобразованию
    Фурье. Посмотрим на образ:
    #eq[
      $f^*(x) = 1 / sqrt(2 pi) integral_RR g(y) e^(- i y x) dif mu(y)$
    ]
    Положим $f(x) = f^*(-x)$. Из уже доказанного, $f^* in S$, а значит и $f in S$.
    Осталось произвести замену переменной:
    #eq[
      $g(y) = 1 / sqrt(2 pi) integral_RR f^*(x)e^(i x y) = integral_RR f(x)e^(- i x y) dif mu(x) = F[f](y)$
    ]
  + Распишем скалярное произведение с использованием формулы обращения (без
    доказательства):
    #eq[
      $(f, g) = integral_RR f(x)overline(g(x)) dif mu(x) = integral_RR f(x) overline(1 / sqrt(2 pi) integral_RR hat(g)(y) e^(i x y) dif mu (y)) dif mu(x) = \
      1 / sqrt(2 pi) integral.double_(RR times RR) f(x)overline(hat(g)(y))e^(-i x y)dif mu(x)dif mu(y) = integral_RR overline(hat(g)(y)) 1 / sqrt(2 pi) integral_RR f(x) e^(-i x y) dif mu(x) dif mu(y) = (hat(f), hat(g))$
    ]
  + Заметим, что
    #eq[
      $F[f](y) = F^(-1)[f](-y)$
    ]
    Так как преобразование Фурье биективно, можно применить его к полученному
    равенству и получить требуемое.
]

#note[
  Замыкание $S$ -- это пространство $L_2(RR)$.
]

#proposition[
  Преобразование Фурье продолжается на $L_2(RR)$. Более того, $F[L_2(RR)] subset.eq L_2(RR)$
]

#proof[
  Как известно из предыдущего семестра, линейный ограниченный оператор,
  определённый на линейном многообразии, продолжается на его замыкание с
  сохранением нормы. Именно это тут и происходит.
]

== Операторы Гильберта-Шмидта
#definition[
  *Оператором Гильберта-Шмидта* называется частный случай оператора Фредгольма в $L_2[a, b]$:
  #eq[
    $(A f)(x) = integral_a^b K(x, t) f(t) dif mu(t), quad K in L_2([a, b]^2) $
  ]
]

#proposition[
  Оператор Гильберта-Шмидта отображает в $L_2[a,b]$
]

#proof[
  Раз $K in L_2([a, b]^2)$, то как функция по одному из своих аргументов, она тоже
  будет из $L_2[a, b]$:
  #eq[
    $abs((A f)(x))^2 = abs(integral_a^b K(x, t)f(t) dif mu(t))^2 = abs((K(k, t), f(t)))^2 attach(<=, t: "КБШ") norm(f)^2_L_2 norm(K(x, dot))^2_L_2 < oo $
  ]
]

#theorem[
  Оператор Гильберта-Шмидта является компактным оператором на $L_2[a, b]$.
]

#proof[
  $L_2[a, b]$ -- сепарабельное гильбертово пространство, поэтому в нём есть
  ортонормированный базис $seq(phi)$.

  Идея состоит в том, чтобы найти последовательность компактных операторов $seq(idx: N, A)$,
  которые сходятся по норме к $A$.

  Итак, можно разложить ядро $K$ по вышеупомянутому базису:
  #eq[
    $K(x, t) = sum_(n,m = 1)^oo c_(n,m)phi_n (x)phi_m (t)$
  ]
  Возьмём за отдельные ядра -- "срезки" от ряда выше:
  #eq[
    $K_N(x, t) = sum_(n, m = 1)^N c_(n, m)phi_n (x) phi_m (t)$
  ]
  Тогда, тривиальным образом, $A_N f(x) = integral_a^b K_N(x, t)f(t) dif mu(t)$,
  который является компактным из-за конечномерности образа.

  Осталось вспомнить, что норма оператора Фредгольма оценивается сверху 2-нормой
  ядра, а значит:
  #eq[
    $norm(A - A_n) <= norm(K - K_n) ->_(N -> oo) 0$
  ]
]

#definition[
  Пусть $H$ -- гильбертово пространство, $seq(e)$ -- его базис. *Классом
  операторов Гильберта-Шмидта* называется следующее множество операторов $A in seq(L)(H)$ таких,
  что
  #eq[
    $sum_(n = 1)^oo norm(A e_n)^2 < +oo$
  ]
]
