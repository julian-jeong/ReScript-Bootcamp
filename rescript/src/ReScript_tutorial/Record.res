/*
  Record
  1. 불변이다. 
  2. 고정된 필드를 가지고 있다.
*/

type person = {
  age: int
}

let hyo: person = {
  age: 10
}

hyo->Js.log

type student = {
  name: string,
  age: int, 
  school: string
}

let hyojeong: student = {
  name: "hyojeong", 
  age: 20,
  school: "A university"
}

let susan: student = {
  name: "susan", 
  age: 20,
  school: "B university"
}

// 스프레드 연산자를 사용하여 불변성을 유지하면서 변경할 수 있다. 
let new_Hyojeong: student = {
  ...hyojeong,
  school: "C university"
}

hyojeong->Js.log
new_Hyojeong->Js.log