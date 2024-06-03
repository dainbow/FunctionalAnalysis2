#import "../conf.typ": *

= Сопряжённый оператор
== Норма сопряжённого оператора (в ЛНП)
#definition[
  Пусть $A : E_1 -> E_2$. Тогда *сопряжённым оператором* $A^* : E_2^* -> E_1^*$ называется
  оператор, удовлетворяющий условию:
  #eq[
    $forall g in E_2^* : forall x in E_1 : space (A^*g)x = g(A x)$
  ]
]

#theorem[
  Пусть $A in cal(L)(E_1, E_2)$. Тогда $A^* in cal(L)(E_2^*, E_1^*)$, причём $norm(A^*) = norm(A)$.
]

#proof[
  Покажем неравенства для норм в 2 стороны:

  $<=$ Верна следующая оценка:
  #eq[
    $forall g in E_2^* : forall x in E_1 : space abs((A^* g)x) = abs(g(A x)) <= norm(g)norm(A x) <= norm(g)norm(A)norm(x)$
  ]
  Из последнего имеем $norm(A^*g) <= norm(A)norm(g)$, что означает $norm(A^*) <= norm(A)$.

  $>=$ Так как $A^* in cal(L)(E_2^*, E_1^*)$, то можно воспользоваться следствием
  теоремы Хана-Банаха для нормы элемента $A x$:
  #eq[
    $forall x in E_1 : space norm(A x) = sup_(norm(g) = 1)abs(g(A x)) = sup_(norm(g) = 1)abs((A^* g)x)$
  ]
  При этом $norm((A^* g)x) <= norm(A^*)dot 1 dot norm(x)$, а значит $norm(A x) <= norm(A^*)norm(x) => norm(A) <= norm(A^*)$.
]

== Сопряжённые операторы в гильбертовом пространстве. Равенство $H = ["Im" A] plus.circle "Ker" A^*$
#definition[
  Пусть $E_1 = H_1, E_2 = H_2$ -- гильбертовы пространства, $A in cal(L)(H_1, H_2)$.
  Тогда *эрмитово сопряжённым оператором* $A^*: H_2 -> H_1$ называется оператор,
  удовлетворяющий условию:
  #eq[
    $forall x in E_1 : forall y in E_2 : space (A x, y)_H_2 = (x, A^*y)_H_1$
  ]
]

#theorem[
  Пусть $H$ -- гильбертово пространство, $A in cal(L)(H)$. Тогда
  #eq[
    $H = ["Im" A] plus.circle "Ker" A^*$
  ]
]

#proof[
  + Покажем, что $("Im" A)^bot = "Ker" A^*$. Для этого рассмотрим произвольный
    элемент ортогонального дополнения:
    #eq[
      $forall y in ("Im" A)^bot : forall x in H : space (A x, y) = 0$
    ]
    Стало быть, для любых $x,y$ выше будет $(x, A^*y) = 0$, а в силу гильбертовости
    пространства это означает, что $A^*y = 0$, что означает $y in "Ker" A^*$.
  + Заметим, что $("Im" A)^bot = ["Im" A]^bot$. Так как последнее является
    подпространством, то по теореме о проекции получаем требуемое разложение:
    #eq[
      $H = ["Im" A] plus.circle ["Im" A]^bot = ["Im" A] plus.circle "Ker" A^*$
    ]
]

#proposition[
  Если $A in cal(L)(H)$, где $H$ -- гильбертово, то оператор $A^*$ (эрмитово сопряжённый) ограничен снизу.
]

#proof[
  Заметим, что свойство ограниченности снизу имеет эквивалентный вариант (в силу линейности):
  #eq[
    $exists m > 0 : forall x in H : space norm(A^* x) >= m norm(x) <=> exists m > 0 : forall x in H : norm(A^* x) = 1 : space norm(x) <= 1 / m$
  ]
  Обозначим рассматриваемое подпространство
  #eq[
    $S := {x in H | norm(A^* x) = 1}$
  ]
  Таким образом, задача свелась к доказательству ограниченности $S$.

  А как мы знаем, ограниченность эквивалентна слабой ограниченности. Более того, мы находимся в Гильбертовом пространстве $H$, а значит каждый функционал представляется в виде $(y, dot)$:
  #eq[
    $forall y in H : exists K_y in RR_+ : space forall x in S : abs((y, x)) <= K_y$
  ]
  Однако, $A$ -- сюръекция, а значит для любого $y in H$ найдётся $z in H$ такой, что $A z = y$. Отсюда:
  #eq[
    $forall z in H : exists K_z in RR_+ : space forall x in S : abs((A z, x)) = abs((z, A^* x)) <= 1 dot norm(z) =: K_z$
  ]
]

#proposition[
  Пусть $B in cal(L)(H)$ и $B$ ограничен снизу. Тогда $["Im" B] = "Im" B$.
]

#proof[
  Пусть $seq(y) subset "Im" B$ и $lim_(n -> oo) y_n = y$. Докажем, что $y in "Im" B$. 

  В силу сходимости есть и фундаментальность:
  #eq[
    $forall epsilon > 0 : exists N in NN : space forall n >= N : forall p in NN : space norm(y_(n + p) - y_n) < epsilon$
  ]
  Коль скоро $y_n in "Im" B$, то можно переписать норму разности следующим образом:
  #eq[
    $norm(y_(n + p) - y_n) = norm(B z_(n + p) - B z_n) > m norm(z_(n + p) - z_n)$
  ]
  Стало быть, $seq(z)$ фундаментальна, а в силу полноты $H$ должен существовать предел $lim_(n -> oo) z_n = z$. Тогда
  #eq[
    $y = lim_(n -> oo) B z_n = B(lim_(n -> oo) z_n) = B z$
  ]
]
