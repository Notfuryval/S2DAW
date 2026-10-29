// src/components/molecules/AddTodoForm.jsx
import { useState } from 'react'
import Input from '../atoms/Input'
import Button from '../atoms/Button'
import './AddTodoForm.css'

export default function AddTodoForm({ onAdd }) {
  const [text, setText] = useState('')

  const handleSubmit = (event) => {
    event.preventDefault()           // prevents the browser from reloading the page
    const clean = text.trim()
    if (!clean) return
    onAdd(clean)
    setText('')
  }

  return (
    <form className="add-form" onSubmit={handleSubmit}>
      <Input
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="New task..."
      />
      <Button type="submit">Add</Button>
    </form>
  )
}