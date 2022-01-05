"use strict";

const Fs = require("fs");

const input = Fs.readFileSync(
  "input/Week1/Year2020Day3.sample.txt",
  "utf8"
).split("\n");

const slope = {
  right: 3,
  down: 1
};

const treeToOne = (char) => (char === "#" ? 1 : 0);

// input => Array<Array<string>>

const makeCoords = (slope, input) => {
  const ret = [];

  let newRight = 0;

  for (let i = slope.down; i < input.length; i += slope.down) {
    newRight += slope.right;
    ret.push([newRight % input[i].length, i]);
  }

  return ret;
};

const getByCoord = (coord, input) => {
  const [right, down] = coord;
  return input[down][right];
};

// Array<slope>

const treeCounts = (input) => (slope) => {
  const coords = makeCoords(slope, input);
  const strings = coords.map((coord) => getByCoord(coord, input));
  const numbers = strings.map((s) => treeToOne(s));
  const result = numbers.reduce((acc, curr) => acc + curr, 0);

  return result;
};

console.log(treeCounts(input)(slope));

exports.treeCounts = treeCounts;
