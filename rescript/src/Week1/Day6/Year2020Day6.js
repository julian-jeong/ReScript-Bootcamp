"use strict";

const Fs = require("fs");
const input = Fs.readFileSync("input/Week1/Year2020Day6.sample.txt", "utf8");

/*
  Part 1
  무엇이 필요한가? 각 그룹에서 "예"라고 답변한 수의 합이 필요하다.
*/

/*
1. 무엇이 필요한가? 그룹별로 묶인 데이터
["adfdsf", "asdfasdf", "", "sdf", "adsfasdf", "sd", "", "sad"]
=> [["adfdsf", "asdfasdf], ["sdf", "adsfasdf", "sd"], ["sad"]]
*/

const makeGroups = (input) => {
  return input.split("\n\n").map((group) => group.split("\n"));
};
/*
2. 무엇이 필요한가? 각 그룹에서 중복없이 "예"라고 답변한 데이터가 필요하다.
*/

const setAnswers = (group) => {
  console.log([...group.join("")]);
  const set = new Set([...group.join("")]);
  return set.size;
};

const answerCounts = (input) => {
  const groups = makeGroups(input);
  const answers = groups.map(setAnswers);
  const result = answers.reduce((prev, curr) => prev + curr);

  return result;
};

console.log(answerCounts(input));
