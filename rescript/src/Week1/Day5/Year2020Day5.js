"use strict";

const Fs = require("fs");
const input = Fs.readFileSync(
  "input/Week1/Year2020Day5.sample.txt",
  "utf8"
).split("\n");

/*
  part 1
  seat ID 중 가장 큰 값을 구한다.
*/

const strToNum = (char) => {
  const str = char.split("");
  const num = str.map((s) => (s === "F" || s === "L" ? 0 : 1));

  return num;
};

const joinNumberArr = (input) => {
  return parseInt(input.join(""), 2);
};

const boardingPassToSeatId = (str) => {
  return joinNumberArr(strToNum(str));
};

const descSort = (array) => {
  array.sort((a, z) => z - a);

  return array;
};

const findHighestSeatId = (arrayNumber) => {
  const sortedArray = descSort(arrayNumber);

  return sortedArray[0];
};

const seatIds = input.map(boardingPassToSeatId);
const highestSeatId = findHighestSeatId(seatIds);

console.log(highestSeatId);

/*
  part 2
  주어진 문자열에서 빈 값을 찾는다.

  내 자리 찾기
  1. input으로 들어오는 값 중 빈값이 있다. 
  2. 빈자리 +1, -1된 숫자가 list에 표기된다. ex) 4가 빈숫자라면 3, 5가 표시된다. 
  ** 맨 처음과 끝은 아니다.  
*/

/* 무엇이 되어야하는가?
  [1,2,3,4,6,7,8] =>
[(1,2),(2,3),(3,4),(4,6),...]
*/

const toWindows = (arr, size) => {
  if (size > arr.length) {
    return arr;
  }

  const pairIds = [];
  const end = arr.length - size;

  for (let i = 0; i <= end; i += 1) {
    pairIds.push(arr.slice(i, i + size));
  }

  return pairIds;
};

/* 무엇이 되어야하는가?
  Array<number> => Array<(number, number)>
  (x, y) => abs(x - y) != 1 // boolean
*/

const compareIds = (ids) => {
  const [a, b] = ids;

  if (Math.abs(a - b) !== 1) {
    return a;
  }
};

const findEmptyIdPairIds = (ids) => {
  const [seatId, _] = ids.find(compareIds);

  return seatId - 1;
};

const findEmptySeatId = (ids) => {
  const pairIds = toWindows(ids, 2);
  const emptyId = findEmptyIdPairIds(pairIds);

  return emptyId;
};

console.log(findEmptySeatId(seatIds));
