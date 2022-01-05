/*
Part 1
주어진 문자열 배열을 seat ID로 변환하고 가장 큰 값을 찾는다.

  1. strToNum 함수 변환 : 
  무엇이 되어야 하는가? string은 int가 되어야한다.
    1-1. array<string> -> array<int> 형태로 변환한다.
  
  2. joinNumberArr 함수 변환 : 
  무엇이 되어야 하는가? 각각의 int는 진법 변환된 값이 되어야 한다. 
    2-1. array<int> -> array<int> 형태로 변환한다.
    2-2. 각각의 원소가 하나의 int 형태가 되어야한다.
    2-3. 2진법으로 표기된 하나의 int는 10진법 형태가 되어야한다.

  3. findHighestSeatId 함수 변환 : 
  가장 큰 값은 무엇인가? 숫자로 된 배열을 역순 정렬한 첫번째 원소이다.
    3-1. array<int>는 역순정렬된 형태가 되어야한다.
    3-2. 가장 큰 값은 정렬된 배열의 첫번째 값이다.
*/

let input = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day5.sample.txt")
let inputArray = Js.String2.split(input, "\n")

let strToNum = (char: string) => {
  char
    ->Js.String2.split("")
    ->Belt.Array.map(s => (s === "F" || s === "L" ? 0 : 1))
}

let joinNumberArr = (num: array<int>) => {
  num
    ->Belt.Array.reduce(0, (acc, x) => acc * 2 + x)
}

let descSort = (n1, n2) => n2 - n1

let makeSeatIds = (inputArray: array<string>) => {
  inputArray
    ->Belt.Array.map(input => input->strToNum)
    ->Belt.Array.map(num => num->joinNumberArr)
    ->Js.Array2.sortInPlaceWith(descSort)
}

let highestSeatId = makeSeatIds(inputArray)[0]
highestSeatId->Js.log

/*
Part 2
주어진 숫자 배열에서 빈 값(연속되지 않는 값)을 찾는다.

1. input으로 들어오는 array에 빈 값이 있다.
2. 빈 값 -1, (), +1 된 수가 list에 있다. ex) 4가 빈 수라면 3, 5가 표시된다.
*** 처음 값과 마지막 값은 제외된다.

  1. toWindows 변환 :
  무엇이 되어야하는가? 두 개의 값을 비교할 수 있는 Tulpe형태의 [(),(), ...] 배열이 되어야한다.
  ex) [(1,2),(2,3),(3,4),(4,6),...]

  2. findEmptySeatId 변환 : 
  empty seat id는 무엇인가? 연속되지 않는 수이다.

  Array<number> => Array<(number, number)>
  (x, y) => abs(x - y) != 1 // boolean
*/

let seatIds = makeSeatIds(inputArray)
let input' = [(1,2),(2,3),(3,4),(4,6),(6,7),(7,9),(9,8)]

let inputList = input'
  ->Belt.List.fromArray


let findEmptySeatId = (list) => {
  list
}

findEmptySeatId(inputList)->Js.log
// inputList->Js.log