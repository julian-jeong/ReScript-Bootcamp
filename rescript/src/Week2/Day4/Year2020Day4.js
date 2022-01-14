"use strict";

const Fs = require("fs");
const input = Fs.readFileSync("input/Week2/Year2020Day4.sample.txt", "utf8");
const passportFields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"];

const makePassports = (input) => {
  const passports = input.split("\n\n");
  const newPassports = passports.map((data) => data.split("\n").join(" "));

  return newPassports;
};

const passportsToMap = (passports) => {
  const passportPair = passports.map((passport) => {
    const pair = passport.split(" ").map((field) => field.split(":"));
    const passportMap = new Map();

    pair.forEach(([field, value]) => {
      passportMap.set(field, value);
    });

    return passportMap;
  });

  return passportPair;
};

const countVaildPassports = (fields, passports) => {
  return passports.filter((passport) =>
    fields.every((field) => passport.has(field))
  );
};

const checkRequiredFields = (input) => {
  const passportArr = makePassports(input);
  const passportsMap = passportsToMap(passportArr);
  const vaildPassport = countVaildPassports(passportFields, passportsMap);

  return vaildPassport.length;
};

console.log(checkRequiredFields(input));
