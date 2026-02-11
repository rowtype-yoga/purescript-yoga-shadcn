export function fetchTextImpl(url) {
  return function () {
    return fetch(url).then(function (r) {
      if (!r.ok) throw new Error("HTTP " + r.status + ": " + url);
      return r.text();
    });
  };
}
