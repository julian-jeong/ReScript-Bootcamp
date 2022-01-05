/*
  Tuple
  1. 불변성을 유지한다.
  2. 순서를 보장한다.
  3. 만들어지는 당시에 크기가 결정된다.
  4. 다른 자료형을 포함할 수 있다.
  Tuple은 local로 사용하는 것을 추천합니다. 전역적으로 사용해야하는 경우 Record를 이용하세요!
*/

let myTuple: (int, string) = (1, "hello")
let my_tuple: (int, string) = (5, "hello")

myTuple->Js.log

type myType = (int, int, float)

let tuple: myType = (1, 3, 5.2)
tuple->Js.log

let (_, y, _) = tuple
let (intType, _) = my_tuple
let (_, stringType) = my_tuple
let (my_int, my_str) = my_tuple

y->Js.log
intType->Js.log
stringType->Js.log

(my_int, my_str)->Js.log