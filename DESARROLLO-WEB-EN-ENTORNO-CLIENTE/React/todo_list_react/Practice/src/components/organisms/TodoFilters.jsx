// src/components/organisms/TodoFilters.jsx
import Button from "../atoms/Button";
import "./TodoFilters.css";

const FILTERS = [
  { id: "all", label: "All" },
  { id: "pending", label: "Pending" },
  { id: "done", label: "Done" },
];

export default function TodoFilters({ filter, onChange }) {
  return (
    <div className="todo-filters">
      {FILTERS.map(({ id, label }) => (
        <Button
          key={id}
          variant={filter === id ? "primary" : "secondary"}
          onClick={() => onChange(id)}
        >
          {label}
        </Button>
      ))}
    </div>
  );
}