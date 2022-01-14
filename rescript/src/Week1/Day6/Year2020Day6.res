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

let splitStr = (arr, srt) => {
  arr
    ->Js.String2.split(srt)
}

let makeGroups = (input) => {
  input
    ->splitStr("\n\n")
    ->Belt.Array.map(str => splitStr(str, "\n"))
}

let groups = makeGroups(input)

/*
  2. 무엇이 필요한가? 각 그룹에서 **중복없이** "예"라고 답변한 데이터.
*/

let setGroupAnswer = (arr) => {
  arr
    ->Belt.Array.map(splitStr(""))
    ->Belt.Array.concatMany
    ->Belt.Set.String.fromArray
}

let answersCount = (groups) => {
  groups
    ->Belt.Array.map(setGroupAnswer)
    ->Belt.Array.map(Belt.Set.String.size)
    ->Belt.Array.reduce(0, (acc, value) => acc + value)
}

/*
  Part 2
  무엇이 필요한가? 각 그룹에서 공통으로 "예"라고 답변한 질문의 합. 문자들의 교집합.
*/

/*
  1. 무엇이 필요한가? 각 그룹에서 체크된 답의 교집합

  교집합을 쉽게 구하는 자료구조가 있을까? 있다면 그게 뭐지?
  문자열을 set으로 변경한다면 이걸 쉽게 할 수 있다. 

  intersect("abc", "bcd") => "bc"
  Belt.Set.String.intersect("abc"->Belt.Set.String, "bcd"->Belt.Set.String) => "bc"->Belt.Set.String
  비교에 가장 적합한 자료형과 메서드를 찾아 비교한다.
*/

let stringToSet = (str) => // 필요한 List 자료형으로 변환한다.
  str
  ->Js.String2.split("")
  ->Belt.Set.String.fromArray

// let intersect = (arr, empty) => {
//   Belt.Array.reduce(arr, empty, Belt.Set.String.intersect)
// }

let intersectAnswersToSet = (group) => {
  group // Array<string>
  ->Belt.Array.map(stringToSet) //Array<Belt.Set.String>
  ->Belt.Array.reduce("abcdefghijklmnopqrstuvwxyz"->stringToSet, Belt.Set.String.intersect)
}

let intersectAnswersCount = (groups) => {
  groups
  ->Belt.Array.map(intersectAnswersToSet)
  ->Belt.Array.map(Belt.Set.String.size)
  ->Belt.Array.reduce(0, (a, b) => a + b)
}

intersectAnswersCount(groups)->Js.log

/*
여러줄로 된 답변중에서 전체 문자열들의 교집합

union("???", "abc") => "abc"
union("abc", "ab") => "ab"
union("ab", "a") => "a"

"abcdefghijklmnopqrstuvwxyz"
["abc", "ab", "a"].reduce((union, str) => union <+> str, "") => "a"
=>  ??? <+> "abc" <+> "ab" <+> "a" => "a"

"abcdefghijklmnopqrstuvwxyz" <+> x => x

["ab", "ac"] => "a"
["bc", "ac"] => "c"

[1,2,3,4] => 10
[1,2,3,4].reduce((total, value) => total * value, 1)
=> 1 * 1 * 2 * 3 * 4 == 0

0 + x = x
1 * x = x

let plus(x, y) = x + y
[1,2,3,4].reduce(plus, 1)

plus(0, 1) => 1
plus(1, 2) => 3
plus(3, 3) => 6
plus(6, 4) => 10
*/