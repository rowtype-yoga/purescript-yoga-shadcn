import { DayPicker } from "react-day-picker";

export const dayPicker = DayPicker;

export function mergeProps(a) {
  return function (b) {
    return { ...a, ...b };
  };
}
