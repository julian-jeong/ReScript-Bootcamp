"use strict";

const Fs = require("fs");

const input = Fs.readFileSync(
  "input/Week1/Year2020Day3.sample.txt",
  "utf8"
).split("\n");

const { treeCounts } = require("../Week1/Year2020Day3.js");

const slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
];

const treeCountsWithInput = treeCounts(input);
const allTreeCounts = slopes.map((slope) => treeCountsWithInput(slope));

console.log(allTreeCounts); // [ 80, 162, 77, 83, 37 ]

const allTrees = allTreeCounts.reduce((prev, curr) => prev * curr);

console.log(allTrees); // 3064612320
