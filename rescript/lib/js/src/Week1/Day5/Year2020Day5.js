// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict";

var Fs = require("fs");
var Belt_List = require("rescript/lib/js/belt_List.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var Caml_array = require("rescript/lib/js/caml_array.js");

var input = Fs.readFileSync("input/Week1/Year2020Day5.sample.txt", "utf8");

var inputArray = input.split("\n");

function strToNum($$char) {
  return Belt_Array.map($$char.split(""), function (s) {
    if (s === "F" || s === "L") {
      return 0;
    } else {
      return 1;
    }
  });
}

function joinNumberArr(num) {
  return Belt_Array.reduce(num, 0, function (acc, x) {
    return ((acc << 1) + x) | 0;
  });
}

function descSort(n1, n2) {
  return (n2 - n1) | 0;
}

function makeSeatIds(inputArray) {
  return Belt_Array.map(
    Belt_Array.map(inputArray, strToNum),
    joinNumberArr
  ).sort(descSort);
}

var highestSeatId = Caml_array.get(makeSeatIds(inputArray), 0);

console.log(highestSeatId);

var seatIds = makeSeatIds(inputArray);

var input$p = [
  [1, 2],
  [2, 3],
  [3, 4],
  [4, 6],
  [6, 7],
  [7, 9],
  [9, 8]
];

var inputList = Belt_List.fromArray(input$p);

function findEmptySeatId(list) {
  return list;
}

console.log(inputList);

exports.input = input;
exports.inputArray = inputArray;
exports.strToNum = strToNum;
exports.joinNumberArr = joinNumberArr;
exports.descSort = descSort;
exports.makeSeatIds = makeSeatIds;
exports.highestSeatId = highestSeatId;
exports.seatIds = seatIds;
exports.input$p = input$p;
exports.inputList = inputList;
exports.findEmptySeatId = findEmptySeatId;
/* input Not a pure module */