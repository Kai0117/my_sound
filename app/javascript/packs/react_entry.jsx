import React from "react";
import ReactDOM from "react-dom/client"; // React 18+
import HelloText from "../components/HelloText";

document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("hello-text");
  if (el) {
    const root = ReactDOM.createRoot(el); // React 18 用
    root.render(<HelloText text="テスト文字列" />);
  }
});
