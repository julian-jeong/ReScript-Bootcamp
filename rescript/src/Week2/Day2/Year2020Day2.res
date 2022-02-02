/* 
  Day 2: Password Philosophy
*/
open Belt

type password = {
  min: int,
  max: int,
  keyword: string,
  password: string,
}

let input = Node.Fs.readFileAsUtf8Sync("input/Week2/Year2020Day2.sample.txt")
  ->Js.String2.split("\n")
  ->Array.map(char => char->Js.String2.split(" "))

let inputToPasswordType = 
  input
  ->Array.map(password => {
    let range = password->Array.getExn(0)->Js.String2.split("-")
    let keyword = password->Array.getExn(1)->Js.String.get(0)
    let password = password->Array.getExn(2)

    {
      min: range->Array.getExn(0)->Int.fromString->Option.getWithDefault(0),
      max: range->Array.getExn(1)->Int.fromString->Option.getWithDefault(0),
      keyword: keyword,
      password: password
    }
  })

let part1 = 
  inputToPasswordType
  ->Array.keep(password => {
    let length = password.password->Js.String2.split("")->Array.keep(char=> char == password.keyword)->Array.length

    length >= password.min && length <= password.max
  })

part1->Array.length->Js.log

let part2 = 
  inputToPasswordType
  ->Array.keep(password => {
    let first = password.password->Js.String.get(password.min - 1)
    let end = password.password->Js.String.get(password.max - 1)
    let keyword = password.keyword

    (first == keyword && end != keyword) || (first != keyword && end == keyword)
  })

part2->Array.length->Js.log

/*
let checkValidPasswordsPart1 = (acc, curr) => {
  let charMatches = 
    curr.password
      ->Js.String2.split("")
      ->Array.keep((str) => str == curr.keyword)
      ->Array.length

  let (min, max) =
    switch Some(curr.range) {
    | Some([min, max]) => (min, max)
    | _ => (0, 0)
    }

  charMatches >= min && charMatches <= max ? acc + 1 : acc
}

let checkValidPasswordsPart2 = (acc, curr) => {
  let (min, max) =
    switch Some(curr.range) {
    | Some([min, max]) => (min, max)
    | _ => (0, 0)
    }

  let minValue = Js.String2.get(curr.password, min - 1) == curr.keyword ? 1 : 0
  let maxValue = Js.String2.get(curr.password, max - 1) == curr.keyword ? 1 : 0

  minValue + maxValue == 1 ? acc + 1 : acc
} 

let countValidPasswords = (input) => {
  let part1 = 
  input
  ->inputToPasswordType
  ->Array.reduce(0, checkValidPasswordsPart1)

  let part2 = 
  input
  ->inputToPasswordType
  ->Array.reduce(0, checkValidPasswordsPart2) 
  (part1, "part1", part2, "part1")
}

countValidPasswords(input)->Js.log
*/