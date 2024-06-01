#import "../conf.typ": *

= Спектр. Резольвента.
== Операторозначные функции комплексного переменного. Аналитичность резольвенты. Спектральный радиус. Основная теорема о спектре
#definition[
  *Резольвентным множеством* оператора $A$ называется следующее множество:
  #eq[
    $rho(A) = {lambda in CC | exists (A - lambda I)^(-1) in cal(L)(E)}$
  ]
  Все $lambda in CC$, попадающие в резольвентное множество, называются
  *регулярными значениями*.
]

#definition[
  *Спектром* оператора $A$ называется дополнение к резольвентному множеству:
  #eq[
    $sigma(A) = CC without rho(A)$
  ]
]

#definition[
  *Резольвентой* оператора $A$ называется любое отображение следующего вида:
  #eq[
    $R_lambda := R(lambda) := (A - lambda I)^(-1), lambda in rho(A)$
  ]
]

#proposition[
  $R(lambda)$ является непрерывной функцией от $lambda$.
]

#proof[
  Положим $B = A - lambda_0 I$ и $Delta B = -Delta lambda I$.

  Как мы уже доказывали выше, мы можем рассмотреть $Delta lambda$ с ограничением $abs(Delta lambda) < 1 / norm(B^(-1))$ и
  тогда $B + Delta B$ будет обратим.

  Для непрерывности, нам нужно оценить норму следующей разности при $Delta lambda -> 0$:
  #eq[
    $norm(R(lambda_0 + Delta lambda) - R(lambda_0)) = norm((B + Delta B)^(-1) - B^(-1))$
  ]
  Распишем $(B + Delta B)^(-1)$ через ряд Неймана следующим образом:
  #eq[
    $(B + Delta B)^(-1) = (I + B^(-1)Delta B)^(-1)B^(-1) &= sum_(k = 0)^oo (-1)^k (B^(-1)Delta B)^k B^(-1) = \ &= B^(-1) + sum_(k = 1)^oo (-1)^k (B^(-1)Delta B)^k B^(-1)$
  ]
  Отсюда можно вернуться к оценке приращение и уже работать с рядом:
  #eq[
    $norm((B + Delta B)^(-1) - B^(-1)) = norm(sum_(k = 1)^oo (-1)^k (B^(-1)Delta B)^k B^(-1)) &<= \
    norm(B^(-1))sum_(k = 1)^oo (norm(B^(-1))norm(Delta B))^k                                 &= norm(B^(-1))dot (norm(B^(-1))norm(Delta B)) / (1 - norm(B^(-1))norm(Delta B)) ->_(Delta B -> 0) 0$
  ]
]

#note[
  Далее будет использоваться обозначение
  #eq[
    $A_lambda := A - lambda I$
  ]
]

#proposition[
  Пусть $lambda_0, lambda in rho(A)$. Тогда
  #eq[
    $R_lambda - R_lambda_0 = (lambda - lambda_0)R_lambda R_lambda_0$
  ]
]

#proof[

  Рассмотрим следующую тривиальную цепочку равенств:
  #eq[
    $R_lambda - R_lambda_0 = R_lambda underbrace(A_lambda_0 R_lambda_0, I) - underbrace(A_lambda R_lambda, I)R_lambda_0 = \ R_lambda(A_lambda_0 - A_lambda)R_lambda_0 &= R_lambda(lambda - lambda_0)R_lambda_0 = (lambda - lambda_0)R_lambda R_lambda_0$
  ]
]

#proposition[
  $R(lambda)$ дифференцируема на $rho(A)$. Более того:
  #eq[
    $R'(lambda_0) = R^2_lambda_0$
  ]
]

#proof[
  Запишем дроби из предела производной:
  #eq[
    $(R_lambda - R_lambda_0) / (lambda - lambda_0) = ((lambda - lambda_0)R_lambda R_lambda_0) / (lambda - lambda_0) = R_lambda R_lambda_0 ->_(lambda -> lambda_0) R^2_lambda_0$
  ]
]

#definition[
  *Спектральным радиусом* оператора $A$ называется радиус окружности с центром в
  нуле, в которую попадают все элементы спектра:
  #eq[
    $r(A) = sup_(lambda in sigma(A))abs(lambda)$
  ]
]

#proposition[
  Если $abs(lambda) > norm(A)$, то $lambda in rho(A)$.
]

#proof[
  Перепишем $A_lambda$ следующим образом:
  #eq[
    $A_lambda = -lambda(I - 1/lambda A)$
  ]
  Так как $norm(A / lambda) = 1 / abs(lambda) norm(A) < 1$, то применима теорема
  об обратимости возмущённого оператора и, соответственно, этот оператор обратим.
  Значит $lambda in rho(A)$ по определению.
]

#corollary[
  Очевидно следует, что $r(A) <= norm(A)$.
]

#proposition[
  Радиус сходимости ряда Неймана для $R(lambda)$ равен спектральному радиусу $r(A)$.
]

#proof[
  $<=$ Мы можем говорить о ряде Лорана. Если $abs(lambda) > norm(A)$, то тогда
  имеет место следующее представление резольвенты:
  #eq[
    $R(lambda) = (A - lambda I)^(-1) = -1/lambda (I - A / lambda)^(-1) = -1 / lambda sum_(k = 0)^oo A^k lambda^(-k)$
  ]
  При этом, ранее было установлено, что $R(lambda)$ дифференцируема на $rho(A)$. В
  частности, это происходит на круге $abs(lambda) > r(A)$.

  Так как представление функции в виде ряда Лорана в круге единственно, а мы уже
  его записали выше для некоторой окрестности бексконечности, то тот же самый вид
  должен быть и в этом круге.

  Значит, радиус сходимости ряда Неймана не превосходит $r(A)$.

  $>=$ Пусть $abs(lambda_0) < r(A)$. Тогда, предположим, что ряд сходится в этой
  точке. Это означает, что ряд будет сходится и при всех $abs(lambda) > abs(lambda_0)$.

  Это также означает обратимость $A_lambda$ при всех таких $lambda$, но коль скоро $abs(lambda_0) < r(A)$,
  то должен существовать $abs(lambda_0) < abs(lambda_1) < r(A)$ такой, что $lambda_1 in sigma(A)$ в
  силу определения спектрального радиуса, а это противоречит определению спектра.
]

#proposition[
  Если $lambda in sigma(A)$, то $lambda^n in sigma(A^n)$.
]

#proof[
  Предположим противное, то есть $lambda^n in rho(A^n)$ и $lambda in sigma(A)$.
  Значит $(A^n - lambda^n I)^(-1) in cal(L)(E)$. Заметим, что мы также можем
  записать обращаемый оператор в следующем виде:
  #eq[
    $A^n - lambda^n I = (A - lambda I)underbrace((A^(n - 1) + ... + lambda^(n - 1)I), B) => I = (A - lambda I)B(A^n - lambda^n I)^(-1)$
  ]
  Так как рассматриваемые операторы -- многочлены от степеней $A$, то они
  коммутируют. С учётом этого имеем, что $A_lambda$ обратим, а стало быть $lambda in rho(A)$,
  противоречие.
]

#proposition[
  Верна формула для спектрального радиуса:
  #eq[
    $r(A) = lim_(n -> oo) root(n, norm(A^n))$
  ]
]

#proof[
  Как мы уже знаем, радиус сходимости ряда Неймана для $R(lambda)$ совпадает с $r(A)$:
  #eq[
    $r(A) = r_"сх" = overline(lim)_(n -> oo) root(n, norm(A^n))$
  ]
  В силу последнего доказанного утверждения, мы можем связать $r(A)$ и $r(A^n)$ следующим
  образом:
  #eq[
    $r(A^n) = sup_(mu in sigma(A^n))abs(mu) >= sup_(lambda in sigma(A))abs(lambda^n) = r(A)^n$
  ]
  Стало быть, $r(A) <= root(n, r(A^n))$. При этом, знаем, что $r(A^n) <= norm(A^n)$.

  Получилось, что верхний предел не превосходит любого элемента последовательности $root(n, norm(A^n))$,
  а это означает, что он не превосходит их нижнего предела. Такое возможно только
  тогда, когда существует просто предел.
]

#theorem("Основная теорема о спектре")[
  Спектр оператора непуст:
  #eq[
    $sigma(A) != 0$
  ]
]

#proof[
  Предположим противное. Тогда $rho(A) = CC$ и, следовательно, $R(lambda)$ является
  целой функцией. Оценим норму этого оператора, пользуясь представлением обратного
  оператора в ряд Неймана:
  #eq[
    $norm(R(lambda)) <= 1 / abs(lambda) dot 1 / (1 - 1 / abs(lambda) norm(A)) ->_(lambda -> oo) 0$
  ]
  Коль скоро есть предел $lim_(lambda -> oo)norm(R(lambda))$, то норма $R(lambda)$ ограничена.
  Стало быть, по теореме Лиувилля $R(lambda) = "const"$. Более того, из-за
  найденного выше предела $R(lambda) = 0$. Это противоречит обратимости $A_lambda$ при
  каком-либо $lambda$.
]

#definition[
  Рассмотрим оператор $A in cal(L)(E)$. Тогда
  - $sigma_p(A) := {lambda in sigma(A) | "Ker" A_lambda != {0}}$ -- *точечный спектр*.
  - $sigma_c(A) := {lambda in sigma(A) | "Ker" A_lambda = {0} and "Im" A_lambda != E and ["Im" A_lambda] = E}$ -- *непрерывный спектр*.
  - $sigma_r(A) := {lambda in sigma(A) | "Ker" A_lambda = {0} and ["Im" A_lambda] != E}$ -- *остаточный спектр*.
]
