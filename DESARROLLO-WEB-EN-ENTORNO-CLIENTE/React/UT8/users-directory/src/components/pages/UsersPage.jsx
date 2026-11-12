// src/components/pages/UsersPage.jsx
import { useState, useEffect } from 'react'
import UserList from '../organisms/UserList'

export default function UsersPage() {
  const [users, setUsers] = useState([])

  useEffect(() => {
    fetch('https://jsonplaceholder.typicode.com/users')
      .then((res) => res.json())
      .then((data) => setUsers(data))
  }, [])   // empty array: only once, after mount

  return (
    <main>
      <h1>Users directory</h1>
      <UserList users={users} />
    </main>
  )
}