// src/components/molecules/TodoItem.jsx
import { useState } from "react";
import Checkbox from "../atoms/Checkbox";
import Button from "../atoms/Button";
import Input from "../atoms/Input";
import "./TodoItem.css";

export default function TodoItem({ todo, onToggle, onDelete, onEdit }) {
  const [isEditing, setIsEditing] = useState(false);
  const [draft, setDraft] = useState(todo.text);

  const save = () => {
    const clean = draft.trim()
    if (!clean) return
    onEdit(todo.id, clean)
    setIsEditing(false)
  }

  return (
    <li className={`todo-item ${todo.done ? "todo-item--done" : ""}`}>
      <Checkbox
        checked={todo.done}
        onChange={() => onToggle(todo.id)}
        id={`todo-${todo.id}`}
      />

      {isEditing ? (
        <Input
          value={draft}
          onChange={(event) => setDraft(event.target.value)}
          placeholder="Edit task..."
        />
      ) : (
        <span className="todo-item__text">{todo.text}</span>
      )}

      {isEditing ? (
        <Button onClick={save}>Save</Button>
      ) : (
        <Button variant="secondary" onClick={() => setIsEditing(true)}>
          Edit
        </Button>
      )}

      <Button variant="danger" onClick={() => onDelete(todo.id)}>
        Delete
      </Button>
    </li>
  );
}