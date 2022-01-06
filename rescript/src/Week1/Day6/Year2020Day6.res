let input = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day6.sample.txt")
/*
  Part 1
  무엇이 필요한가? 각 그룹에서 "예"라고 답변한 수의 합이 필요하다.
*/

/*
  1. 무엇이 필요한가? 그룹별로 묶인 데이터
  ["adfdsf", "asdfasdf", "", "sdf", "adsfasdf", "sd", "", "sad"]
  => [["adfdsf", "asdfasdf], ["sdf", "adsfasdf", "sd"], ["sad"]]
*/

type splitType = array<string>

let splitStr = (arr, srt) : splitType => {
  arr
    ->Js.String2.split(srt)
}

let makeGroups = (input) => {
  input
    ->splitStr("\n\n")
    ->Belt.Array.map(str => splitStr(str)("\n"))
}

/*
  2. 무엇이 필요한가? 각 그룹에서 **중복없이** "예"라고 답변한 데이터.
*/

let setArray = (arr: array<string>) => {
  arr
    ->Belt.Array.map(str => splitStr(str)(""))
    ->Belt.Array.concatMany
    ->Belt.Set.String.fromArray
}

let countAnswers = (input) => {
  input
    ->makeGroups
    ->Belt.Array.map(setArray)
    ->Belt.Array.map(Belt.Set.String.size)
    ->Belt.Array.reduce(0, (acc, value) => acc + value)
}

countAnswers(input)->Js.log

/*
  Part 2
  무엇이 필요한가? 각 그룹에서 중복으로 "예"라고 답변한 질문의 합.
*/

/*
  1. 무엇이 필요한가?
*/

/*
  2. 무엇이 필요한가?
*/