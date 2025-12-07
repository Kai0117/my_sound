import React, { useState } from "react";

const NewFormHelper = (props) => {
  const [text, setText] = useState(props.emotion || "");

  return (
    <div>
      <p>React コンポーネントから入力補助</p>

      <input
        type="text"
        value={text}
        placeholder="感情を入力してみてね"
        onChange={(e) => setText(e.target.value)}
        className="border p-2 text-black"
      />

      <p className="mt-2">いまの入力：{text}</p>
    </div>
  );
};

export default NewFormHelper;

