// src/components/templates/TodoTemplate.jsx
import './TodoTemplate.css'

export default function TodoTemplate({ header, form, children }) {
  return (
    <div className="todo-template">
      <header className="todo-template__header">{header}</header>
      <section className="todo-template__form">{form}</section>
      <section className="todo-template__content">{children}</section>
    </div>
  )
}