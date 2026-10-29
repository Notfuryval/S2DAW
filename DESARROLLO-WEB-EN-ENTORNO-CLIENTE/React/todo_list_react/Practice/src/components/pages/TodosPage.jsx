// src/components/pages/TodosPage.jsx
import { useState } from 'react'
import useTodos from '../../hooks/useTodos'
import TodoTemplate from '../templates/TodoTemplate'
import AddTodoForm from '../molecules/AddTodoForm'
import TodoList from '../organisms/TodoList'
import TodoFilters from '../organisms/TodoFilters'
import Badge from '../atoms/Badge'
import Button from '../atoms/Button'

export default function TodosPage() {
  const {
    todos,
    addTodo,
    toggleTodo,
    deleteTodo,
    editTodo,
    deleteCompleted,
  } = useTodos()

  const [filter, setFilter] = useState('all')

  const pending = todos.filter((todo) => !todo.done).length

  const filteredTodos = todos.filter((todo) => {
    if (filter === 'pending') return !todo.done
    if (filter === 'done') return todo.done
    return true
  })

  return (
    <TodoTemplate
      header={<h1>My tasks{' '}<Badge label={pending === 1 ? '1 task remaining' : `${pending} tasks remaining`}/></h1>}
      form={<AddTodoForm onAdd={addTodo} />}
    >
      <TodoFilters filter={filter} onChange={setFilter} />

      <TodoList
        todos={filteredTodos}
        onToggle={toggleTodo}
        onDelete={deleteTodo}
        onEdit={editTodo}
      />

      <br />

      <Button variant="secondary" onClick={deleteCompleted}>
        Delete completed
      </Button>
    </TodoTemplate>
  )
}