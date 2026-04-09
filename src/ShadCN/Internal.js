import { twMerge } from "tailwind-merge";
import { clsx } from "clsx";

export function mergeProps(defaults) {
  return function (userProps) {
    var _a = defaults.className;
    var _b = userProps.className;
    var rest = Object.assign({}, defaults, userProps);
    var merged = twMerge(clsx(_a, _b));
    if (merged) rest.className = merged;
    else delete rest.className;
    return rest;
  };
}
