- 型クラスはインターフェイスのようなもの
  - 特定の振る舞い(等値性判定など)を定義する
  - 定義された通りに振る舞う型型クラスのインスタンスのインスタンスにされる
  - 型Tが型クラスTのインスタンスであるとは､型クラスCが定義するメソッドを型Tがに対して使えるということ
- `class Eq a where`で新しい型クラス`Eq`の定義が始まることを意味する
  - `instance Eq TrafficLight where`で新しいインスタンスを作ることができる
  - 別の型クラスのサブクラスである型クラスも作れる
  - `class (Eq a) => Num a where`
  - 多相型を型クラスのインスタンスにするには(`Maybe`など)次のように書く
  - `instance Eq (Maybe m) where`
    - この方法だと`Maybe m`のような格好の型はまとめて`Eq`のインスタンス
    - Maybeの中身がEqとして使える保証がないので型クラス制約が必要
    ```haskell
    instance (Eq m) => Eq (Maybe m) where
      Just x == Just y = x == y
      Nothing == Nothing = True
      _ == _ = False
    ```
    - これでMaybeの中身がEqであることがわかる