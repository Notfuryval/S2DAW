// src/hooks/useTodos.js
import { useState } from 'react'

const initialTodos = [
  { id: 1, text: 'Learn JSX', done: true },
  { id: 2, text: 'Practice props', done: false },
]

export default function useTodos() {
  const [todos, setTodos] = useState(initialTodos)

  const addTodo = (text) =>
    setTodos([...todos, { id: crypto.randomUUID(), text, done: false }])

  const toggleTodo = (id) =>
    setTodos(
      todos.map((todo) =>
        todo.id === id ? { ...todo, done: !todo.done } : todo
      )
    )

  const deleteTodo = (id) =>
    setTodos(todos.filter((todo) => todo.id !== id))

  const editTodo = (id, text) =>
    setTodos(
      todos.map((todo) =>
        todo.id === id ? { ...todo, text } : todo
      )
    )

  const deleteCompleted = () =>
    setTodos(todos.filter((todo) => !todo.done))

  return {
    todos,
    addTodo,
    toggleTodo,
    deleteTodo,
    editTodo,
    deleteCompleted,
  }
}